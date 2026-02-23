# This file is a template — do not edit manually.
# It is processed by envsubst in publish-homebrew.yml on every release,
# and the result is written to Formula/lancher.rb.
class Lancher < Formula
  desc "A minimal local project template manager"
  homepage "https://lancher.dev"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.3.0/lancher-darwin-amd64"
      sha256 "005d8d8383e2cdda49a5328abd003a3e3c64a49d80ddb13cb4501c508145420e"
    end

    on_arm do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.3.0/lancher-darwin-arm64"
      sha256 "ea3f8fb9c9eba7af98034f9aa29728f0b83268eb485760a6d2668915c80855a8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.3.0/lancher-linux-amd64"
      sha256 "db2fe3571b00f2f86428c054aef7a401ace34092359b638b31a345cda975af9f"
    end

    on_arm do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.3.0/lancher-linux-arm64"
      sha256 "2d768b7952720d9bdad0276e3150611e7951d65e7f89f48f713752c409b6327b"
    end
  end

  def install
    bin.install "lancher-darwin-amd64" => "lancher" if OS.mac? && Hardware::CPU.intel?
    bin.install "lancher-darwin-arm64" => "lancher" if OS.mac? && Hardware::CPU.arm?
    bin.install "lancher-linux-amd64"  => "lancher" if OS.linux? && Hardware::CPU.intel?
    bin.install "lancher-linux-arm64"  => "lancher" if OS.linux? && Hardware::CPU.arm?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lancher --version")
  end
end
