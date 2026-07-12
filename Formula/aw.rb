class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.7.2/aw-v1.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "8c98ebf9a4a3e3cf5d23ffd02dc721e98ab0d18a940f347448202c24fac8b7a5"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.7.2/aw-v1.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "ddefb06f3e330e9438a93f28b9027dd2ba8117c9abf57e699de1c4c1ab623512"
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
