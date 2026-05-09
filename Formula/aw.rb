class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.1.0/aw-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "26c1163e09d71f9dba26050d6be0748b2e60057eb04e802af9ad6e91b9e20b5a"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.1.0/aw-v1.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "a7b2a4b74b139430402f5b78b7082c3b25f010218bc56e3be68f931c9e8df54c"
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
