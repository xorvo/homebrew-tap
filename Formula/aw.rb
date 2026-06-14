class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.7.0/aw-v1.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "4422f06aff9f1dcb9e9c80b25de166daf6c03395e8636f4a5644e8983b3956ac"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.7.0/aw-v1.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "1874d0e9243126649973bc63dbc0dddee4e9c1d40c7972a61f4e7f346f9ccc8d"
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
