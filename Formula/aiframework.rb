# Homebrew formula for aiframework
# Usage: brew tap evergonlabs/tap && brew install aiframework
#
# Auto-updated by CI on each release.

class Aiframework < Formula
  desc "Universal automation bootstrap CLI for Claude Code"
  homepage "https://github.com/evergonlabs/aiframework"
  url "https://github.com/evergonlabs/aiframework/releases/download/v1.3.0/aiframework-1.3.0.tar.gz"
  sha256 "bb97651af01de127604180496afb8343fe53cd02d1105a66d84ced973cdb4e69"
  license "MIT"
  head "https://github.com/evergonlabs/aiframework.git", branch: "main"

  depends_on "jq"
  depends_on "python@3.12"

  def install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"bin/aiframework"
    bin.install_symlink prefix/"bin/aiframework-mcp"
    bin.install_symlink prefix/"bin/aiframework-telemetry"
  end

  def caveats
    <<~EOS
      To bootstrap a project:
        aiframework run --target ~/your-project

      Then open Claude Code and run:
        /aif-ready

      Optional: Install sheal for runtime session intelligence:
        npm install -g @liwala/sheal@latest
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aiframework --version")
  end
end
