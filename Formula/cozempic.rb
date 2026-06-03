class Cozempic < Formula
  include Language::Python::Virtualenv

  desc "Context cleaning CLI for Claude Code — prune bloat, protect agent teams"
  homepage "https://github.com/Ruya-AI/cozempic"
  url "https://files.pythonhosted.org/packages/2f/2e/568d69cbd5f9e210832c310b53169f2bd8567a7d87d2d6e40e0bb1310bc9/cozempic-1.8.20.tar.gz"
  sha256 "f80daa06b0f74fbc344e7fe5c81b6e9107c9f2bb0fee2ce4e768d43f6c2353aa"
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
