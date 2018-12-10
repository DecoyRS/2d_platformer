@echo off

mkdir build
pushd build

reg query "HKEY_CLASSES_ROOT\VisualStudio.DTE.15.0" >> nul 2>&1
if %ERRORLEVEL% EQU 0 (cmake -G "Visual Studio 15 2017" -A x64 .. && goto :eof)
echo VS not installed

popd
@echo on