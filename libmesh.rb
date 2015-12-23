class Libmesh < Formula
  desc "LibMesh: A C++ finite element library."
  homepage "http://libmesh.sourceforge.net"
  url "https://github.com/libMesh/libmesh/releases/download/v0.9.5-rc1/libmesh-0.9.5-rc1.tar.gz"
  sha256 "35b5229407dd900dbe8dcc21f1cf3b18790a5c7f22de60bf02b2bcda06ddf783"

  def install
    ENV.deparallelize
    args = ["--prefix=#{prefix} --enable-mpi --enable-examples --enable-petsc --enable-slepc CXX=mpicxx CC=mpicc FC=mpif90 F77=mpif77 CXXFLAGS=-I/opt/X11/include LDFLAGS=-L/opt/X11/lib"]
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
