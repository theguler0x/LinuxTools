
@echo off

color a

Title SSH Tools V2.5 The Guler0x
setlocal enabledelayedexpansion

chcp 65001 > nul

:menu
cls
echo.
                                     
echo  ███████╗███████╗██╗  ██╗    ████████╗ ██████╗  ██████╗ ██╗     ███████╗    ██╗   ██╗  ██████╗    ███████╗
echo  ██╔════╝██╔════╝██║  ██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██╔════╝    ██║   ██║  ╚════██╗   ██╔════╝
echo  ███████╗███████╗███████║       ██║   ██║   ██║██║   ██║██║     ███████╗    ██║   ██║   █████╔╝   ███████╗
echo  ╚════██║╚════██║██╔══██║       ██║   ██║   ██║██║   ██║██║     ╚════██║    ╚██╗ ██╔╝  ██╔═══╝    ╚════██║
echo  ███████║███████║██║  ██║       ██║   ╚██████╔╝╚██████╔╝███████╗███████║     ╚████╔╝██╗███████╗██╗███████║
echo  ╚══════╝╚══════╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚══════╝      ╚═══╝ ╚═╝╚══════╝╚═╝╚══════╝
echo  ████████╗██╗  ██╗███████╗     ██████╗ ██╗   ██╗██╗     ███████╗██████╗  ██████╗ ██╗  ██╗                 
echo  ╚══██╔══╝██║  ██║██╔════╝    ██╔════╝ ██║   ██║██║     ██╔════╝██╔══██╗██╔═████╗╚██╗██╔╝                 
echo     ██║   ███████║█████╗      ██║  ███╗██║   ██║██║     █████╗  ██████╔╝██║██╔██║ ╚███╔╝                  
echo     ██║   ██╔══██║██╔══╝      ██║   ██║██║   ██║██║     ██╔══╝  ██╔══██╗████╔╝██║ ██╔██╗                  
echo     ██║   ██║  ██║███████╗    ╚██████╔╝╚██████╔╝███████╗███████╗██║  ██║╚██████╔╝██╔╝ ██╗                 
echo     ╚═╝   ╚═╝  ╚═╝╚══════╝     ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝                 
echo     Home: www.farukguler.com  Github: https://github.com/theguler0x                                                                                            
                                                        
echo 1. SSH Client
echo 2. Linux Dosya Transfer -Secure Copy Protocol (SCP)
echo 3. Çıkış
echo -------------------------
set /p choice="Operasyon Seç 1-3: "

if "%choice%"=="1" (
    call :sshConnection
) else if "%choice%"=="2" (
    call :fileCopy
) else if "%choice%"=="3" (
    exit
) else (
    echo Geçersiz seçenek! Devam etmek için bir tuşa basın...
    pause > nul
    goto :menu
)

:sshConnection
cls
echo -------------------------
echo SSH Client
echo -------------------------
set /p host="Hedef IP/DNS girin: "
set /p port="SSH Portunuzu girin (varsayılan: 22): "
if "%port%"=="" set port=22
set /p username="Kullanıcı adı: "

echo.
echo --------------------
echo SSH Connecting.....
echo --------------------
echo.

ssh %username%@%host% -p %port%

echo.
echo SSH bağlantısı tamamlandı. Devam etmek için bir tuşa basın...
pause > nul
goto :menu

color a

:fileCopy
cls
echo -------------------------
echo Linux Dosya Transfer
echo -------------------------
set /p remoteServer="Uzak sunucunun IP/DNS girin:"
set /p remoteUsername="Kullanıcı adını girin: "
set /p remoteDirectory="Dosyaların kopyalanacağı uzak dizini girin (örn: /uzak/dizin/): "
set /p localFilePath="Yerel dosyayı veya yolunu girin: (örn: "C:\Desktop\Script.sh"):"

echo.
echo Dosyanız kopyalanacak Emin misiniz?...
echo.

scp -r "%localFilePath%" "%remoteUsername%@%remoteServer%:%remoteDirectory%"

echo.
echo ##Kopyalandı## devam etmek için bir tuşa basın...
pause > nul
goto :menu