require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Hfst < Formula
  homepage 'http://hfst.sourceforge.net/'
  head "svn://svn.code.sf.net/p/hfst/code/trunk hfst-code"
  url 'http://downloads.sourceforge.net/project/hfst/hfst/source/hfst-3.8.2.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fhfst%2Ffiles%2Fhfst%2Fsource%2F&ts=1425162646&use_mirror=tcpdiag'
  sha1 'b9d57b6db858b4a5f6f50b6453f7c1d0a978dd04'

  # depends_on 'cmake' => :build
  # depends_on :x11 # if your formula requires any X11/XQuartz components
  #
  # TODO: --with-unicode-handler ?

  option "with-xfst", "Build XFST tool"

  def install
    # ENV.j1  # if your formula's build system can't parallelize

    opts = []

    system "./configure", *opts
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
