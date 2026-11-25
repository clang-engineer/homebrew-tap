class Themeset < Formula
  desc "Apply existing app themes together with explicit custom fallbacks"
  homepage "https://github.com/clang-engineer/themeset"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.1/themeset-0.1.1-darwin-arm64.tar.gz"
      sha256 "d23ff90c80f426ddfc61349e448f0777308f939926076399d284c1e06f204cb6"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.1/themeset-0.1.1-darwin-amd64.tar.gz"
      sha256 "486efc0fb5f180fbd670bce6409eb9e74023907b7a38c58afabebb960e806457"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.1/themeset-0.1.1-linux-arm64.tar.gz"
      sha256 "f1e38f553f69c53982a9f4b37fb5983e34b8c1042c78446d1e5022f8967f9578"
    else
      url "https://github.com/clang-engineer/themeset/releases/download/v0.1.1/themeset-0.1.1-linux-amd64.tar.gz"
      sha256 "70d6c48bee86165a3a42b25e19a15ab091a7446f1aee7871988b4ccdc9c99aa3"
    end
  end

  def install
    bin.install "themeset"
    pkgshare.install "licenses", "THIRD_PARTY_NOTICES.md"
  end

  test do
    assert_match "v0.1.1", shell_output("#{bin}/themeset --version")
    assert_match "ghostty", shell_output("#{bin}/themeset tools")
  end
end
