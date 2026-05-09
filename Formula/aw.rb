class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.2.1/aw-v1.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "f02dbbb2fba5830a6053cda96506e73f490fc1492e471aee5742a06d8c076268"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.2.1/aw-v1.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "dbb04df9c145bbc31f5f4dcad6019b6c0bdd81979a777f3f35eb70983f75f174"
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
