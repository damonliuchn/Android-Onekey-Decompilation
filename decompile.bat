@echo off
%~d0
cd %~dp0
cd decompile


REM 删除文件夹
rd /s/q apk

echo 正在反编译...
java -jar apktool.jar d -f %1  apk >nul 2>nul


REM 复制文件并重命名
echo f|xcopy %1 apk\ori.apk >nul 2>nul

java -jar smali.jar apk/smali/ -o apk/classes.dex >nul 2>nul

dex2jar/dex2jar.bat -o -D -d apk/ apk/classes.dex 

pause