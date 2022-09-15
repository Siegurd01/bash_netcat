@ECHO OFF
:loop
set datetime=""
echo loop1
FOR /f "tokens=2 delims=?" %%i IN ('nc64 -l -p 4000 -w 1 ^| findstr "Vehicle"') DO set datetime=%%i
echo "%datetime%"

IF "%datetime%"=="" ( 
    goto loop
)

start "" GrafanaButtonInput.exe "%datetime%"
TIMEOUT 35

goto loop


PAUSE