class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.0.1/aw-v1.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "9acadc841d648ed9549dacd4c6889fe9c5eb9db37f8c26f09c285809e12bdf06"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.0.1/aw-v1.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "1d14857eae8b511f079280f0c67dc6a7291bb834ee302e24f043f80bb430e707"
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
