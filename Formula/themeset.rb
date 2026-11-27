class Themeset < Formula
  desc "Apply existing app themes together with explicit custom overrides"
  homepage "https://github.com/clang-engineer/themeset"
  version "0.2.5"
  license "MIT"
  depends_on "fzf"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.5/themeset-0.2.5-darwin-arm64.tar.gz"
      sha256 "130fb3fd4d2f77abf765486582fff2f43e372c615f0bd74473dee8c651f54178"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.5/themeset-0.2.5-darwin-amd64.tar.gz"
      sha256 "25daf6ab9f8341060a8e89cd946467616706b60a242fc5ac5ee0cc1538e6419f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.5/themeset-0.2.5-linux-arm64.tar.gz"
      sha256 "7b3d64b4c12c5648a82f3f23fb5fefb66d0c29b2a205a85edcef47023d6fabaa"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.2.5/themeset-0.2.5-linux-amd64.tar.gz"
      sha256 "001d452839db1bec892cc99f0fe10290ff679634a01fd6f4d514889d547bffce"
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
    assert_match "v0.2.5", shell_output("#{bin}/themeset --version")
    assert_match "ghostty", shell_output("#{bin}/themeset list tools")
  end
end
