echo off

REM Gets info from GIT regarding current repo state and saves it to "git_version.in",
REM which can be included in the source (version.cpp). This batch file can be then
REM added as a pre-build step to automatically includeREM latest GIT information into
REM the code so it can be queried and logged

git show -s --format="%%ci (%%H) by %%an (branch: %%d)" > version_temp.txt
set /p git_commit=<version_temp.txt

set full_version="%git_commit%"
echo GIT Info: %full_version%
set /p version_contents=<git_version.in

echo Previous version: %full_version%
echo Current version : %version_contents%

REM This just ensures we don't change the timestamp of the file every time we query GIT (so no need to recompile every time)
IF %full_version% == %version_contents% goto versions_equal

echo New GIT version detected, overwriting version file
echo %full_version% > git_version.in
goto end

:versions_equal
echo The same GIT version was already detected, skipping overwrite

:end
