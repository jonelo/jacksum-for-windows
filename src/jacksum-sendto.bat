@echo off
rem ===============================================
rem
rem Jacksum Windows Explorer Integration
rem
rem powered by Jacksum, <https://jacksum.net>,
rem Copyright (c) 2006-2023 Johann N. Loefflmann,
rem <https://johann.loefflmann.net>
rem
rem ===============================================
goto main


rem ---------------------
rem calculate hash values
rem ---------------------
:gui
copy nul %OUTPUT%
copy nul %CHECK_FILE%
call %JAVAW% -jar %HASHGARTEN_JAR% --header -O relative -U %ERROR_LOG% --file-list-format ssv --file-list %FILE_LIST% --path-relative-to-entry 1 --verbose default,summary
set ReturnCode=%ERRORLEVEL%
if "%ReturnCode%"=="2" goto cancel
if "%ReturnCode%"=="1" goto error

rem Generate an output that contains both stdout and stderr in a file for the viewer
rem CHECK_FILE contains the output file name that the user has been specified at the GUI
for /F "usebackq delims=" %%A in (`findstr gui.output %USERPROFILE%\.HashGarten.properties`) do (
  set CHECK_FILE=%%A
  shift
)
rem We need to strip the key called gui.output= and undo any escapes done by Java's properties API
set CHECK_FILE=%CHECK_FILE:~11%
set CHECK_FILE=%CHECK_FILE:\\=\%
set CHECK_FILE=%CHECK_FILE:\:=:%
copy /y /b "%CHECK_FILE%" + %ERROR_LOG% %OUTPUT%
goto view

rem ---------------
rem check integrity
rem ---------------
:check
copy nul %OUTPUT%
call %JAVAW% -jar %HASHGARTEN_JAR% --header -c relative -O %OUTPUT% -U %OUTPUT% --file-list-format ssv --file-list %FILE_LIST% --path-relative-to-entry 1 --verbose default,summary
set ReturnCode=%ERRORLEVEL%
if "%ReturnCode%"=="2" goto cancel
if "%ReturnCode%"=="1" goto error
goto view


rem -----------------
rem customized output
rem -----------------
:custom
copy nul %OUTPUT%
set ALGO=md5+sha1+ripemd160+tiger+^
sha256+sha512/256+sha3-256+shake128+sm3+streebog256+kupyna-256+lsh-256-256+blake3+k12+keccak256+^
sha512+sha3-512+shake256+streebog512+kupyna-512+lsh-512-512+blake2b-512+keccak512+m14+skein-512-512+whirlpool
set TEMPLATE=^
File info:#SEPARATOR^
    name:                      #FILENAME{name}#SEPARATOR^
    path:                      #FILENAME{path}#SEPARATOR^
    size:                      #FILESIZE bytes#SEPARATOR^
#SEPARATOR^
legacy message digests (avoid if possible):#SEPARATOR^
    MD5 (128 bit):             #HASH{md5}#SEPARATOR^
    SHA1 (160 bit):            #HASH{sha1}#SEPARATOR^
    RIPEMD-160 (160 bit):      #HASH{ripemd160}#SEPARATOR^
    TIGER (192 bit):           #HASH{tiger}#SEPARATOR^
#SEPARATOR^
256 bit message digests (hex):#SEPARATOR^
    SHA-256 (USA):             #HASH{sha256}#SEPARATOR^
    SHA-512/256 (USA):         #HASH{sha512/256}#SEPARATOR^
    SHA3-256 (USA):            #HASH{sha3-256}#SEPARATOR^
    SHAKE128 (USA):            #HASH{shake128}#SEPARATOR^
    SM3 (China):               #HASH{sm3}#SEPARATOR^
    STREEBOG 256 (Russia):     #HASH{streebog256}#SEPARATOR^
    Kupyna256 (Ukraine):       #HASH{kupyna-256}#SEPARATOR^
    LSH-256-256 (South Korea): #HASH{lsh-256-256}#SEPARATOR^
    BLAKE3:                    #HASH{blake3}#SEPARATOR^
    KangarooTwelve:            #HASH{k12}#SEPARATOR^
    KECCAK256:                 #HASH{keccak256}#SEPARATOR^
#SEPARATOR^
512 bit message digests (base64, no padding):#SEPARATOR^
    SHA-512 (USA):             #HASH{sha512,base64-nopadding}#SEPARATOR^
    SHA3-512 (USA):            #HASH{sha3-512,base64-nopadding}#SEPARATOR^
    SHAKE256 (USA):            #HASH{shake256,base64-nopadding}#SEPARATOR^
    STREEBOG 512 (Russia):     #HASH{streebog512,base64-nopadding}#SEPARATOR^
    KUPYNA-512 (Ukraine):      #HASH{kupyna-512,base64-nopadding}#SEPARATOR^
    LSH-512-512 (South Korea): #HASH{lsh-512-512,base64-nopadding}#SEPARATOR^
    BLAKE2b-512:               #HASH{blake2b-512,base64-nopadding}#SEPARATOR^
    KECCAK512:                 #HASH{keccak512,base64-nopadding}#SEPARATOR^
    MarsupilamiFourteen:       #HASH{m14,base64-nopadding}#SEPARATOR^
    SKEIN-512-512:             #HASH{skein-512-512,base64-nopadding}#SEPARATOR^
    WHIRLPOOL:                 #HASH{whirlpool,base64-nopadding}#SEPARATOR#SEPARATOR
