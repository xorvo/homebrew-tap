class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.0.2/aw-v1.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "0a37499bb9611292eb41ed4fd6dc8efad35485f1ebd718b5e08c0556c89576eb"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.0.2/aw-v1.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "acf891cb74035021efcb092f98b9ded0e0a2429750e0d253a8226c2725b4e42e"
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
