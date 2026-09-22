class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.12.1/aw-v1.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "3c53628a12a73ea6b6d6627cd0ad90ea1f224682e62b17365da578a05b8ab0e7"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.12.1/aw-v1.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "e94c3f9d221913ab3bccd943e325b0e63ff78a3658039c4c734f0e858cd46b45"
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
