@echo off
set "URL=https://store.whale.naver.com/detail/biaelipmhllekidembffilbonbhnmhie"

if exist "%ProgramFiles%\Naver\Naver Whale\Application\whale.exe" (
    start "" "%ProgramFiles%\Naver\Naver Whale\Application\whale.exe" "%URL%"
    exit
)

if exist "%ProgramFiles(x86)%\Naver\Naver Whale\Application\whale.exe" (
    start "" "%ProgramFiles(x86)%\Naver\Naver Whale\Application\whale.exe" "%URL%"
    exit
)

echo 네이버 웨일이 설치되어 있지 않습니다.
pause