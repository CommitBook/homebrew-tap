class Commitbook < Formula
  desc "Automated Git commits and sync for markdown notebooks"
  homepage "https://github.com/CommitBook/CommitBook-Core"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.0.1/commitbook-aarch64-apple-darwin.tar.gz"
      sha256 "48f162c814befb2f966237edce70a2dc7c70553ef01c1c2cc530c77708d75de2"
    end
    on_intel do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.0.1/commitbook-x86_64-apple-darwin.tar.gz"
      sha256 "d240fb9fdfc980bfa82e29e0b13d7dd1083c04f1e6463a36bf67223c3f2bcf16"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.0.1/commitbook-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f7e4e4013bff496b4c255565cb461f8d6a3fd31d793b9aa09e57b9f8025f20a8"
    end
    on_intel do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.0.1/commitbook-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6febe395bb15ac610175104bbe029c6f87c6824a3c45fcb3db68b6f80140d181"
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
