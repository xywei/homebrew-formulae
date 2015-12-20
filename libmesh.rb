class libmesh < Formula
  homepage 'http://libmesh.sourceforge.net'
  url 'https://github.com/libMesh/libmesh.git'

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
