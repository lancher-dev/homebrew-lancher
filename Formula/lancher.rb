# This file is a template — do not edit manually.
# It is processed by envsubst in publish-homebrew.yml on every release,
# and the result is written to Formula/lancher.rb.
class Lancher < Formula
  desc "A minimal local project template manager"
  homepage "https://lancher.dev"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.3.1/lancher-darwin-amd64"
      sha256 "78f7e3d9379477316906b80ce53e5d5170f900f1b9afd1e2c124589b904b2c40"
    end

    on_arm do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.3.1/lancher-darwin-arm64"
      sha256 "0b3139bae55c848d8b640bcb70396c9774c095c47ea4612c00ebfa2a63485fbd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.3.1/lancher-linux-amd64"
      sha256 "346bc5181a51cb0061163a49f744596389ba102346d1acf1ee614f395dbc92b2"
    end

    on_arm do
      url "https://github.com/lancher-dev/lancher/releases/download/v0.3.1/lancher-linux-arm64"
      sha256 "fb50a452295a08dfc54ed7cfe3d2d08a233308a94b6e1e123f5750838887b48a"
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
