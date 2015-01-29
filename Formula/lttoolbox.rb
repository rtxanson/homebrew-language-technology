require 'formula'
 
class Lttoolbox < Formula
  homepage 'http://wiki.apertium.org/wiki/Lttoolbox'
  head 'https://svn.code.sf.net/p/apertium/svn/trunk/lttoolbox/'
  url 'http://downloads.sourceforge.net/project/apertium/lttoolbox/3.2/lttoolbox-3.2.0.tar.gz'
  sha1 'b5fedd442a1ad9dc09abcd84c5e69c7ef923ffc0'
 
  depends_on 'libxml2'

  def install
    ENV['LIBTOOLIZE'] = '/usr/local/bin/glibtoolize'
    ENV['PATH'] = '/usr/local/bin/:' + ENV['PATH']
    system "./autogen.sh"
    system "make"
    system "make install" # if this fails, try separate make/make install steps
  end
 
  def test
    system "make test"
  end
end
