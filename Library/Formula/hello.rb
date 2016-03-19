class Hello < Formula
  desc "Program providing model for GNU coding standards and practices"
  homepage "https://www.gnu.org/software/hello/"
  url "http://ftpmirror.gnu.org/hello/hello-2.10.tar.gz"
  sha256 "31e066137a962676e89f69d1b65382de95a7ef7d914b8cb956f41ea72e0f516b"

  bottle do
    prefix "/home/linuxbrew/.linuxbrew"
    cellar "/home/linuxbrew/.linuxbrew/Cellar"
    revision 1
    sha256 "26b6be39155d75f6c34a193c8cfe837589a7bf08d5c00da3671d4e01e9938fac" => :x86_64_linux
  end

  conflicts_with "camlistore", :because => "both install `hello` binaries"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
  test do
    system "#{bin}/hello", "--greeting=linuxbrew"
  end
end
