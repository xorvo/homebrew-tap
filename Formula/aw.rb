class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.3.0/aw-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "8f4dc1ca2e7f7d0ec8bb836ee1d40011f16225fbc2eb1ba47c048e1baaf7dae9"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.3.0/aw-v1.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "9ce617ea97132d43250262a88a68c284b4ca989f22e90d495ab87eabc4ea6ff6"
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
