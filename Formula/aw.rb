class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.15.0/aw-v1.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "ce438343be52324e1826730c7fdc138fb7dd3d4e3b8a5e2786e541ca8e88507c"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.15.0/aw-v1.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "37b0b185ef44cbe00d5772556b9fa1fb10ed7b66ff7304a80adad1f2d454cda2"
    end
  end

  depends_on :macos
  depends_on "git"
  depends_on "tmux"

  def install
    bin.install "aw"
  end

  def caveats
    <<~EOS
      Get started:
        aw install all      # shell hook + agent hooks + tmux bindings
        aw edit-config      # configure your repos / local files
        aw init             # materialize the default base
        aw create my-task   # create a workspace
        aw dash             # open the agent dashboard

      Upgrade later: `brew upgrade aw` — or use the built-in
      `aw self update` which fetches the same release tarballs.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aw --version")
  end
end
