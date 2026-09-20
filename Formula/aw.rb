class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.11.1/aw-v1.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "b76d7d5520377126a644ad0076779a012b250e2816502895cd135c1ef58e6d59"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.11.1/aw-v1.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "88d2eaa8fec49ba7761005187bc84d0b1231e9f802e9762b2812dfa8d3959a9c"
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
