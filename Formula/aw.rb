class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.9.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.9.1/aw-v1.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "092a8386ec448d4fc424f930f08593760b2b97d9b28ee6cac69bbca9272fea14"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.9.1/aw-v1.9.1-x86_64-apple-darwin.tar.gz"
      sha256 "c4d15e51572beee24cbde766c86e095b7c4252097ba2df64f909852d86938e28"
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
