class Aw < Formula
  desc "Isolated workspaces for AI agents, with a tmux-based live dashboard"
  homepage "https://github.com/xorvo/aw"
  version "1.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/xorvo/aw/releases/download/v1.16.0/aw-v1.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "3d02f466fa5cef783ce293244f3dcebc1d3b8a29294d6d3fb393ac1b147bbb94"
    end
    on_intel do
      url "https://github.com/xorvo/aw/releases/download/v1.16.0/aw-v1.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "a7530269621f90d93a3e290d33edab565934801445df63dcacd98dbe9e580884"
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
