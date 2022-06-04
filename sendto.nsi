Unicode True
!define VERSION "2.0.0"
!define JACKSUM_VERSION "3.3.0"
!define HASHGARTEN_VERSION "0.9.0"
!define URL "https://jacksum.net"
!define APPNAME "Jacksum ${JACKSUM_VERSION} Windows Explorer Integration ${VERSION}"
!addplugindir .
!include "x64.nsh"


RequestExecutionLevel user
Icon "jacksum-sendto.ico"
Name "Jacksum Windows Explorer Integration"
Caption "${APPNAME}"
OutFile "Jacksum Windows Explorer Integration.exe"
SilentInstall silent
#SilentUnInstall silent
XPStyle on

# Default installation folder
InstallDir "$PROFILE\Jacksum Windows Explorer Integration"

LoadLanguageFile "${NSISDIR}\Contrib\Language files\English.nlf"
LoadLanguageFile "${NSISDIR}\Contrib\Language files\German.nlf"

LangString Success ${LANG_ENGLISH} \
  'The installation was successful.\
  $\n\
  $\nDetails: \
  Jacksum ${JACKSUM_VERSION}, HashGarten ${HASHGARTEN_VERSION} and an uninstaller have been stored to\
  $\n\
  $\n$OUTDIR\
  $\n\
  $\nFrom the Windows Explorer "Send To" menu, you can call HashGarten\
  in order to compute and verify hash values with Jacksum.'

LangString Success ${LANG_GERMAN} \
  'Die Installation war erfolgreich.\
  $\n\
  $\nDetails: \
  Jacksum ${JACKSUM_VERSION}, HashGarten ${HASHGARTEN_VERSION} und ein Uninstaller wurden gespeichert nach\
  $\n\
  $\n$OUTDIR\
  $\n\
  $\nAus dem "Senden an" Menü des Windows Explorers können Sie nun \
  HashGarten aufrufen, um Hashwerte mit Jacksum zu berechnen und zu überprüfen.'


LangString CmdSelect ${LANG_ENGLISH}      'Calculate hash values'
LangString CmdSelect ${LANG_GERMAN}       'Berechne Hashwerte'

LangString CheckIntegrity ${LANG_ENGLISH} 'Check the data integrity'
LangString CheckIntegrity ${LANG_GERMAN}  'Überprüfe die Datenintegrität'

 LangString AllAlgorithms ${LANG_ENGLISH} 'All algorithms'
 LangString AllAlgorithms ${LANG_GERMAN}  'Alle Algorithmen'

LangString Customized ${LANG_ENGLISH}     'Customized output'
LangString Customized ${LANG_GERMAN}      'Benutzerdefinierte Ausgabe'

LangString EditBatch ${LANG_ENGLISH}      'Edit batch'
LangString EditBatch ${LANG_GERMAN}       'Bearbeite Batch'

LangString OpenSendTo ${LANG_ENGLISH}     'Open the SendTo Folder'
LangString OpenSendTo ${LANG_GERMAN}      'Öffne das Verzeichnis "Senden-an"'

LangString Help ${LANG_ENGLISH}           'Help'
LangString Help ${LANG_GERMAN}            'Hilfe'

 
Section
  
  StrCpy $R2 ""
  Call GetParameters
  Pop $R2
  
  ClearErrors

  ReadRegStr $R0 HKLM \
  "SOFTWARE\Microsoft\Windows NT\CurrentVersion" CurrentVersion
  IfErrors 0 winnt
  MessageBox MB_ICONINFORMATION|MB_OK 'Explorer Integration not possible on this Windows release' IDOK +1
  Quit  
  winnt:

  ClearErrors
  SetOutPath "$PROFILE\Jacksum Windows Explorer Integration"
  File jacksum.bat

  Push @PATH@   # text to be replaced
  Push "$PROFILE\Jacksum Windows Explorer Integration"  # replace with
  Push all # replace all occurrences
  Push all # replace all occurrences
  Push "$PROFILE\Jacksum Windows Explorer Integration\jacksum.bat"
  Call AdvReplaceInFile

  Push @JAVA@   # text to be replaced
  Push "$PROFILE\Jacksum Windows Explorer Integration\jre\bin\java.exe"  # replace with
  Push all # replace all occurrences
  Push all # replace all occurrences
  Push "$PROFILE\Jacksum Windows Explorer Integration\jacksum.bat"
  Call AdvReplaceInFile

  SetOutPath "$PROFILE\Jacksum Windows Explorer Integration"
  File jacksum-sendto.bat
  File jacksum-sendto.ico
  File jacksum-${JACKSUM_VERSION}.jar
  File HashGarten-${HASHGARTEN_VERSION}.jar
  File flatlaf-2.3.jar
  File license.txt
  File /r jre

  Push @PATH@   # text to be replaced
  Push "$PROFILE\Jacksum Windows Explorer Integration"  # replace with
  Push all # replace all occurrences
  Push all # replace all occurrences
  Push "$PROFILE\Jacksum Windows Explorer Integration\jacksum-sendto.bat"
    Call AdvReplaceInFile
    
  Push @JAVAW@   # text to be replaced
  Push "$PROFILE\Jacksum Windows Explorer Integration\jre\bin\javaw.exe"  # replace with
  Push all # replace all occurrences
  Push all # replace all occurrences
  Push "$PROFILE\Jacksum Windows Explorer Integration\jacksum-sendto.bat"
    Call AdvReplaceInFile

  # write files to the SendTo directory
  Delete $SENDTO\Jacksum*
  RMdir /r $SENDTO\Jacksum

  # create shortcuts
  # use the following batch script in order to get the following lines:
  # 
  # #!/bin/bash
  # for ALGO in $(jacksum -a all --list)
  # do
  #   printf "  CreateShortCut \"\$SENDTO\\Jacksum - %s.lnk\" \"\$OUTDIR\\jacksum-sendto.bat\" \"%-16s\" \"\$OUTDIR\\jacksum-sendto.ico\" 0 SW_SHOWMINIMIZED\n" "$ALGO" "$ALGO"
  # done
  
  # --start generated--
  # --end generated--

  CreateShortCut "$SENDTO\Jacksum - 1) $(CmdSelect).lnk"      "$OUTDIR\jacksum-sendto.bat" "cmd_select     " "$OUTDIR\jacksum-sendto.ico" 0 SW_SHOWMINIMIZED
  CreateShortCut "$SENDTO\Jacksum - 2) $(CheckIntegrity).lnk" "$OUTDIR\jacksum-sendto.bat" "cmd_check      " "$OUTDIR\jacksum-sendto.ico" 0 SW_SHOWMINIMIZED
  CreateShortCut "$SENDTO\Jacksum - 3) $(Customized).lnk"     "$OUTDIR\jacksum-sendto.bat" "cmd_custom     " "$OUTDIR\jacksum-sendto.ico" 0 SW_SHOWMINIMIZED
  CreateShortCut "$SENDTO\Jacksum - 4) $(EditBatch).lnk"      "$OUTDIR\jacksum-sendto.bat" "cmd_edit       " "$OUTDIR\jacksum-sendto.ico" 0 SW_SHOWMINIMIZED
  CreateShortCut "$SENDTO\Jacksum - 5) $(Help).lnk"           "$OUTDIR\jacksum-sendto.bat" "cmd_help       " "$OUTDIR\jacksum-sendto.ico" 0 SW_SHOWMINIMIZED

  WriteUninstaller $OUTDIR\uninstaller.exe
  
  MessageBox MB_ICONINFORMATION|MB_OK|MB_SETFOREGROUND $(Success) IDOK +1
  Quit

