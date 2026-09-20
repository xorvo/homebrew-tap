class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.11.0/aw-v1.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "d1e12d4183aca3bf0766670b818be4e4a3c36f6afb7526566edc619056bf91f8"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.11.0/aw-v1.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "a433035539571189af25cda0b6dc0e701538261b3a1d02e970eb71acd54db4e5"
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
