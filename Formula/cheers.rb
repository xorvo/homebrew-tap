class Cheers < Formula
  desc "Delightful macOS notification tool"
  homepage "https://github.com/xorvo/cheers"
  url "https://github.com/xorvo/cheers/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
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
    (app_bundle/"Contents").install_plist({
      "CFBundleExecutable" => "cheers",
      "CFBundleIdentifier" => "com.xorvo.cheers",
      "CFBundleName" => "cheers",
      "CFBundleDisplayName" => "Cheers",
      "CFBundlePackageType" => "APPL",
      "CFBundleShortVersionString" => version.to_s,
      "CFBundleVersion" => "1",
      "LSMinimumSystemVersion" => "10.14",
      "CFBundleIconFile" => "Cheers",
      "LSUIElement" => true,
      "NSUserNotificationAlertStyle" => "alert"
    })
    
    # Copy icon if available
    if File.exist?("Cheers.icns")
      cp "Cheers.icns", app_bundle/"Contents/Resources/Cheers.icns"
    end
    
    # Code sign the app bundle
    system "codesign", "-s", "-", "--force", "--deep", app_bundle
    
    # Create symlink in bin
    bin.install_symlink app_bundle/"Contents/MacOS/cheers"
  end

  test do
    # Test that the binary runs and shows help
    assert_match "Cheers - A delightful macOS notification tool", shell_output("#{bin}/cheers --help 2>&1", 0)
  end
end