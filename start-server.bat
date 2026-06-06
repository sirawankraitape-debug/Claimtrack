@echo off
chcp 65001 >nul
echo.
echo  ClaimTrack — ระบบติดตามยืนยันเคสเคลม
echo  ==========================================
cd /d "%~dp0server"

where node >nul 2>&1
if errorlevel 1 (
    echo.
    echo  [!] ไม่พบ Node.js — กรุณาดาวโหลดก่อนที่ https://nodejs.org/download
    echo      เลือก LTS ^(Windows Installer .msi^) แล้วลองใหม่
    echo.
    pause
    exit /b 1
)

if not exist node_modules (
    echo  [*] ติดตั้ง dependencies ครั้งแรก ^(ใช้เวลา ~30 วินาที^)...
    npm install
    if errorlevel 1 (
        echo  [!] npm install ล้มเหลว
        pause
        exit /b 1
    )
)

echo.
echo  [*] กำลังเริ่มเซิร์ฟเวอร์...
echo  [*] เปิดเบราว์เซอร์ที่: http://localhost:3000
echo.
start "" http://localhost:3000
node server.js
pause
