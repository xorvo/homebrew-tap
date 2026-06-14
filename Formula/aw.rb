class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.7.1/aw-v1.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "8824db2d5d411ebe227fbd91246448889dfe55aa05d355df08cd58725c30b9e4"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.7.1/aw-v1.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "770e2e7c9b3a1e24b65eeccdac98593d966a892964be4f3bfd0568bd5effb310"
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
