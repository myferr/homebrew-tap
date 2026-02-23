class Ocelot < Formula
  desc "A pawesome JSON compiler. Compile, de-compile, and query your JSON super fast!"
  homepage "https://github.com/myferr/ocelot"
  url "https://github.com/myferr/ocelot/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2fbf7c6747f9c971cc1d6afcf0fe78269f4df9c3adee359de5a46265398774f1"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/myferr/ocelot/releases/download/v0.1.0/ocelot-macos-aarch64"
      sha256 "00a6fcb8b4c05fb32f6a87a443e974d009a8a4c98f1334d106f25345d4938641"
    end

    on_intel do
      url "https://github.com/myferr/ocelot/releases/download/v0.1.0/ocelot-macos-x86_64"
      sha256 "dc066d2c2f60d650d487d429953578f4dee6f6b148cbeb3a48c591a212b75c7e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/myferr/ocelot/releases/download/v0.1.0/ocelot-linux-x86_64"
      sha256 "0eca5ba356ae3e2d7743fcddc0c3ab00f6db7b855924e6791699561e493190c1"
    end
  end

  def install
    if OS.mac?
      bin.install "ocelot-macos-aarch64" => "ocelot" if Hardware::CPU.arm?
      bin.install "ocelot-macos-x86_64" => "ocelot" if Hardware::CPU.intel?
    elsif OS.linux?
      bin.install "ocelot-linux-x86_64" => "ocelot"
    end
  end

  test do
    system "#{bin}/ocelot", "--version"
  end
end
