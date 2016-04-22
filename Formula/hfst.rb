require 'formula'

class Hfst < Formula
  homepage 'http://hfst.github.io/'
  head "git@github.com:hfst/hfst.git"
  url 'https://github.com/hfst/hfst/releases/download/v3.10.0/hfst-3.10.0.tar.gz'
  sha256 '666f4bd6a08c5060135fdea357f300dbf455057c49540926f8b2ee59d9f66801'

  depends_on 'icu4c' => :build
  # bison > 3.0 is a requirement, otherwise there's some xre compilation failure
  depends_on 'bison'

  option "with-xfst", "Build XFST tool"
  option "with-foma", "Build FOMA tool."


  def install

    opts = ['--enable-all-tools', '--with-unicode-handler=icu4']

    if build.with? "foma"
      opts.push '--with-foma'
    else
      opts.push '--without-foma'
    end

    if build.head?
      ENV['LDFLAGS'] = "-stdlib=libstdc++"
      ENV['CXXFLAGS'] = "-stdlib=libstdc++"
      system "./autogen.sh"
    end
    system "./configure", *opts
    system "make"
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
