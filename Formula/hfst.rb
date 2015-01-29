require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Hfst < Formula
  homepage ''
  url 'http://downloads.sourceforge.net/project/hfst/hfst/hfst-3.4.5.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fhfst%2Ffiles%2Fhfst%2F&ts=1372822903&use_mirror=superb-dca2'
  sha1 'fc1fbabd91343f0da3255624f0de2a7ad8f81b49'

  # depends_on 'cmake' => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    system "./configure"
    system "make"
    # system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test hfst`.
    system "false"
  end
end