set TEMPLATE="%TEMPLATE%"

call %JAVAW% -jar %JACKSUM_JAR% ^
  -a %ALGO% ^
  --file-list %FILE_LIST% --file-list-format ssv ^
  -E hex ^
  -s "\r\n" ^
  --format %TEMPLATE%^
  -O %OUTPUT% ^
  -U %OUTPUT%
goto view


rem --------------
rem Edit the batch
rem --------------
:edit
set OUTPUT="@PATH@\jacksum-sendto.bat"
goto view


rem ----------------------
rem Open the SendTo folder
rem ----------------------
:sendto
call explorer.exe shell:sendto
goto end


rem -------------
rem Open the help
rem -------------
:help
call %JAVAW% -jar %JACKSUM_JAR% -h > %OUTPUT%
goto view


rem ----------------------
rem Compute all algorithms
rem ----------------------
:all
set ALGO=all
call %JAVAW% -jar %JACKSUM_JAR% --header -V summary^
  -O %OUTPUT% -U %OUTPUT%^
  -a %ALGO% -s "\r"^
  --file-list %FILE_LIST% --file-list-charset utf8 --file-list-format ssv^
  -F "#ALGONAME{i} (#FILENAME) = #HASH{i}#SEPARATOR"
goto view


rem ----------------
rem View the results
rem ----------------
:view
start %NOTEPAD% %OUTPUT%
goto end


rem ----------
rem Java check
rem ----------
:javacheck
if exist %JAVAW% goto javafound
echo ERROR: %JAVAW% not found. > %OUTPUT%
echo Please modify "@PATH@\jacksum.bat" or reinstall Jacksum. >> %OUTPUT%
echo For more information please go to %JACKSUM_URL% >> %OUTPUT%
goto view


rem --------------
rem Initialization
rem --------------
:init
rem sets the character set UTF-8 for the shell
chcp 65001 > nul

rem init Java value
set JAVAW="@PATH@\jre\bin\javaw.exe"

rem init Editor values
set NOTEPAD=%WINDIR%\system32\notepad.exe
rem If you have Notepad++ installed ...
rem set NOTEPAD=%ProgramFiles%\Notepad++\notepad++.exe

rem init Jacksum values
set JACKSUM_URL=https://jacksum.net
set JACKSUM_VERSION=@JACKSUM_VERSION@
set JACKSUM_JAR="@PATH@\jacksum-%JACKSUM_VERSION%.jar"
:: Development only
:: copy /y "C:\Users\Johann\IdeaProjects\jacksum\target\jacksum-%JACKSUM_VERSION%.jar" "@PATH@"

rem init HashGarten values
set HASHGARTEN_VERSION=@HASHGARTEN_VERSION@
set HASHGARTEN_JAR="@PATH@\HashGarten-%HASHGARTEN_VERSION%.jar"
:: Development only
:: copy /y "C:\Users\Johann\.m2\repository\net\jacksum\HashGarten\%HASHGARTEN_VERSION%\HashGarten-%HASHGARTEN_VERSION%.jar" "@PATH@"

rem init filenames
set OUTPUT=%TEMP%\jacksum-%JACKSUM_VERSION%-output.txt
set ERROR_LOG=%TEMP%\jacksum-%JACKSUM_VERSION%-error.txt
set FILE_LIST=%TEMP%\jacksum-%JACKSUM_VERSION%-filelist.txt
set CHECK_FILE=%TEMP%\jacksum-%JACKSUM_VERSION%-check.txt

goto init_done


rem ----
rem Main
rem ----
:main
goto init
:init_done
if "" == "%1" goto usage
set PARAMS=%*
rem strip the first 16 characters, because those contain the cmd_xxxxx string
echo %PARAMS:~16% > %FILE_LIST%
rem from here Java is required
goto javacheck
:javafound
if "cmd_gui" == "%1" goto gui
if "cmd_latest" == "%1" goto latest
if "cmd_all" == "%1" goto all
if "cmd_check" == "%1" goto check
if "cmd_custom" == "%1" goto custom
if "cmd_help" == "%1" goto help
if "cmd_edit" == "%1" goto edit
set ALGO=%1
goto usage


rem -----
rem Usage
rem -----
:usage
echo This batch handles the Windows Explorer Integration for Jacksum.
echo For more information go to %JACKSUM_URL%
pause
goto end


rem -----
rem In case of error
rem -----
:error
goto end


rem -----
rem In case of cancel
rem -----
:cancel
goto end


rem -----
rem The end
rem -----
:end
