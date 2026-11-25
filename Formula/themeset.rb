class Themeset < Formula
  desc "Apply existing app themes together with explicit custom fallbacks"
  homepage "https://github.com/clang-engineer/themeset"
  version "0.2.1"
  license "MIT"
  depends_on "fzf"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.1/themeset-0.2.1-darwin-arm64.tar.gz"
      sha256 "626441b40fc330c81069840ad5ecb093cf279ab0e5ade4e184bebd93498edd80"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.1/themeset-0.2.1-darwin-amd64.tar.gz"
      sha256 "fc499a8705b36d48df8f0dc234cfdbaeee5e525ad6bcda936d6c1b293cbfa925"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.1/themeset-0.2.1-linux-arm64.tar.gz"
      sha256 "798e49b3c01f66525cb209a32f276957b21af3ec030c3f2a74623a1148152389"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.1/themeset-0.2.1-linux-amd64.tar.gz"
      sha256 "45aee70bdb9faeff7020e50a327b9c580040fc817ae79c383eaf2a737b469d8b"
    end
  end

  def install
    bin.install "themeset"
    pkgshare.install "licenses", "THIRD_PARTY_NOTICES.md"
    generate_completions_from_executable(bin/"themeset", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match "v0.2.1", shell_output("#{bin}/themeset --version")
    assert_match "ghostty", shell_output("#{bin}/themeset list tools")
  end
end
