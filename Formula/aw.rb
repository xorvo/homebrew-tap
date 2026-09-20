class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.10.0/aw-v1.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "be31b02adaaae1bb3ffa58aacc8e88ceb823b2223a7128f4c47a097e96a3b7bf"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.10.0/aw-v1.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "ac7e33ca4167faf03cf0f33eb29b6bd6fddb873fffc1f0334769bc440144497e"
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
