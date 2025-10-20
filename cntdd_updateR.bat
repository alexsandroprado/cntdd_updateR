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
echo ==============================================================
echo  contabiliDados UFERSA - Setup do Ambiente R
echo --------------------------------------------------------------
echo  Instalando e/ou atualizando R, RStudio e Rtools
echo  In God we trust. All others must bring data. - W. E. Deming
echo ==============================================================

:: --- Verificar se o winget está instalado ---
where winget >nul 2>&1
if %errorlevel% neq 0 (
    echo Winget nao encontrado. Instalando App Installer automaticamente...
    set DOWNLOAD_PATH=%USERPROFILE%\Downloads\AppInstaller.msixbundle
    powershell -Command "Invoke-WebRequest -Uri 'https://aka.ms/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle' -OutFile '%DOWNLOAD_PATH%'"
    powershell -Command "Add-AppxPackage -Path '%DOWNLOAD_PATH%'"
    echo.
    echo App Installer instalado. Feche e abra um novo CMD se necessario.
    pause
    exit /b
) else (
    echo Winget encontrado! Prosseguindo com instalacao ou atualizacao...
)

:: ==============================================================
:: INSTALAR OU ATUALIZAR R
:: ==============================================================
echo.
echo Verificando R...
winget list --id RProject.R >nul 2>&1
if %errorlevel% neq 0 (
    echo R nao encontrado. Instalando...
    winget install --id RProject.R -e --accept-source-agreements --accept-package-agreements
) else (
    echo R ja instalado. Verificando atualizacoes...
    winget upgrade --id RProject.R -e --accept-source-agreements --accept-package-agreements
)

:: ==============================================================
:: INSTALAR OU ATUALIZAR RSTUDIO
:: ==============================================================
echo.
echo Verificando RStudio...
winget list --id Posit.RStudio >nul 2>&1
if %errorlevel% neq 0 (
    echo RStudio nao encontrado. Instalando...
    winget install --id Posit.RStudio -e --accept-source-agreements --accept-package-agreements
) else (
    echo RStudio ja instalado. Verificando atualizacoes...
    winget upgrade --id Posit.RStudio -e --accept-source-agreements --accept-package-agreements
)

:: ==============================================================
:: INSTALAR OU ATUALIZAR RTOOLS
:: ==============================================================
echo.
echo Verificando Rtools...
winget list --id RProject.Rtools >nul 2>&1
if %errorlevel% neq 0 (
    echo Rtools nao encontrado. Instalando...
    winget install --id RProject.Rtools -e --accept-source-agreements --accept-package-agreements
) else (
    echo Rtools ja instalado. Verificando atualizacoes...
    winget upgrade --id RProject.Rtools -e --accept-source-agreements --accept-package-agreements
)

:: ==============================================================
:: LOCALIZAR INSTALAÇÃO DO R
:: ==============================================================
set "RBASE=C:\Program Files\R"
if not exist "%RBASE%" (
    echo ERRO: Nao foi possivel localizar o diretório do R em "%RBASE%"
    pause
    exit /b
)

for /f "delims=" %%i in ('dir "%RBASE%" /b /ad ^| sort') do set RVERSION=%%i
set "RSCRIPT=%RBASE%\!RVERSION!\bin\Rscript.exe"

if not exist "!RSCRIPT!" (
    echo ERRO: Rscript nao encontrado em !RSCRIPT!
    pause
    exit /b
)

:: ==============================================================
:: ATUALIZAR PACOTES R
:: ==============================================================
echo.
echo Atualizando pacotes do R...
"!RSCRIPT!" -e "update.packages(ask=FALSE, repos='https://cran.r-project.org')"

echo.
echo ==============================================================
echo  Processo concluido com sucesso!
echo ==============================================================
pause

