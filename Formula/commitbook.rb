class Commitbook < Formula
  desc "Automated Git commits and sync for markdown notebooks"
  homepage "https://github.com/CommitBook/CommitBook-Core"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.1.0/commitbook-aarch64-apple-darwin.tar.gz"
      sha256 "921df1025c155e94701f8488d5bbc518a3cc7ea5bf73882bc8c47a2b8970b9c2"
    end
    on_intel do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.1.0/commitbook-x86_64-apple-darwin.tar.gz"
      sha256 "4912433ce6f229b29a47099aa6c0338f92e48b02527102bac5b2c95312b74f7f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.1.0/commitbook-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba563fd8b48a5b00bd35548379969a7d284be90181c3ae691188b8697c76ac0c"
    end
    on_intel do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.1.0/commitbook-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "985c3bd5bb4e21e33b8b49ba751db0e71c2765aec83c7e067ec6d97330f887c0"
    end
  end

  def install
    bin.install "bin/commitbook", "bin/cobo", "bin/commitbook-tui", "bin/commitbook-web"
    (share/"licenses/commitbook").install "share/licenses/commitbook/LICENSE",
                                          "share/licenses/commitbook/THIRD_PARTY_NOTICES.txt"
  end

  test do
    %w[commitbook cobo commitbook-tui commitbook-web].each do |executable|
      assert_match version.to_s, shell_output("#{bin}/#{executable} --version")
    end
    assert_path_exists share/"licenses/commitbook/LICENSE"
    assert_path_exists share/"licenses/commitbook/THIRD_PARTY_NOTICES.txt"
  end
end
