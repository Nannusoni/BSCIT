@echo off

Echo This batch file will do the following:

Echo .

Echo Stop the wuauserv service

Echo Delete the AccountDomainSid registry key (if it exists)

Echo Delete the PingID registry key (if it exists)

Echo Delete the SusClientId registry key (if it exists)

Echo Delete the SusClientIDValidation registry key (if it exists)

Echo Delete the SoftwareDistribution folder

Echo Delete the Windows Update log file

Echo Restart the wuauserv service

Echo Resets the Authorization Cookie

Echo .

rem pause

@echo on

net stop wuauserv

REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v AccountDomainSid /f

REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v PingID /f

REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientId /f

REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v SusClientIDValidation /f

cd %SystemRoot%

del /Q SoftwareDistribution

del WindowsUpdate.log

net start wuauserv

wuauclt /resetauthorization /detectnow
