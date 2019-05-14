# Automation of SQL scripts running

Implemented features:
  * Running all SQL scripts (tests) in current folder
  * Script running progress information
  * Creating report txt file with resulted counts of 1) all scripts 2) failed tests 3) errors during execution
  * Automatic opening of report file

How to use:
  * Save bat file to folder with scripts
  * Enter your SERVER_NAME instead of XEPUALVIW0027 on line 22
  * Run bat file (just click on it)

Version difference:
  * Run_SQL_with_traverse.bat - searching SQL files in current folder and all subfolders
  * Run_SQL_without_traverse.bat - searching SQL files only in current folder

Configuration:
  * Database: Microsoft SQL Server 2014
  * Authentification: Windows Authentification

If you need to use Active Directory Authentification or something else, please modify **[sqlcmd](https://docs.microsoft.com/en-us/sql/tools/sqlcmd-utility?view=sql-server-2017)** utility on line 22.
  
