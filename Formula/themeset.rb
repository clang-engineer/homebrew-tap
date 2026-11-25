class Themeset < Formula
  desc "Apply existing app themes together with explicit custom fallbacks"
  homepage "https://github.com/clang-engineer/themeset"
  version "0.2.3"
  license "MIT"
  depends_on "fzf"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.3/themeset-0.2.3-darwin-arm64.tar.gz"
      sha256 "cf33442f9c9c4e6ed8afa5a943352f8d2f4c05fd2bd59c7da64efda61cf702b4"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.3/themeset-0.2.3-darwin-amd64.tar.gz"
      sha256 "4cebbd296326f5d509175136b205bb25fefc73f55afd77fc1f174a20c3ca00c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.3/themeset-0.2.3-linux-arm64.tar.gz"
      sha256 "6420a1eac438785f4bce1cf472facac6120537a1848452872f8cb95b8f4decbb"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.3/themeset-0.2.3-linux-amd64.tar.gz"
      sha256 "f10992b7e37c1762e365e6d18a61c9fa1c74650ad173d68ba1c5cf697b29bc07"
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
    assert_match "v0.2.3", shell_output("#{bin}/themeset --version")
    assert_match "ghostty", shell_output("#{bin}/themeset list tools")
  end
end
