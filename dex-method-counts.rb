class DexMethodCounts < Formula
  desc "Command-line tool to count per-package methods in Android .dex files"
  homepage "https://github.com/mihaip/dex-method-counts"
  version "1.0.0"
  url "https://github.com/mihaip/dex-method-counts/archive/master.tar.gz"
  sha256 "bfb5c339b8a3ec9552c6d49a28247df960056f54e809ac783b5ad39d33160987"

  depends_on :ant

  def install
    system "ant jar"
    inreplace "dex-method-counts" do |s|
      s.gsub! "$curdir/build/jar", "$curdir/../build/jar"
    end
    prefix.install Dir["build"]
    bin.install "dex-method-counts"
  end
end
