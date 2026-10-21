class Omniroute < Formula
  desc "Unified AI router with 160+ providers, compression, fallback, MCP/A2A"
  homepage "https://omniroute.online"
  url "https://registry.npmjs.org/omniroute/-/omniroute-3.8.52.tgz"
  sha256 "4fb570f7db3099fc1cc01d16f4e37c0c1a1cb43049ff3e85fbfbfa86c66b86a7"
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
