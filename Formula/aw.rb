class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.0.3/aw-v1.0.3-aarch64-apple-darwin.tar.gz"
      sha256 "045f8bd8278e29bb1aa947b8cfaf7b28be787624cd6107120781d89adc75760a"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.0.3/aw-v1.0.3-x86_64-apple-darwin.tar.gz"
      sha256 "dc5e1b778260ffbc39354c999abbe5d87538edeed7e358ee28d4dd8dfe75603f"
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
