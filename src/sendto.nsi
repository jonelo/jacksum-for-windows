Unicode True
!define VERSION "2.9.0"
!define JACKSUM_VERSION "3.7.0"
!define HASHGARTEN_VERSION "0.18.0"
!define FLATLAF_VERSION "3.5.2"
!define URL "https://jacksum.net"
!define APPNAME "Jacksum ${JACKSUM_VERSION} for Windows Installer ${VERSION}"
!addplugindir .
!include "x64.nsh"
!include "FileFunc.nsh"
 
RequestExecutionLevel user
ShowInstDetails hide
BrandingText "${URL}"
#SetDetailsPrint none

Icon "jacksum.ico"
Name "Jacksum for Windows"
Caption "${APPNAME}"
OutFile "Jacksum for Windows.exe"
#SilentInstall silent
#SilentUnInstall silent
XPStyle on

# Default installation folder
InstallDir "$PROFILE\Jacksum for Windows"

# First is default
LoadLanguageFile "${NSISDIR}\Contrib\Language files\English.nlf"
LoadLanguageFile "${NSISDIR}\Contrib\Language files\German.nlf"

LangString Success ${LANG_ENGLISH} \
  'The installation was successful.\
  $\n\
  $\n\
  Jacksum ${JACKSUM_VERSION}, HashGarten ${HASHGARTEN_VERSION} and an uninstaller have been stored to\
  $\n\
  $\n$OUTDIR\
  $\n\
  $\nFrom the Windows File Explorer "Send To" menu, you can call Jacksum and HashGarten \
  in order to compute and verify hash values with Jacksum.'

LangString Success ${LANG_GERMAN} \
  'Die Installation war erfolgreich.\
  $\n\
  $\n\
  Jacksum ${JACKSUM_VERSION}, HashGarten ${HASHGARTEN_VERSION} und ein Uninstaller wurden gespeichert nach\
  $\n\
  $\n$OUTDIR\
  $\n\
  $\nAus dem "Senden an" Menü des Windows File Explorers können Sie nun \
  Jacksum und HashGarten aufrufen, um Hashwerte mit Jacksum zu berechnen und zu überprüfen.'


LangString CmdSelect ${LANG_ENGLISH}      'Calculate hash values'
LangString CmdSelect ${LANG_GERMAN}       'Berechne Hashwerte'

LangString CheckIntegrity ${LANG_ENGLISH} 'Check the data integrity'
LangString CheckIntegrity ${LANG_GERMAN}  'Überprüfe die Datenintegrität'

LangString AllAlgorithms ${LANG_ENGLISH}  'All algorithms'
LangString AllAlgorithms ${LANG_GERMAN}   'Alle Algorithmen'

LangString Customized ${LANG_ENGLISH}     'Customized output'
LangString Customized ${LANG_GERMAN}      'Benutzerdefinierte Ausgabe'

LangString EditBatch ${LANG_ENGLISH}      'Edit batch'
LangString EditBatch ${LANG_GERMAN}       'Bearbeite Batch'

LangString OpenSendTo ${LANG_ENGLISH}     'Open the SendTo Folder'
LangString OpenSendTo ${LANG_GERMAN}      'Öffne das Verzeichnis "Senden-an"'

LangString Help ${LANG_ENGLISH}           'Help'
LangString Help ${LANG_GERMAN}            'Hilfe'

# Replace strings in a string
!macro _StrRep output string old new
  Push "${string}"
  Push "${old}"
  Push "${new}"
  Call StrRep
  Pop ${output}
!macroend
!define StrRep "!insertmacro _StrRep"

# Replace strings in file
!macro _ReplaceInFile2 FILE_TO_MODIFIED OLD_STR REPLACEMENT_STR FST_OCC NR_OCC
  Push "${OLD_STR}" ;text to be replaced
  Push "${REPLACEMENT_STR}" ;replace with
  Push "${FST_OCC}" ; starts replacing onwards FST_OCC occurrences
  Push "${NR_OCC}" ; replaces NR_OCC occurrences in all
  Push "${FILE_TO_MODIFIED}" ; file to replace in
  Call AdvReplaceInFile
!macroend
!define ReplaceInFile2 "!insertmacro _ReplaceInFile2" 

!define REGUNINSTKEY "Jacksum"
!define REGPATH_WINUNINST "Software\Microsoft\Windows\CurrentVersion\Uninstall"

