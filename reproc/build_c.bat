mkdir build
cd build
del CMakeCache.txt

IF not x%PKG_NAME:static=%==x%PKG_NAME% (
    set BUILD_TYPE=-DBUILD_SHARED_LIBS=OFF
) ELSE (
    set BUILD_TYPE=-DBUILD_SHARED_LIBS=ON
)


cmake .. ^
      -G "Ninja" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_INSTALL_LIBDIR=lib ^
      -DREPROC_TEST=OFF ^
      -DREPROC_EXAMPLES=OFF ^
      -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded" ^
      %BUILD_TYPE%

ninja install --verbose

rem IF not x%PKG_NAME:static=%==x%PKG_NAME% (
rem     REN %LIBRARY_PREFIX%\lib\reproc.lib reproc_static.lib
rem )