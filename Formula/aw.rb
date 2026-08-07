class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.9.0/aw-v1.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "ea6f0c0c4deceed4c5d367a890e1932d9156a0b88c1209f29dfa87d9310078f3"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.9.0/aw-v1.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "abd912a131052b30642c99d953dd246a5ac817f1a63e41a3a2f4b77bffebac10"
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