Section

  StrCpy $R2 ""
  Call GetParameters
  Pop $R2

  ClearErrors

  ReadRegStr $R0 HKLM \
  "SOFTWARE\Microsoft\Windows NT\CurrentVersion" CurrentVersion
  IfErrors 0 winnt
  MessageBox MB_ICONINFORMATION|MB_OK 'Jacksum for Windows installation is not possible on this Windows release' IDOK +1
  Quit
  winnt:

  ClearErrors
  SetOutPath "$INSTDIR"
  
  File jacksum.bat
  ${ReplaceInFile2} "$INSTDIR\jacksum.bat" @PATH@ "$INSTDIR" 1 all
  ${ReplaceInFile2} "$INSTDIR\jacksum.bat" @JAVA@ "$INSTDIR\jre\bin\java.exe" 1 all
  ${ReplaceInFile2} "$INSTDIR\jacksum.bat" @JACKSUM_VERSION@ "${JACKSUM_VERSION}" 1 all
  
  File hashgarten.exe
  File hashgarten.ini
  ${ReplaceInFile2} "$INSTDIR\hashgarten.ini" @PATH@ "$INSTDIR" 1 all
  ${ReplaceInFile2} "$INSTDIR\hashgarten.ini" @JAVA@ "$INSTDIR\jre\bin\java.exe" 1 all
  ${ReplaceInFile2} "$INSTDIR\hashgarten.ini" @HASHGARTEN_VERSION@ "${HASHGARTEN_VERSION}" 1 all


  File hashgarten.bat
  ${ReplaceInFile2} "$INSTDIR\hashgarten.bat" @PATH@ "$INSTDIR" 1 all
  ${ReplaceInFile2} "$INSTDIR\hashgarten.bat" @JAVA@ "$INSTDIR\jre\bin\java.exe" 1 all
  ${ReplaceInFile2} "$INSTDIR\hashgarten.bat" @HASHGARTEN_VERSION@ "${HASHGARTEN_VERSION}" 1 all

  File jacksum-sendto.bat
  ${ReplaceInFile2} "$INSTDIR\jacksum-sendto.bat" @PATH@ "$INSTDIR" 1 all
  ${ReplaceInFile2} "$INSTDIR\jacksum-sendto.bat" @JAVAW@ "$INSTDIR\jre\bin\javaw.exe" 1 all
  ${ReplaceInFile2} "$INSTDIR\jacksum-sendto.bat" @JACKSUM_VERSION@ "${JACKSUM_VERSION}" 1 all
  ${ReplaceInFile2} "$INSTDIR\jacksum-sendto.bat" @HASHGARTEN_VERSION@ "${HASHGARTEN_VERSION}" 1 all


  File jacksum.ico
  File jacksum-${JACKSUM_VERSION}.jar
  File HashGarten-${HASHGARTEN_VERSION}.jar
  File flatlaf-${FLATLAF_VERSION}.jar
  File license.txt
  File /r jre

  # a configuration file for integration in muCommander
  StrCmp $LANGUAGE ${LANG_GERMAN} 0 notGerman  
  File /oname=commands.xml commands.de.xml
  Goto endLang
  notGerman:
  File /oname=commands.xml commands.en.xml
  endLang:
  # Tweaks for the muCommander commands.xml file
  ${StrRep} '$0' "$SENDTO" '\' '\\'
  ${StrRep} '$1' "$0" ' ' '\ '
  ${ReplaceInFile2} "$INSTDIR\commands.xml" @SENDTO@ '$1' 1 all  

  # remove the properties file because the old one is incompatible
  Delete $PROFILE\.HashGarten.properties

  # write files to the SendTo directory
  Delete $SENDTO\Jacksum*
  RMdir /r $SENDTO\Jacksum

  CreateShortCut "$SENDTO\Jacksum - 1) $(CmdSelect).lnk"      "$OUTDIR\jacksum-sendto.bat" "cmd_gui        " "$OUTDIR\jacksum.ico" 0 SW_SHOWMINIMIZED
  CreateShortCut "$SENDTO\Jacksum - 2) $(CheckIntegrity).lnk" "$OUTDIR\jacksum-sendto.bat" "cmd_check      " "$OUTDIR\jacksum.ico" 0 SW_SHOWMINIMIZED
  CreateShortCut "$SENDTO\Jacksum - 3) $(Customized).lnk"     "$OUTDIR\jacksum-sendto.bat" "cmd_custom     " "$OUTDIR\jacksum.ico" 0 SW_SHOWMINIMIZED
  CreateShortCut "$SENDTO\Jacksum - 4) $(EditBatch).lnk"      "$OUTDIR\jacksum-sendto.bat" "cmd_edit       " "$OUTDIR\jacksum.ico" 0 SW_SHOWMINIMIZED
  # Help is now accessible from the GUI
  # CreateShortCut "$SENDTO\Jacksum - 5) $(Help).lnk"           "$OUTDIR\jacksum-sendto.bat" "cmd_help       " "$OUTDIR\jacksum.ico" 0 SW_SHOWMINIMIZED

  CreateDirectory "$SMPROGRAMS"
  CreateShortCut "$SMPROGRAMS\HashGarten.lnk"                 "$OUTDIR\hashgarten.exe" ""                    "$OUTDIR\jacksum.ico" 0 SW_SHOWMINIMIZED
