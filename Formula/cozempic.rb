class Cozempic < Formula
  include Language::Python::Virtualenv

  desc "Context cleaning CLI for Claude Code — prune bloat, protect agent teams"
  homepage "https://github.com/Ruya-AI/cozempic"
  url "https://files.pythonhosted.org/packages/0b/f2/1d4a4a9309abb5bff254bd006da655cf0d603b84095f0ba28e41dd73a860/cozempic-1.8.29.tar.gz"
  sha256 "8977ecb406bf42b095cdc1b988fe1c386e5d8a2c833b2bb964eb04c0c24fb927"
  license "MIT"

  depends_on "python@3.12"
  depends_on "uv" # MCP server launches via `uv run` (#120)

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
