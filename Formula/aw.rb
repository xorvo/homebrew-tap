class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.2.2/aw-v1.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "a1444693e26281c2b3610506766022e5cfad30be3b37093aff3a1ccfa75b76cb"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.2.2/aw-v1.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "873323477bebea4aeacd375b3b3a8d0bd10c795afe47efd643d57079253411a0"
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
