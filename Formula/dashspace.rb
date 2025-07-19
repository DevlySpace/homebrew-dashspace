class Dashspace < Formula
  desc "Official DashSpace CLI for creating and publishing modules"
  homepage "https://dashspace.space"
  license "MIT"
  version "0.0.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlyspace/devly-cli/releases/download/0.0.9/dashspace-0.0.9-darwin-arm64.tar.gz"
      sha256 "a35c61512ff037761396932eba32ce1fffb2998caa6d6b179a9517cd2083fc0d"
    else
      url "https://github.com/devlyspace/devly-cli/releases/download/0.0.9/dashspace-0.0.9-darwin-amd64.tar.gz"
      sha256 "7ce1283f4b6e55afdbd0cfe013c9430c65c6402bc2dacd5018d3f88e148fe846"
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
    assert_match "dashspace version 0.0.9", shell_output("#{bin}/dashspace --version")
  end
end
