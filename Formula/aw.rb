class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.14.0/aw-v1.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "cb2b29dd8294644937fa2228181012766bdc0005db146f108eb39977c429b97b"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.14.0/aw-v1.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "9ec792f4103a3cda2a9369e4a5ba3ea323628ccb57a75c2fc9bce0ce3b5d1706"
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
