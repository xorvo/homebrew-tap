class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.13.0/aw-v1.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "a675dbfc8e83c515a11248cb9760cd3d73e10204a12d637d068d29beea0de862"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.13.0/aw-v1.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "e8000b2166ee40ce2975bc331f5b5bc7d4920169200244fc1e7b2f99efd3cf7d"
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
