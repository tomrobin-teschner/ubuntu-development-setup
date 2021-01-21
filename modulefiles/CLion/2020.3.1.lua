help([==[

Description
===========
CLion is a cross-platform C/C++ IDE for Linux, OS X, and Windows. CLion includes such features as
a smart editor, code generation, code quality assurance, automated refactorings, on-the-fly code
analysis, project manager, integrated version control systems and debugger.

More information
================
 - Homepage: https://www.jetbrains.com/clion/
]==])

whatis([==[CLion is a cross-platform C/C++ IDE for Linux, OS X, and Windows. CLion includes such
features as a smart editor, code generation, code quality assurance, automated refactorings,
on-the-fly code analysis, project manager, integrated version control systems and debugger.]==])
whatis([==[Homepage: https://www.jetbrains.com/clion/]==])
whatis([==[URL: https://www.jetbrains.com/clion/]==])

conflict("CLion")

prepend_path("PATH", "/home/tom/.local/clion-2020.3.1/bin")
