class Cozempic < Formula
  include Language::Python::Virtualenv

  desc "Context cleaning CLI for Claude Code — prune bloat, protect agent teams"
  homepage "https://github.com/Ruya-AI/cozempic"
  url "https://files.pythonhosted.org/packages/c9/9d/7d68f9b197bafcf6e37aac83c2ddb410405fdbe2486ad55eaf62f306a3b3/cozempic-1.8.22.tar.gz"
  sha256 "1db9922ca0cf955bbb1a54327b19bb2003e7a3baba7ab529c80ce8f7e9451ede"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Cozempic auto-initializes on first use — no manual setup needed.
      Every Claude Code session is protected automatically after the first
      cozempic command. To opt out:

        export COZEMPIC_NO_GLOBAL_INIT=1
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cozempic --version")
    assert_match "diagnose", shell_output("#{bin}/cozempic --help")
  end
end
