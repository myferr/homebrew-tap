class Deo < Formula
  desc "A local Go-based open source document-oriented JSON database"
  homepage "https://github.com/myferr/ocelot"
  version "1.0.0"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/myferr/ocelot/releases/download/v1.0.0/deo-macos-arm64"
      sha256 "9cb87a701e5b719b0016817050e51fc5fbfa250b3ba2465ba899de1d3f48eb4e"
    else
      url "https://github.com/myferr/ocelot/releases/download/v1.0.0/deo-macos-amd64"
      sha256 "bae900aee5a9031d3489621389782f1fa7691a4b0d6b14f86ca0a2f9b28196fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/myferr/ocelot/releases/download/v1.0.0/deo-linux-arm64"
      sha256 "4aa3312167bb3230c9c0d4bd674be34118ec0651b1b436d97cddf7a6f9e6ddcd"
    else
      url "https://github.com/myferr/ocelot/releases/download/v1.0.0/deo-linux-amd64"
      sha256 "4092cefde775acc0b70a3f4f04a2909602010325e90de8a055bffe00e410645d"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "deo-macos-arm64" => "deo"
      else
        bin.install "deo-macos-amd64" => "deo"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "deo-linux-arm64" => "deo"
      else
        bin.install "deo-linux-amd64" => "deo"
      end
    end
  end

  test do
    system "#{bin}/deo", "--version"
  end
end
