# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Jsoncat < Formula
  desc ""
  homepage "https://github.com/pantuza/jsoncat"
  url "https://github.com/pantuza/jsoncat/raw/master/build/home:pantuza/jsoncat/jsoncat-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "7d1563a586bf10612982a8c2e7f536320c917cf768eefa07197be6d670c29ad9"

  depends_on "cmake" => :build

  def install
    system "make", "install" # if this fails, try separate make/make install steps
    
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test jsoncat`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
