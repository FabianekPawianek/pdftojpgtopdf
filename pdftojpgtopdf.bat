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
echo Done. Press any key to reset.
pause >nul
goto start

:process
set "file_path=%~1"
set "output_path=%~dpn1_raster_d!dpi!_q!quality!.pdf"

echo   - %~nx1
magick -density !dpi! "%file_path%" -background white -alpha remove -alpha off -compress jpeg -quality !quality! "%output_path%"
exit /b