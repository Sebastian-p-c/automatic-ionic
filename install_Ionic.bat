@echo off
setlocal enabledelayedexpansion

:: Instalar Node.js
echo Instalando Node.js...

:: Descargar el instalador de Node.js (versión LTS)
curl -o nodejs.msi https://nodejs.org/dist/v20.17.0/node-v20.17.0-x64.msi
if %ERRORLEVEL% NEQ 0 (
    echo Error al descargar Node.js.
    exit /b %ERRORLEVEL%
)

:: Ejecutar el instalador y mostrar el proceso
msiexec /i nodejs.msi /norestart
if %ERRORLEVEL% NEQ 0 (
    echo Error al instalar Node.js.
    exit /b %ERRORLEVEL%
)

:: Limpiar el archivo del instalador
del nodejs.msi
if %ERRORLEVEL% NEQ 0 (
    echo Error al eliminar el archivo del instalador de Node.js.
    exit /b %ERRORLEVEL%
)

:: Forzar una actualización del entorno de comandos
echo Actualizando el entorno...
set "PATH=%PATH%;C:\Program Files\nodejs"
where node
where npm
if %ERRORLEVEL% NEQ 0 (
    echo Error: Node.js o npm no se encuentran en el PATH.
    exit /b %ERRORLEVEL%
)

:: Verificar la instalación de Node.js
echo ===================================
echo versiones:
node -v
npm -v
if %ERRORLEVEL% NEQ 0 (
    echo Error al verificar la instalación de Node.js.
    exit /b %ERRORLEVEL%
)
echo ===================================

:: Instalar NVM
echo Instalando NVM...

:: Descargar el instalador de NVM para Windows
curl -o nvm-setup.zip https://github.com/coreybutler/nvm-windows/releases/latest/download/nvm-setup.zip
if %ERRORLEVEL% NEQ 0 (
    echo Error al descargar NVM.
    exit /b %ERRORLEVEL%
)

:: Descomprimir el archivo ZIP
powershell -command "Expand-Archive -Path nvm-setup.zip -DestinationPath nvm-setup"
if %ERRORLEVEL% NEQ 0 (
    echo Error al descomprimir el archivo de NVM.
    exit /b %ERRORLEVEL%
)

:: Ejecutar el instalador de NVM
echo Ejecutando el instalador de NVM...
start /wait nvm-setup/nvm-setup.exe
if %ERRORLEVEL% NEQ 0 (
    echo Error al instalar NVM.
    exit /b %ERRORLEVEL%
)

:: Configurar NVM para usar Node.js
echo Instalando Node.js usando NVM...
nvm install lts
if %ERRORLEVEL% NEQ 0 (
    echo Error al instalar Node.js usando NVM.
    exit /b %ERRORLEVEL%
)

nvm use lts
if %ERRORLEVEL% NEQ 0 (
    echo Error al configurar la versión de Node.js usando NVM.
    exit /b %ERRORLEVEL%
)

:: Verificar la instalación de Node.js
node -v
if %ERRORLEVEL% NEQ 0 (
    echo Error al verificar la instalación de Node.js.
    exit /b %ERRORLEVEL%
)

npm -v
if %ERRORLEVEL% NEQ 0 (
    echo Error al verificar la instalación de npm.
    exit /b %ERRORLEVEL%
)

:: Instalar Ionic
echo Instalando Ionic...

:: Instalar Ionic globalmente usando npm
npm install -g @ionic/cli
if %ERRORLEVEL% NEQ 0 (
    echo Error al instalar Ionic.
    exit /b %ERRORLEVEL%
)

:: Verificar que Ionic se instaló correctamente
ionic -v
if %ERRORLEVEL% NEQ 0 (
    echo Error al verificar la instalación de Ionic.
    exit /b %ERRORLEVEL%
)

echo ===================================
echo Node.js y Ionic han sido instalados con éxito.
echo ===================================

