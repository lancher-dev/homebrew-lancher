# Filled by envsubst in .github/workflows/publish-homebrew.yml and written to
# Formula/lancher.rb in lancher-dev/homebrew-lancher.
class Lancher < Formula
  desc "A minimal local project template manager"
  homepage "https://lancher.dev"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.4.0/lancher-darwin-amd64"
      sha256 "e85b2f9e8ec049eb1640824d1c96aeaaa6eb41a44083243fffafeb7bfef2d8ed"
    end

    on_arm do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.4.0/lancher-darwin-arm64"
      sha256 "045737f1c53dd5c14f0e2763e2f31930ce5941a365077ef8d97ec30766ef3757"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.4.0/lancher-linux-amd64"
      sha256 "5bcc46317a264c38d39c2ed05a9c45aa4747f107aa3c4aa40257e6064ee1bb8d"
    end

    on_arm do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.4.0/lancher-linux-arm64"
      sha256 "4bfbb0acd2d66cc32cc6cf3c4a6aaf4b70c9a28f9bfc54cb30f2af98b407eab7"
    end
  end

  def install
    bin.install "lancher-darwin-amd64" => "lancher" if OS.mac? && Hardware::CPU.intel?
    bin.install "lancher-darwin-arm64" => "lancher" if OS.mac? && Hardware::CPU.arm?
    bin.install "lancher-linux-amd64"  => "lancher" if OS.linux? && Hardware::CPU.intel?
    bin.install "lancher-linux-arm64"  => "lancher" if OS.linux? && Hardware::CPU.arm?
    (bin/"lancher").chmod 0755
    generate_completions_from_executable(bin/"lancher", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lancher --version")
  end
end
