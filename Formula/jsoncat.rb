class Jsoncat < Formula
  desc "Json pretty-print parser based on a recursive lexical analyser. " \
       "The parser was based on the specification defined at json.org. " \
       "The input file is parsed to build a json object. " \
       "If the object is correct, it will be pretty-printed to standard output."

  homepage "https://github.com/pantuza/jsoncat"
  url "https://github.com/pantuza/jsoncat/raw/master/build/home:pantuza/jsoncat/jsoncat-0.1.2.tar.gz"
  version "0.1.2"
  sha256 "301c94d4e6df3077a9d6ad7dcecabc97f376e5fc0df29b3e28b7c51839ee1c86"

  depends_on "cmake" => :build

  def install
    system "make"
    bin.install "bin/jsoncat"
    man1.install "docs/jsoncat.1"

  end

  test do
    system "make test"
  end
end
