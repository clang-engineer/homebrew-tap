class Themeset < Formula
  desc "Apply existing app themes together with explicit custom fallbacks"
  homepage "https://github.com/clang-engineer/themeset"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.0/themeset-0.1.0-darwin-arm64.tar.gz"
      sha256 "972319fb0ce2b709faa4b5ff432e1805de1c507659c30430e7ab74eb7bd6eef4"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.0/themeset-0.1.0-darwin-amd64.tar.gz"
      sha256 "82f82021f7c9ff389879f2dee689be150518d44c700ee802beb488d670ed036c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.0/themeset-0.1.0-linux-arm64.tar.gz"
      sha256 "11599d16e8262111d4f88eb5ede4442da3a33a06ac3bf8c8595167c3b4d4ebdc"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.0/themeset-0.1.0-linux-amd64.tar.gz"
      sha256 "a1250b73a41850a76b649585a1eec465b4e4eaacfe8560af7759f46e2ccb6623"
    end
  end

  def install
    bin.install "themeset"
  end

  test do
    assert_match "v0.1.0", shell_output("#{bin}/themeset --version")
    assert_match "ghostty", shell_output("#{bin}/themeset tools")
  end
end
