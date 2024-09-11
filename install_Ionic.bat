@echo off
echo Instalando Node.js...

:: Descargar el instalador de Node.js (versión LTS)
curl -o nodejs.msi https://nodejs.org/dist/v20.17.0/node-v20.17.0-x64.msi

:: Ejecutar el instalador y mostrar el proceso
msiexec /i nodejs.msi /norestart

:: Limpiar el archivo del instalador
del nodejs.msi

:: Forzar una actualización del entorno de comandos
echo Actualizando el entorno...
set "PATH=%PATH%;C:\Program Files\nodejs"
where node
where npm

:: Verificar la instalación de Node.js
node -v
npm -v

:: Asegurarse de que los comandos node y npm están disponibles
if %ERRORLEVEL% NEQ 0 (
    echo Error: Node.js no se ha instalado correctamente.
    exit /b %ERRORLEVEL%
)

echo Node.js ha sido instalado con éxito.

echo Instalando Ionic...

:: Instalar Ionic globalmente usando npm
npm install -g @ionic/cli

:: Verificar que Ionic se instaló correctamente
if %ERRORLEVEL% NEQ 0 (
    echo Error: Ionic no se ha instalado correctamente.
    exit /b %ERRORLEVEL%
)

ionic -v

echo Ionic ha sido instalado con éxito.
