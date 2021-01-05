help([==[

Description
===========
Sphinx is a tool that makes it easy to create intelligent and beautiful documentation.
It was originally created for the new Python documentation, and it has excellent facilities for the
documentation of Python projects, but C/C++ is already supported as well, and it is planned to add
special support for other languages as well.

More information
================
 - Homepage: http://sphinx.pocoo.org/
]==])

whatis([==[Sphinx is a tool that makes it easy to create intelligent and beautiful documentation.
It was originally created for the new Python documentation, and it has excellent facilities for the
documentation of Python projects, but C/C++ is already supported as well, and it is planned to add
special support for other languages as well.]==])
whatis([==[Homepage: https://sphinx.pocoo.org/]==])
whatis([==[URL: https://sphinx.pocoo.org/]==])

local root = "/home/e802985/.local/"

conflict("Sphinx")

prepend_path("CMAKE_PREFIX_PATH", root)
prepend_path("CPATH", pathJoin(root, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(root, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(root, "lib"))
prepend_path("PATH", pathJoin(root, "bin"))
