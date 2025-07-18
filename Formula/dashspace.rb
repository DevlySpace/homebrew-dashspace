class Dashspace < Formula
  desc "Official DashSpace CLI for creating and publishing modules"
  homepage "https://dashspace.space"
  license "MIT"
  version "0.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlyspace/devly-cli/releases/download/0.0.7/dashspace-0.0.7-darwin-arm64"
      sha256 "f317c56bdae997d305c30b20c6eb30504357a4fccc11f13522c3085acf8578e4"
    else
      url "https://github.com/devlyspace/devly-cli/releases/download/0.0.7/dashspace-0.0.7-darwin-amd64"
      sha256 "9c9eb6eb6ac5b72d315bc74d11f24ef507c6e8da283714c64c580bacf28cd665"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "dashspace-0.0.7-darwin-arm64" => "dashspace"
    else
      bin.install "dashspace-0.0.7-darwin-amd64" => "dashspace"
    end

    begin
      generate_completions_from_executable(bin/"dashspace", "completion")
    rescue
      # Ignore if completion not supported
    end
  end

  test do
    system "#{bin}/dashspace", "--version"
    assert_match "dashspace version 0.0.7", shell_output("#{bin}/dashspace --version")
  end
end
