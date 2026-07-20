@echo off
setlocal enabledelayedexpansion

set SCRIPT_DIR=%~dp0
set SHADERCROSS=%SCRIPT_DIR%..\..\third_party\SDL\bin\shadercross.exe

if not exist "%SHADERCROSS%" (
  echo [ERROR] shadercross.exe was not found: %SHADERCROSS%
  exit /b 1
)

pushd "%SCRIPT_DIR%"

for %%f in (*.hlsl) do (
  echo [INFO] Compiling %%f

  "%SHADERCROSS%" "%%f" -o "%%~nf.spv"
  if errorlevel 1 (
    echo [ERROR] Failed to compile %%f to SPIR-V
    popd
    exit /b 1
  )

  "%SHADERCROSS%" "%%f" -o "%%~nf.dxil"
  if errorlevel 1 (
    echo [ERROR] Failed to compile %%f to DXIL
    popd
    exit /b 1
  )
)

echo [INFO] Shader compilation completed.
popd
exit /b 0
