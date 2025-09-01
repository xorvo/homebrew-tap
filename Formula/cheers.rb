class Cheers < Formula
  desc "Delightful macOS notification tool"
  homepage "https://github.com/xorvo/cheers"
  url "https://github.com/xorvo/cheers/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "fea722a10d5933d1c23a467e46d68334d0c751dabe06b03cd3ddc1a53017fc21"
  license "MIT"

  depends_on :macos => :mojave

  def install
    system "swiftc", "cheers.swift", "-o", "cheers",
           "-framework", "UserNotifications",
           "-framework", "AppKit"
    
    # Create app bundle structure
    app_bundle = prefix/"cheers.app"
    (app_bundle/"Contents/MacOS").mkpath
    (app_bundle/"Contents/Resources").mkpath
    
    # Move executable to app bundle
    cp "cheers", app_bundle/"Contents/MacOS/cheers"
    
    # Create Info.plist
    (app_bundle/"Contents/Info.plist").write <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>CFBundleExecutable</key>
        <string>cheers</string>
        <key>CFBundleIdentifier</key>
        <string>com.xorvo.cheers</string>
        <key>CFBundleName</key>
        <string>cheers</string>
        <key>CFBundleDisplayName</key>
        <string>Cheers</string>
        <key>CFBundlePackageType</key>
        <string>APPL</string>
        <key>CFBundleShortVersionString</key>
        <string>#{version}</string>
        <key>CFBundleVersion</key>
        <string>1</string>
        <key>LSMinimumSystemVersion</key>
        <string>10.14</string>
        <key>CFBundleIconFile</key>
        <string>Cheers</string>
        <key>LSUIElement</key>
        <true/>
        <key>NSUserNotificationAlertStyle</key>
        <string>alert</string>
      </dict>
      </plist>
    EOS
    
    # Copy icon if available
    if File.exist?("Cheers.icns")
      cp "Cheers.icns", app_bundle/"Contents/Resources/Cheers.icns"
    end
    
    # Code sign the app bundle
    system "codesign", "-s", "-", "--force", "--deep", app_bundle
    
    # Install launcher script instead of direct symlink
    # This ensures we always run through the app bundle for proper notification handling
    (bin/"cheers").write <<~EOS
      #!/bin/sh
      exec open -n "#{app_bundle}" --args "$@"
    EOS
    (bin/"cheers").chmod(0755)
  end

  test do
    # Test that the binary runs and shows help
    assert_match "Cheers - A delightful macOS notification tool", shell_output("#{bin}/cheers --help 2>&1", 0)
  end
end