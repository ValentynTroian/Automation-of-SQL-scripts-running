@echo off
setlocal enabledelayedexpansion

set timehour=%time:~0,2%
set cur_datetime=%date:~-4,4%-%date:~-10,2%-%date:~-7,2%-%timehour: =0%.%time:~3,2%

:: The prefix to file
set name_temp=temp_report_DT_
set name=report_DT_

:: Creating a file names
set file_temp=%name_temp%%cur_datetime%.txt
set file=%name%%cur_datetime%.txt

:: Count of all scripts in current folder
set cnt_all_scripts=0
for /R %%A in (*.sql) do set /a cnt_all_scripts+=1

set /A cnt=0

:: Main
for /R %%G in (*.sql) do set /a cnt+=1 && echo !cnt! of %cnt_all_scripts% && echo %%G && echo. >> %file_temp% && echo %%G >> %file_temp% && sqlcmd -p /S XEPUALVIW0027 -m 1 -E -i"%%G" >> %file_temp% && cls

:: Parsing a temp file to delete unnecessary lines and saving the results to new file
findstr /V "affected packet xact[s]" %file_temp% > %file%

:: Deleting temp file
del %file_temp%

echo Your report is ready. && echo.
echo -------------------------------------------------------------------------- >> %file%

echo All scripts = %cnt_all_scripts%
echo All scripts = %cnt_all_scripts% >> %file%

:: Count of errors during execution in current folder using "Msg" error option
set cnt_errors_dur_exec=0
for /F %%N in ('find /C "Msg" ^< "%file%"') do set "cnt_errors_dur_exec=%%N"
echo Errors during execution = %cnt_errors_dur_exec%
echo Errors during execution = %cnt_errors_dur_exec% >> %file%

:: Count of failed tests in result file
set cnt_failed_tests=0
for /F %%N in ('find /C /I " FAIL " ^< "%file%"') do set "cnt_failed_tests=%%N"

echo Failed tests = %cnt_failed_tests%
echo Failed tests = %cnt_failed_tests% >> %file% && echo.

:: Open a report in notepad
start "C:\Windows\System32" notepad.exe %cd%\%file%

pause
