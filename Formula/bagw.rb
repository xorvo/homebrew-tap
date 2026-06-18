class Bagw < Formula
  desc "Browser Agent Gateway — run local AI agents from browser extensions"
  homepage "https://github.com/xorvo/bagw"
  url "https://github.com/xorvo/bagw/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "dbe9642889f00739b79dd0bf02cb0741b00845c230d4358b2497ce7fc9036c78"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["bin", "src", "package.json", "README.md", "LICENSE"]
    (bin/"bagw").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/bagw.mjs" "$@"
    SH
    chmod 0755, bin/"bagw"
  end

  service do
    run [opt_bin/"bagw", "start"]
    keep_alive true
    log_path var/"log/bagw.log"
    error_log_path var/"log/bagw.log"
    # Baseline PATH backup; bagw also loads the user's login-shell PATH at startup.
    environment_variables PATH: "#{Dir.home}/.local/bin:#{HOMEBREW_PREFIX}/bin:/usr/local/bin:/usr/bin:/bin"
  end

  def caveats
    <<~EOS
      Start the gateway at login:
        brew services start bagw

      Then connect a browser extension; bagw will prompt you to approve it.
      Manage access:  bagw clients | bagw approve <code> | bagw revoke <name>
      Troubleshoot agent discovery:  bagw doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bagw version")
  end
end
