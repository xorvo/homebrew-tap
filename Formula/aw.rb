class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.5.1/aw-v1.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "39da2025d4468f40219c82a0cb131d2c4a792ea34b9deeb7bccf6e684b5c8828"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.5.1/aw-v1.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "9b5e2fd33c8a245a5d213b9b0fc466c1fea3613dd40941614dfbbb74f08eef99"
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
