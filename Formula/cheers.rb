class Cheers < Formula
  desc "Delightful macOS notification tool"
  homepage "https://github.com/xorvo/cheers"
  url "https://github.com/xorvo/cheers/archive/refs/tags/v2.0.1.tar.gz"
  sha256 "cf3df1358d5fab4c3aaf98dda788b517cb6288971f4f7b64e46d34da19bd3666"
  license "MIT"

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
