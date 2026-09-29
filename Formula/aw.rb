class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.15.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.15.1/aw-v1.15.1-aarch64-apple-darwin.tar.gz"
      sha256 "f872f26e41cbf9c0de591070b2928e7ad807b5cc64e64253f54bce861cad66bf"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.15.1/aw-v1.15.1-x86_64-apple-darwin.tar.gz"
      sha256 "8a95da3e863f4507b27bdfb79ddedec27efa816f5d2c0858d189b2b84836d2e2"
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
