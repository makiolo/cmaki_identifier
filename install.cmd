@echo off
if exist "boostorg_predef" (
	rmdir /s /q boostorg_predef
)

git clone -q https://github.com/boostorg/predef.git boostorg_predef

:: powershell -c "$source = 'https://raw.githubusercontent.com/makiolo/cmaki_scripts/master/setup.cmd'; $dest = $env:TEMP + '\bootstrap.cmd'; $WebClient = New-Object System.Net.WebClient; $WebClient.DownloadFile($source,$dest); Invoke-Expression $dest"
:: powershell -c "$source = 'https://raw.githubusercontent.com/makiolo/cmaki_scripts/master/compile.cmd'; $dest = $env:TEMP + '\bootstrap.cmd'; $WebClient = New-Object System.Net.WebClient; $WebClient.DownloadFile($source,$dest); Invoke-Expression $dest"

if exist "__setup.cmd" (
	del __setup.cmd
)
if exist "__compile.cmd" (
	del __compile.cmd
)
curl -s https://raw.githubusercontent.com/makiolo/cmaki_scripts/master/setup.cmd > __setup.cmd
call __setup.cmd
del __setup.cmd

curl -s https://raw.githubusercontent.com/makiolo/cmaki_scripts/master/compile.cmd > __compile.cmd
call __compile.cmd
del __compile.cmd
