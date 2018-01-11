# Some comments are needed for the Makefile to substitute lines, do not remove!
class MuCli < Formula
  desc "A full-stack DevOps on AWS tool"
  homepage "https://getmu.io"
  if OS.mac?
    url "https://github.com/stelligent/mu/releases/download/v1.3.2/mu-darwin-amd64" # The MacOS master url
    sha256 "0c83a48c14803216106f31af1d03bbd62962818c453eae9bb623ab594960f41a" # The MacOS master sha256sum
  elsif OS.linux?
    url "https://github.com/stelligent/mu/releases/download/v1.3.2/mu-linux-amd64" # The Linux master url
    sha256 "dc5bc129f3f9aff77ba107cce856d9b4b3e21000dc8f0ead3b54780b7ae8e410" # The Linux master sha256sum
  end
  version "1.3.2" # The master version
  devel do
    if OS.mac?
    url "https://github.com/stelligent/mu/releases/download/v1.4.1-develop/mu-darwin-amd64" # The MacOS develop url
    sha256 "5eb995a35116d657a66684434d8c33f345a4df9a08c356f9f1c98f7c3e310cfd" # The MacOS develop sha256sum
    elsif OS.linux?
    url "https://github.com/stelligent/mu/releases/download/v1.4.1-develop/mu-linux-amd64" # The Linux develop url
    sha256 "1f209c2e599e176658093af58c061ee94dfe8cc52ef93b394f13a88f09c9573a" # The Linux develop sha256sum
    end
    version "1.4.1-develop" # The develop version
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
