class Themeset < Formula
  desc "Apply existing app themes together with explicit custom fallbacks"
  homepage "https://github.com/clang-engineer/themeset"
  version "0.2.2"
  license "MIT"
  depends_on "fzf"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.2/themeset-0.2.2-darwin-arm64.tar.gz"
      sha256 "e733e7fe964817c634aa27f1d09c262a76b42f25a8e3a21d1e8b5501d4e8d6f0"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.2/themeset-0.2.2-darwin-amd64.tar.gz"
      sha256 "3449b1c0d831ac74ba75dcc567ce62951c1c28747125878737f18008eda1e8b4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.2/themeset-0.2.2-linux-arm64.tar.gz"
      sha256 "95c009eff64933438366141de6d53d115c714ea7dc5506f6ca5723a024c2fe40"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.2/themeset-0.2.2-linux-amd64.tar.gz"
      sha256 "5b8612010edefeb8d14d2d179d22bb2ca2e6065ba8e75c3aa26d9e7bb88a85cb"
    end
  end

  def install
    bin.install "themeset"
    pkgshare.install "licenses", "THIRD_PARTY_NOTICES.md"
    generate_completions_from_executable(bin/"themeset", "completion", shells: [:bash, :zsh, :fish])
    (share/"fish/vendor_conf.d/themeset.fish").write <<~FISH
      if status is-interactive
        "#{bin}/themeset" completion fish | source
      end
    FISH
  end

  test do
    assert_match "v0.2.2", shell_output("#{bin}/themeset --version")
    assert_match "ghostty", shell_output("#{bin}/themeset list tools")
  end
end