#  ${StdUtils.InvokeShellVerb} $0 "$SYSDIR" "$SMPROGRAMS\HashGarten.lnk" ${StdUtils.Const.ShellVerb.PinToTaskbar}
  
  # Environment variable management in user land
  EnVar::SetHKCU
  DetailPrint "EnVar::SetHKCU"

  # Create environment variable JACKSUM_HOME
  # Check if the 'JACKSUM_HOME' variable exists in HKCU
  EnVar::Check "JACKSUM_HOME" "NULL"
  Pop $0
  DetailPrint "EnVar::Check returned=|$0|"
  StrCmp $0 0 0 nohome
  DetailPrint "The environment variable JACKSUM_HOME already exists. I remove it."
  EnVar::Delete "JACKSUM_HOME"
  Pop $0
  DetailPrint "EnVar::Delete returned=|$0|"
  nohome:
  DetailPrint "The environment variable JACKSUM_HOME is not there. I add it."
  EnVar::AddValue "JACKSUM_HOME" "$OUTDIR"
  Pop $0
  DetailPrint "EnVar::AddValue returned=|$0|"

  # Add %JACKSUM_HOME% to the PATH
  # Check if the 'PATH' variable exists in EnVar::SetHKCU
  EnVar::Check "PATH" "%JACKSUM_HOME%"
  Pop $0
  #DetailPrint "EnVar::Check returned=|$0|"
  StrCmp $0 0 0 nopath
  DetailPrint "The value %JACKSUM_HOME% in the environment variable PATH is already there. Nothing to do."
  Goto endpath
  nopath:
  DetailPrint "The value %JACKSUM_HOME% in the environment variable PATH is not there. I add it."
  EnVar::AddValue "PATH" "%JACKSUM_HOME%"
  Pop $0
  #DetailPrint "EnVar::AddValue returned=|$0|"
  endpath:

  ; Required keys of the add/remove control panel
  WriteRegStr HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "DisplayName" "Jacksum ${JACKSUM_VERSION} + HashGarten ${HASHGARTEN_VERSION}"
  WriteRegStr HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
  ; Recommended keys of the add/remove control panel
  WriteRegStr HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "Publisher" "Johann N. Löfflmann"
  WriteRegStr HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "DisplayVersion" "${VERSION}"
  IntFmt $0 "0x%08X" 2
  WriteRegDWORD HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "VersionMajor" "$0"
  IntFmt $0 "0x%08X" 8
  WriteRegDWORD HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "VersionMinor" "$0"
  IntFmt $0 "0x%08X" 0
  WriteRegDWORD HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "NoModify" "$0"
  IntFmt $0 "0x%08X" 1
  WriteRegDWORD HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "NoRepair" "$0"
  ; Optional keys of the add/remove control panel
  WriteRegStr HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "DisplayIcon" "$\"$INSTDIR\jacksum.ico$\""
  WriteRegStr HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "HelpLink" "https://github.com/jonelo/jacksum-fbi-windows"
  WriteRegStr HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "URLInfoAbout" "https://github.com/jonelo/jacksum-fbi-windows"
  WriteRegStr HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "URLUpdateInfo" "https://github.com/jonelo/jacksum-fbi-windows/releases"
  WriteRegStr HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "Comments" "Jacksum File Browser Integration"
  WriteRegStr HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\""

  ; Create the uninstaller executable
  WriteUninstaller $OUTDIR\uninstall.exe

  ; Determine the size of the installation
  ${GetSize} "$INSTDIR" "/S=0K" $0 $1 $2
  IntFmt $0 "0x%08X" $0
  WriteRegDWORD HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}" "EstimatedSize" "$0"
  
  # DetailPrint $(Success)
  MessageBox MB_ICONINFORMATION|MB_OK|MB_SETFOREGROUND $(Success) IDOK +1
  # Quit

