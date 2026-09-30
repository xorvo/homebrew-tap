class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.18.0/aw-v1.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "ca689071b18d6f20beb722112c58c26dbbfd4bb46e0998f466a10d0d1d53d1f5"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.18.0/aw-v1.18.0-x86_64-apple-darwin.tar.gz"
      sha256 "71485dfb63904f0252d8482eebdf6623be2fd0b57d09dee9e83e3c971984bb6b"
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
