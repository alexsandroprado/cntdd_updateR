@echo off
setlocal enabledelayedexpansion

:: ==============================
::   Script de atualização R, RStudio, Rtools e Pacotes R
::   Projeto: contabiliDados
::   Site: http://contabilidados.com.br
:: ==============================
echo.
echo                                      mm        mm 
echo                        ##            ##        ## 
echo   m#####m  ##m####m  #######    m###m##   m###m## 
echo  ##"    "  ##"   ##    ##      ##"  "##  ##"  "## 
echo  ##        ##    ##    ##      ##    ##  ##    ## 
echo  "##mmmm#  ##    ##    ##mmm   "##mm###  "##mm### 
echo    """""   ""    ""     """"     """ ""    """ "" 
echo.
echo ================================================================
echo   Atualizacao do R, RStudio, Rtools e Pacotes R
echo   Desenvolvido por contabiliDados UFERSA(http://contabilidados.com.br)
echo   ------------------------------------------------------------------
echo   In God we trust. All others must bring data. - W. Edwards Deming
echo ================================================================
echo.

:: --- Verificar se o winget está instalado ---
where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo Winget nao encontrado. Instalando App Installer automaticamente...
    set DOWNLOAD_PATH=%USERPROFILE%\Downloads\AppInstaller.msixbundle
    powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle' -OutFile '%DOWNLOAD_PATH%'"
    echo Instalando App Installer...
    powershell -Command "Add-AppxPackage -Path '%DOWNLOAD_PATH%'"
    echo.
    echo App Installer instalado. Feche e abra um novo CMD se necessario.
    echo Depois execute novamente este script para atualizar R, RStudio e Rtools.
    pause
    exit /b
) else (
    echo Winget encontrado! Prosseguindo com atualizacao de R, RStudio e Rtools...
)

echo.
REM --- Atualizar R, RStudio e Rtools via winget ---
echo Atualizando R, RStudio e Rtools pelo winget...
winget upgrade --id RProject.R -e
winget upgrade --id Posit.RStudio -e
winget upgrade --id RProject.Rtools -e
echo.

REM --- Caminho base do R no Windows ---
set RBASE=C:\Program Files\R

REM --- Detectar ultima versao instalada do R ---
for /f "delims=" %%i in ('dir "%RBASE%" /b /ad ^| sort') do set RVERSION=%%i

REM --- Montar caminho para o Rscript ---
set RSCRIPT="%RBASE%\!RVERSION!\bin\Rscript.exe"

echo Versao detectada: !RVERSION!
echo Usando: !RSCRIPT!
echo.

REM --- Atualizar pacotes do R ---
echo Atualizando pacotes do R...
!RSCRIPT! -e "update.packages(ask=FALSE, repos='https://cran.r-project.org')"

echo.
echo ===============================================================
echo   Processo concluido! - contabiliDados UFERSA
echo ===============================================================
pause
