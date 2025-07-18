class Dashspace < Formula
  desc "Official DashSpace CLI for creating and publishing modules"
  homepage "https://dashspace.space"
  license "MIT"
  version "0.0.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlyspace/devly-cli/releases/download/0.0.3/dashspace-darwin-arm64"
      sha256 "d0aef668a3798d5baaf8ff6f62c8484a73b63284ca535f80560fce9bee914f6b"
    else
      url "https://github.com/devlyspace/devly-cli/releases/download/0.0.3/dashspace-darwin-amd64"
      sha256 "27154461a494c2956eb17e5d2e229a49736533c2046b59f24ba13c9eb1b2f3b3"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "dashspace-darwin-arm64" => "dashspace"
    else
      bin.install "dashspace-darwin-amd64" => "dashspace"
    end

    begin
      generate_completions_from_executable(bin/"dashspace", "completion")
    rescue
      # Ignore if completion not supported
    end
  end

  test do
    system "#{bin}/dashspace", "--version"
    assert_match "dashspace version 0.0.3", shell_output("#{bin}/dashspace --version")
  end
end
