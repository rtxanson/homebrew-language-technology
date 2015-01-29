require 'formula'
 
class Apertium < Formula
  homepage 'http://wiki.apertium.org/'
  url 'http://downloads.sourceforge.net/project/apertium/apertium/3.2/apertium-3.2.0.tar.gz'
  sha1 '1e784dcb20cf99215c04c642b62e1ff35ef76dba'
  head 'https://apertium.svn.sourceforge.net/svnroot/apertium'
 
  depends_on 'libxml2' # TODO: force link?
  depends_on 'lttoolbox'
 
  # NOTE: can assume users have these? depends_on 'autoconf'
  # NOTE: can assume users have these? depends_on 'automake'
 
  # TODO: no brew for depends_on 'flex'
  # TODO: no brew for depends_on 'gperf'
  # TODO: no brew for depends_on 'libiconv'
  # TODO: no brew for depends_on 'm4'
  # TODO: no brew for depends_on 'ncurses'
  # TODO: no brew for depends_on 'p5-locale-gettext'
  # TODO: no brew for depends_on 'perl5'
  # TODO: no brew for depends_on 'zlib'
  depends_on 'expat'
  depends_on 'gawk'
  depends_on 'gettext'
  depends_on 'help2man'
  depends_on 'libtool'
  depends_on 'libxslt'
  depends_on 'pcre'
  depends_on 'pkgconfig'
 
  def install
    # TODO: PKG_CONFIG_PATH required?
    ENV['LIBTOOLIZE'] = '/usr/local/bin/glibtoolize'
    ENV['PKG_CONFIG_PATH'] = '/usr/local/lib/pkgconfig'
    ENV['PATH'] = '/usr/local/bin/:' + ENV['PATH']

    # TODO: this is probably a bad idea
    system "brew link libxml2 --force"

    # system "aclocal -I /usr/local/share/aclocal"
    # system "glibtoolize --force"
    # system "aclocal -I /usr/local/share/aclocal"
    # system "automake -a"
    # system "autoconf"
    # system "autoheader"
    # system "automake -a"
    # system "./configure"
    # system "make"
    # system "make install"
    #
    # system "./autogen.sh"
    # system "make"
    # system "make install"
  end
 
  def test
    system "make test"
  end
end
