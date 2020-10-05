class Jsoncat < Formula
  desc "Json pretty-print parser based on a recursive lexical analyser."
  homepage "https://github.com/pantuza/jsoncat"
  url "https://github.com/pantuza/jsoncat/raw/master/build/home:pantuza/jsoncat/jsoncat-0.7.2.tar.gz"
  version "0.7.2"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

  depends_on "cmake" => :build

  def install
    system "make"
    bin.install "bin/jsoncat"
    man1.install "docs/jsoncat.1"
  end

  test do
    `echo "{'test': true}" | jsoncat]`
  end
end
