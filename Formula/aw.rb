class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.4.0/aw-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "3158c0a3e31667976716f86fe31b1158ae54ddfb2ae5d986ee9194dc09dfd514"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.4.0/aw-v1.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "536abe819343d363856ccefc19efe99cffd1455ad45a2826c43ed4031370ff13"
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
