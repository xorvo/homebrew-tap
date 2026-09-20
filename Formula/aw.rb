class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.9.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.9.3/aw-v1.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "38b6618071b6c9f274c8aeb29d90eb8a1534d9f91940f7791bdfa11d665b0f19"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.9.3/aw-v1.9.3-x86_64-apple-darwin.tar.gz"
      sha256 "a999a90337d060f5cf633d52e4a7bce35df783ca5203483527a8fe059cb0c826"
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
