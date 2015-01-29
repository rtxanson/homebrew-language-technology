require "formula"
require "open3"

# Copied from homebrew/science

class Voikko < Formula
  homepage "http://voikko.puimula.org/"
  url "http://www.puimula.org/voikko-sources/libvoikko/libvoikko-3.7.1.tar.gz"
  sha1 "b6d7ec669bbc33ba5f526f53b1d297f9ee315178"
  head "http://beta.visl.sdu.dk/svn/visl/tools/vislcg3/trunk", :using => :svn

  depends_on "pkgconfig"
  # TODO: libiconv
  depends_on "gettext"
  depends_on "glib"
  depends_on "malaga"
  depends_on "suomi-malaga-voikko"

  option "without-check", "Disable build-time checking (not recommended)"
   
  
  # gettext sez: 
  #   LDFLAGS:  -L/usr/local/opt/gettext/lib
  #   CPPFLAGS: -I/usr/local/opt/gettext/include

  def install
    ENV["CPPFLAGS"] = "-I#{HOMEBREW_PREFIX}"
    ENV["CXXFLAGS"] = "-L#{HOMEBREW_PREFIX}/lib"

    system "./configure", "--prefix=#{HOMEBREW_PREFIX}",
                          "--with-dictionary-path=#{HOMEBREW_PREFIX}/lib/voikko/"

    system "make"

    system "make", "install"

    # TODO: tmispell-voikko
    #
  end

  # TODO: test do
  # TODO:   system "vislcg3", "--help"
  # TODO: end
end