SectionEnd


Section "Uninstall"
  # Remove the start menu item
  Delete "$SMPROGRAMS\HashGarten.lnk"
  
  # RMdir /r $SENDTO\Jacksum
  Delete $SENDTO\Jacksum*
  RMdir /r "$PROFILE\Jacksum for Windows"
  #Delete $INSTDIR\uninstall.exe ; delete self

  # Delete the JACKSUM_HOME value
  EnVar::Delete "JACKSUM_HOME"
  Pop $0
  DetailPrint "EnVar::Delete returned=$0"

  # Delete %JACKSUM_HOME% from PATH
  EnVar::DeleteValue "PATH" "%JACKSUM_HOME%"
  Pop $0
  DetailPrint "EnVar::DeleteValue returned=$0"

  # Remove the registry tree
  DeleteRegKey HKCU "${REGPATH_WINUNINST}\${REGUNINSTKEY}"
  
  #MessageBox MB_ICONINFORMATION|MB_OK|MB_SETFOREGROUND $(Uninstall) IDOK +1
  #Quit
SectionEnd



# Prevent Multiple Instances
Function .onInit
  System::Call "kernel32::CreateMutexA(i 0, i 0, t 'SendToJacksum') i .r1 ?e"
  Pop $R0
  StrCmp $R0 0 +2
  Abort  
  SetRegView 64
FunctionEnd


Function GetParameters
  Push $R0
  Push $R1
  Push $R2
  StrCpy $R0 $CMDLINE 1
  StrCpy $R1 '"'
  StrCpy $R2 1
  StrCmp $R0 '"' loop
  StrCpy $R1 ' '
  loop:
    StrCpy $R0 $CMDLINE 1 $R2
    StrCmp $R0 $R1 loop2
    StrCmp $R0 "" loop2
    IntOp $R2 $R2 + 1
    Goto loop
  loop2:
    IntOp $R2 $R2 + 1
    StrCpy $R0 $CMDLINE 1 $R2
    StrCmp $R0 " " loop2
  StrCpy $R0 $CMDLINE "" $R2
  Pop $R2
  Pop $R1
  Exch $R0
FunctionEnd


Function StrRep
  Exch $R4 ; $R4 = Replacement String
  Exch
  Exch $R3 ; $R3 = String to replace (needle)
  Exch 2
  Exch $R1 ; $R1 = String to do replacement in (haystack)
  Push $R2 ; Replaced haystack
  Push $R5 ; Len (needle)
  Push $R6 ; len (haystack)
  Push $R7 ; Scratch reg
  StrCpy $R2 ""
  StrLen $R5 $R3
  StrLen $R6 $R1
loop:
  StrCpy $R7 $R1 $R5
  StrCmp $R7 $R3 found
  StrCpy $R7 $R1 1 ; - optimization can be removed if U know len needle=1
  StrCpy $R2 "$R2$R7"
  StrCpy $R1 $R1 $R6 1
  StrCmp $R1 "" done loop
found:
  StrCpy $R2 "$R2$R4"
  StrCpy $R1 $R1 $R6 $R5
  StrCmp $R1 "" done loop
done:
  StrCpy $R3 $R2
  Pop $R7
  Pop $R6
  Pop $R5
  Pop $R2
  Pop $R1
  Pop $R4
  Exch $R3
FunctionEnd


