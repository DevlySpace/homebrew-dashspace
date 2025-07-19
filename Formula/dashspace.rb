class Dashspace < Formula
  desc "Official DashSpace CLI for creating and publishing modules"
  homepage "https://dashspace.space"
  license "MIT"
  version "0.0.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlyspace/devly-cli/releases/download/0.0.11/dashspace-0.0.11-darwin-arm64.tar.gz"
      sha256 "58f65c4cbfb1492591186ccd0977a2d0765032ffb42947c918219afcae648a26"
    else
      url "https://github.com/devlyspace/devly-cli/releases/download/0.0.11/dashspace-0.0.11-darwin-amd64.tar.gz"
      sha256 "a7044bbf8d037008466473ef6c0f6fdb65c8e6efc8be2dd22814cd0e443590ee"
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
    end
  end

  test do
    system "#{bin}/dashspace", "--version"
    assert_match "dashspace version 0.0.11", shell_output("#{bin}/dashspace --version")
  end
end
