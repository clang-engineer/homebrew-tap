class Themeset < Formula
  desc "Apply existing app themes together with explicit custom fallbacks"
  homepage "https://github.com/clang-engineer/themeset"
  version "0.2.0"
  license "MIT"
  depends_on "fzf"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.0/themeset-0.2.0-darwin-arm64.tar.gz"
      sha256 "2ddab5fe7d2a15cacfd21eeb37aeea541d41d6ef766c920ee4b276d403736111"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.0/themeset-0.2.0-darwin-amd64.tar.gz"
      sha256 "3c6b44d86cd59c6d46880ba18d7382f11b6b9e816fb5198072a66c65db470564"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.0/themeset-0.2.0-linux-arm64.tar.gz"
      sha256 "caa202da468f12262453ba84ca353516c973864538304fa04a9408902e8635c0"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.0/themeset-0.2.0-linux-amd64.tar.gz"
      sha256 "d44020089306305958090ea8115f8cb50289bfadd029cfef8893b55f49ae40db"
    end
  end

  def install
    bin.install "themeset"
    pkgshare.install "licenses", "THIRD_PARTY_NOTICES.md"
    generate_completions_from_executable(bin/"themeset", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match "v0.2.0", shell_output("#{bin}/themeset --version")
    assert_match "ghostty", shell_output("#{bin}/themeset list tools")
  end
end
