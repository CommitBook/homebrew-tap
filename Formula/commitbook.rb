class Commitbook < Formula
  desc "Automated Git commits and sync for markdown notebooks"
  homepage "https://github.com/CommitBook/CommitBook-Core"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.0.0/commitbook-aarch64-apple-darwin.tar.gz"
      sha256 "f81a4449bda40848e68de066b09e3b0a9471f271952d320f4e6c14d369045a0e"
    end
    on_intel do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.0.0/commitbook-x86_64-apple-darwin.tar.gz"
      sha256 "ef5764ceb0b287a50c5d7063ab0a61bfce08a98684bad3efe808268f85724291"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.0.0/commitbook-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dcaa4c7bf39f59cc5e3f893830b63ba37afb41cb918712239b73aeea72e8809c"
    end
    on_intel do
      url "https://github.com/CommitBook/CommitBook-Core/releases/download/1.0.0/commitbook-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fab7c61133daeac6674f9eab33d18fb84d15b3ddb233cafd9fe4e22bedd1b8e0"
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
