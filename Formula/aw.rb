class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.15.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.15.2/aw-v1.15.2-aarch64-apple-darwin.tar.gz"
      sha256 "51d320834cacf220b60a483c7981a75fdcf6b8aff4040bddba8940b3570bb1bb"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.15.2/aw-v1.15.2-x86_64-apple-darwin.tar.gz"
      sha256 "995137f702c506b5a34d414e3a34b636c017a5af32b40f89489101c5947992da"
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
