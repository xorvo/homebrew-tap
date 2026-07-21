class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.8.0/aw-v1.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "2d88d56566797647d37b86327d325a2cfeb0215ab8a78e0f5aff57416ca6bb21"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.8.0/aw-v1.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "a757defcacb4e99da84795c464cb23da13c1aa843d10a3c230a76cde13b64171"
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
