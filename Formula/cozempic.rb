class Cozempic < Formula
  include Language::Python::Virtualenv

  desc "Context cleaning CLI for Claude Code — prune bloat, protect agent teams"
  homepage "https://github.com/Ruya-AI/cozempic"
  url "https://files.pythonhosted.org/packages/23/fd/20e5620dbe761ec03ba2f00565526042e9d58031b9324fb2fd6fbc86b081/cozempic-1.8.28.tar.gz"
  sha256 "b45713eb54c44c9b012ee2e508dc6dec60c1ee2757c392d300dd937ec4861eca"
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
