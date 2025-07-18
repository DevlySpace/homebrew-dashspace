class Dashspace < Formula
  desc "Official DashSpace CLI for creating and publishing modules"
  homepage "https://dashspace.space"
  license "MIT"
  version "0.0.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlyspace/devly-cli/releases/download/0.0.6/dashspace-darwin-arm64"
      sha256 "6ceb88802737b532ebfd557571871fe2e7498f4379d4f646ddaaabd553546bbf"
    else
      url "https://github.com/devlyspace/devly-cli/releases/download/0.0.6/dashspace-darwin-amd64"
      sha256 "dfebff7aa78ef40df4c4358eb07b457eb22d943285db38656587044a14d94da8"
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
    assert_match "dashspace version 0.0.6", shell_output("#{bin}/dashspace --version")
  end
end