SectionEnd

# Prevent Multiple Instances
Function .onInit
  System::Call "kernel32::CreateMutexA(i 0, i 0, t 'SendToJacksum') i .r1 ?e"
  Pop $R0 
  StrCmp $R0 0 +2
  Abort
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

Function AdvReplaceInFile
         Exch $0 ;file to replace in
         Exch
         Exch $1 ;number to replace after
         Exch
         Exch 2
         Exch $2 ;replace and onwards
         Exch 2
         Exch 3
         Exch $3 ;replace with
         Exch 3
         Exch 4
         Exch $4 ;to replace
         Exch 4
         Push $5 ;minus count
         Push $6 ;universal
         Push $7 ;end string
         Push $8 ;left string
         Push $9 ;right string
         Push $R0 ;file1
         Push $R1 ;file2
         Push $R2 ;read
         Push $R3 ;universal
         Push $R4 ;count (onwards)
         Push $R5 ;count (after)
         Push $R6 ;temp file name
         GetTempFileName $R6
         FileOpen $R1 $0 r ;file to search in
         FileOpen $R0 $R6 w ;temp file
                  StrLen $R3 $4
                  StrCpy $R4 -1
                  StrCpy $R5 -1
        loop_read:
         ClearErrors
         FileRead $R1 $R2 ;read line
         IfErrors exit
         StrCpy $5 0
         StrCpy $7 $R2
 
        loop_filter:
         IntOp $5 $5 - 1
         StrCpy $6 $7 $R3 $5 ;search
         StrCmp $6 "" file_write2
         StrCmp $6 $4 0 loop_filter
 
         StrCpy $8 $7 $5 ;left part
         IntOp $6 $5 + $R3
         StrCpy $9 $7 "" $6 ;right part
         StrCpy $7 $8$3$9 ;re-join
 
         IntOp $R4 $R4 + 1
         StrCmp $2 all file_write1
         StrCmp $R4 $2 0 file_write2
         IntOp $R4 $R4 - 1
 
         IntOp $R5 $R5 + 1
         StrCmp $1 all file_write1
         StrCmp $R5 $1 0 file_write1
         IntOp $R5 $R5 - 1
         Goto file_write2
 
        file_write1:
         FileWrite $R0 $7 ;write modified line
         Goto loop_read
 
        file_write2:
         FileWrite $R0 $R2 ;write unmodified line
         Goto loop_read
 
        exit:
         FileClose $R0
         FileClose $R1
 
         SetDetailsPrint none
         Delete $0
         Rename $R6 $0
         Delete $R6
         SetDetailsPrint both
 
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
         Pop $4
         Pop $3
         Pop $2
         Pop $1
         Pop $0
FunctionEnd

Section "Uninstall"
  # RMdir /r $SENDTO\Jacksum
  Delete $SENDTO\Jacksum*
  RMdir /r "$PROFILE\Jacksum Windows Explorer Integration"
  #Delete $INSTDIR\uninstaller.exe ; delete self
  #MessageBox MB_ICONINFORMATION|MB_OK|MB_SETFOREGROUND $(Uninstall) IDOK +1
  #Quit
SectionEnd

