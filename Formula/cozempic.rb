class Cozempic < Formula
  include Language::Python::Virtualenv

  desc "Context cleaning CLI for Claude Code — prune bloat, protect agent teams"
  homepage "https://github.com/Ruya-AI/cozempic"
  url "https://files.pythonhosted.org/packages/bc/69/579197975531d435b236eb2a2b2e5039804fe24df1f2aa0a582a4895e189/cozempic-1.8.0.tar.gz"
  sha256 "1040674778ac5cb4d37957a2864fd4123e012066b8942318511d0b756b9edd0a"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Cozempic is installed but not yet wired into your Claude Code settings.
      To enable background protection on every Claude Code session in every project:

        cozempic init --global

      Or just run any cozempic command (e.g. `cozempic --version`) and you'll be
      prompted on first use.

      Opt out entirely with:

        export COZEMPIC_NO_GLOBAL_INIT=1
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cozempic --version")
    assert_match "diagnose", shell_output("#{bin}/cozempic --help")
  end
end
