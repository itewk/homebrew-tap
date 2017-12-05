# Some comments are needed for the Makefile to substitute lines, do not remove!
class MuCli < Formula
  desc "A full-stack DevOps on AWS tool"
  homepage "https://getmu.io"
  if OS.mac?
    url "https://github.com/stelligent/mu/releases/download/v1.1.3/mu-darwin-amd64" # The MacOS master url
    sha256 "79a43b1a224a0774ff7f3e588f9684b33310935809e85a711a7c10c484c07aad" # The MacOS master sha256sum
  elsif OS.linux?
    url "https://github.com/stelligent/mu/releases/download/v1.1.3/mu-linux-amd64" # The Linux master url
    sha256 "3d0f0fc9334b8cbb2601bbd8293bfe30e7cfa3dbff55d8d4f0c5212e4369d3da" # The Linux master sha256sum
  end
  version "1.1.3" # The master version
  devel do
    if OS.mac?
    url "https://github.com/stelligent/mu/releases/download/v1.2.1-develop/mu-darwin-amd64" # The MacOS develop url
    sha256 "658ebdbbea7ce9920b9952466037427eb3f3df78c03f0cc0709de8120bf555d4" # The MacOS develop sha256sum
    elsif OS.linux?
    url "https://github.com/stelligent/mu/releases/download/v1.2.1-develop/mu-linux-amd64" # The Linux develop url
    sha256 "7ea80005afe609e7cf6064266c8aa502c8e9378b8f745992055a65f97e0cf03c" # The Linux develop sha256sum
    end
    version "1.2.1-develop" # The develop version
  end

  bottle :unneeded

  def install
    if OS.mac?
      bin.install "mu-darwin-amd64"
      mv "#{bin}/mu-darwin-amd64", "#{bin}/mu"
    elsif OS.linux?
      bin.install "mu-linux-amd64"
      mv "#{bin}/mu-linux-amd64", "#{bin}/mu"
    end
  end

  test do
    system "#{bin}/mu" ,"--version"
  end
end
