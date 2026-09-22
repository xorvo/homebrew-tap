class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.12.0/aw-v1.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "3820103bab4b4e79accb27183122a244ae30ce6b1c6789fe7a67ee3bd2e643dc"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.12.0/aw-v1.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "a2716c8652d880dffba66e1f429ea15adfcd489a29d90de176bae051fc43abf9"
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
