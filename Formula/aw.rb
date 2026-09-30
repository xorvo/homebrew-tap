class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.17.0/aw-v1.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "8f410f6943d83729830e3a9814a1ed258d7f84075091ea12295a3ebf5311af3d"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.17.0/aw-v1.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "c86217e7fb7ef81a8c49c8d814746378eb24b08f6b7e63231503eacdb9b28952"
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
