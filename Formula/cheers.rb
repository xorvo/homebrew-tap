class Cheers < Formula
  desc "Delightful macOS notification tool"
  homepage "https://github.com/xorvo/cheers"
  url "https://github.com/xorvo/cheers/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "7e6c6dbb6f2240a503c079659a7b911df5cba10bd2976c0c4aa74336dbcd0ed2"
  license "MIT"

  depends_on macos: :ventura

  def install
    # --disable-sandbox: SPM's own build sandbox can't nest inside Homebrew's
    system "make", "build", "VERSION=#{version}",
           "SWIFT_BUILD_FLAGS=--disable-sandbox"

    # Install the whole app bundle, then an exec wrapper (NOT a symlink:
    # symlinks break Bundle.main so notifications fail; NOT `open -n`:
    # that detaches stdio/exit codes, breaking --wait and `cheers run`).
    prefix.install "build/cheers.app"
    bin.write_exec_script prefix/"cheers.app/Contents/MacOS/cheers"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cheers --version")
    assert_match "Clink", shell_output("#{bin}/cheers sounds")
  end
end
