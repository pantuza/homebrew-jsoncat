class Jsoncat < Formula
  desc "Json pretty-print parser based on a recursive lexical analyser."
  homepage "https://github.com/pantuza/jsoncat"
  url "https://github.com/pantuza/jsoncat/archive/0.7.2.tar.gz"
  version "0.7.2"
  sha256 "f1cc1dd90c2e7441c72102fba7792660002502204cbb929cb9281a17699c66ab"

  depends_on "cmake" => :build

  def install
    # Builds binary and install it
    system "make"
    bin.install "bin/jsoncat"

    # Builds man pages and install it
    system "make manpage -C build"
    man1.install "docs/jsoncat.1"
  end

  test do
    `echo "{'test': true}" | jsoncat]`
  end
end
