class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.6.0/aw-v1.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "e56ef42f8d1377985365f9a223b8a7300fbc2da34dacf5064ad9b55ec71e534d"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.6.0/aw-v1.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "68f2f623d46ca4841ef309e87ae33385d9edd9650d9ba5c60ad85024e0728a15"
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
