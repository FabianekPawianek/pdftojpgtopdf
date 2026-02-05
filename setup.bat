@echo off
echo [INSTALLER] Installing dependencies via Winget...
echo.

echo 1/2 Installing Ghostscript...
winget install -e --id ArtifexSoftware.Ghostscript --accept-source-agreements --accept-package-agreements

echo.
echo 2/2 Installing ImageMagick...
:: Parametr /FILES w instalatorze IM zapewnia dodanie do PATH
winget install -e --id ImageMagick.ImageMagick --accept-source-agreements --accept-package-agreements

echo.
echo Installation complete. Please RESTART your computer or log out/in to update PATH variables.
pause