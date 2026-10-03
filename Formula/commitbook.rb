class Commitbook < Formula
  desc "Automated Git commits and sync for markdown notebooks"
  homepage "https://github.com/CommitBook/CommitBook-Core"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.2.0/commitbook-aarch64-apple-darwin.tar.gz"
      sha256 "5e47e36285a249076f4b0144e834fa6e23a6192a956f4650e9f5126328246017"
    end
    on_intel do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.2.0/commitbook-x86_64-apple-darwin.tar.gz"
      sha256 "def77ffb9dd34cc18c9d8a5991502b812494a0b7ad863de3c507b8243540d3ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.2.0/commitbook-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d8bffe4313bc834fb7af6655c3e2275b32bc11d3641f664b55b3d80b12814d2"
    end
    on_intel do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.2.0/commitbook-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8042f08ec45a4747d8806583cadaa96bd677c8f5d01558181c3f52cbf8384a6a"
    end
  end

  def install
    bin.install "bin/commitbook", "bin/cobo", "bin/cbook", "bin/commitbook-tui", "bin/commitbook-web"
    (share/"licenses/commitbook").install "share/licenses/commitbook/LICENSE",
                                          "share/licenses/commitbook/THIRD_PARTY_NOTICES.txt"
  end

  test do
    %w[commitbook cobo cbook commitbook-tui commitbook-web].each do |executable|
      assert_match version.to_s, shell_output("#{bin}/#{executable} --version")
    end
    assert_path_exists share/"licenses/commitbook/LICENSE"
    assert_path_exists share/"licenses/commitbook/THIRD_PARTY_NOTICES.txt"
  end
end
