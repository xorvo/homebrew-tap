class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.17.1/aw-v1.17.1-aarch64-apple-darwin.tar.gz"
      sha256 "7c76830d8d5418b729bb1befabe4177087201056b9b121fd113b681adcdc097b"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.17.1/aw-v1.17.1-x86_64-apple-darwin.tar.gz"
      sha256 "8e2b14223e927b9d3b593df8fb6d2603353e73440492f7db32a7a2424b4d3fb8"
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
