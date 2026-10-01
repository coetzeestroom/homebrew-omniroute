class Omniroute < Formula
  desc "Unified AI router with 160+ providers, compression, fallback, MCP/A2A"
  homepage "https://omniroute.online"
  url "https://registry.npmjs.org/omniroute/-/omniroute-3.8.51.tgz"
  sha256 "421699fdda34bd85bcf035257e88e359edc033c01b85d54b6a4921c1cda4d2ef"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  service do
    run [opt_bin/"omniroute"]
    keep_alive true
    log_path var/"log/omniroute.log"
    error_log_path var/"log/omniroute.log"
    working_dir var/"omniroute"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/omniroute --version")
  end
end
