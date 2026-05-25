class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.5.0/aw-v1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "90b7f6ca136775fd6b5ea25632bf5b679fae84d3670cba11af2dfdc49cece826"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.5.0/aw-v1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "6995321d9fe70e63b9d6e0165862a27e8764260e815608ddd30cc628604291e5"
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
