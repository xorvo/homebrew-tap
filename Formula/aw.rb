class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.9.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.9.2/aw-v1.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "c192eb2a51608a8b5cd4e0880efe53a27737adc82e5b66982ab32523ece5fc4a"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.9.2/aw-v1.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "27eaf128cc93af6a87eed7b8451783b13e02dc447686344a40a6f3b59babc6e2"
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
