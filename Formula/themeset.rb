class Themeset < Formula
  desc "Apply existing app themes together with explicit custom fallbacks"
  homepage "https://github.com/clang-engineer/themeset"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.2/themeset-0.1.2-darwin-arm64.tar.gz"
      sha256 "91224314c98c314a540ec699c4dace5deea602cc140cbcb8696a44e3ff2172fc"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.2/themeset-0.1.2-darwin-amd64.tar.gz"
      sha256 "206610cf007dbf2128ff9596ca82962eb76a6216b6b389733051500c89e1deab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.2/themeset-0.1.2-linux-arm64.tar.gz"
      sha256 "c4c9324bffaf54229b096c98857e5584e5c5d0f6862dad39d6ad7a2a3ea27aff"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.2/themeset-0.1.2-linux-amd64.tar.gz"
      sha256 "8cfca0299842e2d0c61cab6f3b60e666d5443d2ba6b2e507cce21c8ddbb88043"
    end
  end

  def install
    bin.install "themeset"
    pkgshare.install "licenses", "THIRD_PARTY_NOTICES.md"
    generate_completions_from_executable(bin/"themeset", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match "v0.1.2", shell_output("#{bin}/themeset --version")
    assert_match "ghostty", shell_output("#{bin}/themeset tools")
  end
end
