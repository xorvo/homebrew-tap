class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.2.3/aw-v1.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "aa01984ba3a085ecf4ff064b4770ac9bc3428be1bcff7447661332eac2aae2ca"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.2.3/aw-v1.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "8147e187718c93bf6704a74731d70f5c906e73bb3ac3181458de0d1d55f3df19"
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
