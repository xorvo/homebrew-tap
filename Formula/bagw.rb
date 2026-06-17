class Bagw < Formula
  desc "Browser Agent Gateway — run local AI agents from browser extensions"
  homepage "https://github.com/xorvo/bagw"
  url "https://github.com/xorvo/bagw/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "48c85e907f927cade85763710bd2e2c3a645b11229f7598c04aa41dc366c6892"
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
  end

  def caveats
    <<~EOS
      Start the gateway at login:
        brew services start bagw

      Then connect a browser extension; bagw will prompt you to approve it.
      Manage access:  bagw clients | bagw approve <code> | bagw revoke <name>
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bagw version")
  end
end
