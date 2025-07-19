class Dashspace < Formula
  desc "Official DashSpace CLI for creating and publishing modules"
  homepage "https://dashspace.space"
  license "MIT"
  version "0.0.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlyspace/dashspace-cli/releases/download/0.0.10/dashspace-0.0.10-darwin-arm64.tar.gz"
      sha256 "28810aa9b301d26a008e2070b2f675449c059f5190474d18836d4d605a169926"
    else
      url "https://github.com/devlyspace/dashspace-cli/releases/download/0.0.10/dashspace-0.0.10-darwin-amd64.tar.gz"
      sha256 "eb49f3b25559ba1927cf334ab43004e023413e61fb5ffbf6c8d38ed9cf3a7296"
    end
  end

  def install
    bin.install "dashspace" => "dashspace"

    begin
      generate_completions_from_executable(bin/"dashspace", "completion")
    rescue
    end
  end

  test do
    system "#{bin}/dashspace", "--version"
    assert_match "dashspace version 0.0.10", shell_output("#{bin}/dashspace --version")
  end
end
