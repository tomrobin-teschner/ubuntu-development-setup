help([==[

Description
===========
OpenFOAM is an Open-Source CFD solver that supports arbitrary polyhedral unstructured meshes,
implicit and explicit finite volume discretisation and paralllelisation through MPI.

More information
================
 - Homepage: https://www.openfoam.com/
]==])

whatis([==[OpenFOAM is an Open-Source CFD solver that supports arbitrary polyhedral unstructured meshes,
implicit and explicit finite volume discretisation and paralllelisation through MPI.]==])
whatis([==[Homepage: https://www.openfoam.com/]==])
whatis([==[URL: https://www.openfoam.com/]==])

conflict("OpenFOAM")

execute {cmd='source /opt/OpenFOAM-v2012/etc/bashrc',modeA={'load'}}