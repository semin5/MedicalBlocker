@echo off
title MedicalBlocker Installer
color 0A
chcp 65001 >nul

echo ==========================================
echo        MedicalBlocker Installer
echo ==========================================
echo.

echo [1/3] Chrome 정책 등록...
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\ExtensionInstallForcelist" ^
/v 1 /t REG_SZ ^
/d "gbeidpjnfdffofgneihdaajhojelbhib;https://clients2.google.com/service/update2/crx" /f

echo.

echo [2/3] Edge 정책 등록...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\ExtensionInstallForcelist" ^
/v 1 /t REG_SZ ^
/d "bbljeemcmekgdbonkldfofcdineneeoj;https://edge.microsoft.com/extensionwebstorebase/v1/crx" /f

echo.

echo [3/3] 그룹 정책 갱신...

taskkill /F /IM chrome.exe >nul 2>&1
taskkill /F /IM msedge.exe >nul 2>&1
gpupdate /target:computer /force

echo.
echo ==========================================
echo 설치가 완료되었습니다.
echo.
echo Chrome와 Edge를 모두 종료한 후 다시 실행하면
echo MedicalBlocker가 자동으로 설치됩니다.
echo ==========================================
echo.

start "" powershell.exe -NoProfile -WindowStyle Hidden -Command ^
"Add-Type -AssemblyName PresentationFramework; $msg = 'MedicalBlocker 설치가 완료되었습니다.' + [Environment]::NewLine + [Environment]::NewLine + 'Chrome 또는 Edge를 다시 실행하면 자동으로 설치됩니다.'; [System.Windows.MessageBox]::Show($msg, 'MedicalBlocker', 'OK', 'Information')"

exit
