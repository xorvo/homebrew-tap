class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.0.0/aw-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "f009c8ddcd29cd6e08e0f65e9278e22cef84804826cb3e0de0bc3a04c8cf63a3"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.0.0/aw-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "c4a76db020322ee1ab24fbba8990a8134cff6a8d4bb3f0025f957845f9f8075c"
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
