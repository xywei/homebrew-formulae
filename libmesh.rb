class Libmesh < Formula
  desc "LibMesh: A C++ finite element library."
  homepage "http://libmesh.sourceforge.net"
  url "https://github.com/libMesh/libmesh/releases/download/v0.9.5-rc1/libmesh-0.9.5-rc1.tar.gz"
  sha256 "35b5229407dd900dbe8dcc21f1cf3b18790a5c7f22de60bf02b2bcda06ddf783"

  depends_on :mpi => :cc
  depends_on 'petsc'
  depends_on 'vtk5'

  def install
    ENV.deparallelize
    args = ["--prefix=#{prefix}"]
    args << "--with-vtk-include=/usr/local/Cellar/vtk5/5.10.1_2/include/vtk-5.10"
    args << "--with-vtk-lib=/usr/local/Cellar/vtk5/5.10.1_2/lib/vtk-5.10"
    system "./configure", *args
    system "make"
    system "make install"
  end
  
  def caveats; <<-EOS.undent
    Finish with
      brew link libmesh
    EOS
  end
end
