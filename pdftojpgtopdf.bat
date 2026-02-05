@echo off
setlocal enabledelayedexpansion
title pdftojpgtopdf

:start
cls
echo pdftojpgtopdf
echo.
echo "Drag & Drop files below, then press ENTER."
echo.

set "input_files="
set /p "input_files=FILES: "
if "!input_files!"=="" goto start

echo.
set "dpi=150"
set /p "dpi=DPI (Enter=150): "

set "quality=80"
set /p "quality=JPEG Quality (Enter=80): "

echo.
echo Processing...

for %%F in (!input_files!) do (
    call :process "%%~F"
)

echo.
echo Done. Files saved in "your location/pdftojpgtopdf" folder.
pause >nul
goto start

:process
set "file_dir=%~dp1"
set "out_dir=!file_dir!pdftojpgtopdf"

if not exist "!out_dir!" mkdir "!out_dir!"
echo   - %~nx1
magick -density !dpi! "%~1" -background white -alpha remove -alpha off -compress jpeg -quality !quality! "!out_dir!\%~n1_raster_d!dpi!_q!quality!.pdf"
exit /b