Function AdvReplaceInFile
  Exch $0 ; FILE_TO_MODIFIED file to replace in
  Exch
  Exch $1 ; the NR_OCC of OLD_STR occurrences to be replaced.
  Exch
  Exch 2
  Exch $2 ; FST_OCC: the first occurrence to be replaced and onwards
  Exch 2
  Exch 3
  Exch $3 ; REPLACEMENT_STR string to replace with
  Exch 3
  Exch 4
  Exch $4 ; OLD_STR to be replaced
  Exch 4
  Push $5 ; incrementing counter
  Push $6 ; a chunk of read line
  Push $7 ; the read line altered or not
  Push $8 ; left string
  Push $9 ; right string or forster read line
  Push $R0 ; temp file handle
  Push $R1 ; FILE_TO_MODIFIED file handle
  Push $R2 ; a line read
  Push $R3 ; the length of OLD_STR
  Push $R4 ; counts reaching of FST_OCC
  Push $R5 ; counts reaching of NR_OCC
  Push $R6 ; temp file name
 
  GetTempFileName $R6
 
  FileOpen $R1 $0 r 		; FILE_TO_MODIFIED file to search in
  FileOpen $R0 $R6 w        ; temp file
  StrLen $R3 $4             ; the length of OLD_STR
  StrCpy $R4 0				; counter initialization
  StrCpy $R5 -1             ; counter initialization
 
loop_read:
  ClearErrors
  FileRead $R1 $R2 			; reading line
  IfErrors exit				; when end of file has been reached
 
  StrCpy $5 -1              ; cursor, start of read line chunk
  StrLen $7 $R2             ; read line length
  IntOp $5 $5 - $7          ; cursor initialization
  StrCpy $7 $R2             ; $7 contains read line
 
loop_filter:
  IntOp $5 $5 + 1           ; cursor shifting
  StrCmp $5 0 file_write    ; end of line has been reached
  StrCpy $6 $7 $R3 $5       ; a chunk of read line of length OLD_STR 
  StrCmp $6 $4 0 loop_filter ; continues to search OLD_STR if no match
 
  StrCpy $8 $7 $5           ; left part 
  IntOp $6 $5 + $R3
  IntCmp $6 0 yes no        ; left part + OLD_STR == full line read ?						
yes:
  StrCpy $9 ""
  Goto done
no:
  StrCpy $9 $7 "" $6        ; right part
done:
  StrCpy $9 $8$3$9          ; replacing OLD_STR by REPLACEMENT_STR in forster read line
 
  IntOp $R4 $R4 + 1			; counter incrementation
  ;MessageBox MB_OK|MB_ICONINFORMATION \
  ;"count R4 = $R4, fst_occ = $2" 
  StrCmp $2 all follow_up   ; exchange ok, then goes to search the next OLD_STR
  IntCmp $R4 $2 follow_up   ; no exchange until FST_OCC has been reached,
  Goto loop_filter          ; and then searching for the next OLD_STR
 
follow_up:	
  IntOp $R4 $R4 - 1			; now counter is to be stuck to FST_OCC
 
  IntOp $R5 $R5 + 1			; counter incrementation
  ; MessageBox MB_OK|MB_ICONINFORMATION \
  ; "count R5 = $R5, nbr_occ = $1" 
  StrCmp $1 all exchange_ok ; goes to exchange OLD_STR with REPLACEMENT_STR
  IntCmp $R5 $1 finalize    ; proceeding exchange until NR_OCC has been reached														
 
exchange_ok:
  IntOp $5 $5 + $R3         ; updating cursor
  StrCpy $7 $9				; updating read line with forster read line
  Goto loop_filter          ; goes searching the same read line
 
finalize:
  IntOp $R5 $R5 - 1         ; now counter is to be stuck to NR_OCC
 
file_write: 
  FileWrite $R0 $7          ; writes altered or unaltered line 
  Goto loop_read            ; reads the next line
 
exit:
  FileClose $R0
  FileClose $R1
 
  ; SetDetailsPrint none
  Delete $0
  Rename $R6 $0				; superseding FILE_TO_MODIFIED file with
	                        ; temp file built with REPLACEMENT_STR 
  ; Delete $R6
  ; SetDetailsPrint lastused
 
  Pop $R6
  Pop $R5
  Pop $R4
  Pop $R3
  Pop $R2
  Pop $R1
  Pop $R0
  Pop $9
  Pop $8
  Pop $7
  Pop $6
  Pop $5
  ; These values are stored in the stack in the reverse order they were pushed
  Pop $0
  Pop $1
  Pop $2
  Pop $3
  Pop $4
FunctionEnd


