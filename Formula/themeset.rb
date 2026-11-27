class Themeset < Formula
  desc "Apply existing app themes together with explicit custom overrides"
  homepage "https://github.com/clang-engineer/themeset"
  version "0.2.4"
  license "MIT"
  depends_on "fzf"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.4/themeset-0.2.4-darwin-arm64.tar.gz"
      sha256 "c26cc4a4809fefdd3ee57225b9762058e9d707c309eb6dde6bf0b40e42c40873"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.4/themeset-0.2.4-darwin-amd64.tar.gz"
      sha256 "419a3c6e4eb5a027350742697f42b19c3c9535eb31ff544b91b6225f4d3bb2be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.4/themeset-0.2.4-linux-arm64.tar.gz"
      sha256 "8c21116f384efa11dfe8073198a103a84d74cec494cfd1b962f46805f781e463"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.4/themeset-0.2.4-linux-amd64.tar.gz"
      sha256 "dea2b5e890c16edb0a2ed5bb8899fe7ac150f23827a23dfe740a90d37e483938"
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
    assert_match "v0.2.4", shell_output("#{bin}/themeset --version")
    assert_match "ghostty", shell_output("#{bin}/themeset list tools")
  end
end
