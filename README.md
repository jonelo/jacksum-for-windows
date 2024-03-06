![GitHub downloads](https://img.shields.io/github/downloads/jonelo/jacksum-fbi-windows/total?color=green)

# Jacksum FBI for Windows

The Jacksum File Browser Integration for Microsoft Windows allows you to access features of [Jacksum](https://github.com/jonelo/jacksum) through [HashGarten](https://github.com/jonelo/HashGarten) from the Send To menu at the Microsoft File Explorer.

## Requirements

  * Operating System
    * Microsoft Windows 10 or 11
  * File Manager
    * Any Microsoft Windows-based file manager that supports the Microsoft Windows Standard "Send To"-API. The following compatible file managers have been tested successfully:
      * Free Open Source Software
        * [Double Commander](https://sourceforge.net/projects/doublecmd/) (GPLv2), [Explorer++](https://github.com/derceg/explorerplusplus) (GPLv3), [Tablacus Explorer](https://github.com/tablacus/TablacusExplorer) (MIT)
      * Freeware
        * Altap Salamander, FileVoyager, FreeCommander, Multi Commander, Q-Dir
      * Commercial software
        * Microsoft File Explorer
        * Directory Opus, EF Commander, SpeedCommander, xplorer², XYplorer
  * Hardware
    * Processor with x64 chip set
    * ~128 MiB free RAM
    * ~128 MiB free disk space

## Download

Go to https://github.com/jonelo/jacksum-fbi-windows/releases/latest and download the .zip which contains a precompiled executable for Microsoft Windows.
You also find official hashes in the release notes.

## Installation

Just extract the .zip file and double-click on the executable called `Jacksum Windows Explorer Integration.exe`.
Allow Microsoft Defender SmartScreen to start the app. Before you do that you should verify hashes to make sure you have obtained the executable from a reliable source.

The installer installs the JDK 17, Jacksum, and HashGarten to the user's home directory under the folder "Jacksum Windows Explorer Integration". The environment variable called
JACKSUM_HOME is set with the value of the installation folder, and it is added to the user's PATH, so you also launch Jacksum just by typing `jacksum` if you want to.

You can launch the installer as often as you want.

After successful installation a dialog box informs you what have been done.

<img src="https://raw.githubusercontent.com/jonelo/jacksum-fbi-windows/main/docs/images/Jacksum_Windows_Explorer_Integration_2.0.0.png" alt="Jacksum File Explorer Integration Installation" style="vertical-align:top;margin:10px 10px" />

In the "Jacksum Windows Explorer integration" folder you also find an uninstaller.exe which removes
Jacksum entirely from your disk again.

## Use it

<img src="https://raw.githubusercontent.com/jonelo/jacksum-fbi-windows/main/docs/images/sendto-de.png" alt="Send to screenshot" style="vertical-align:top;margin:10px 10px" />

After a menu item has been selected, [HashGarten](https://github.com/jonelo/HashGarten) resp. [Jacksum](https://github.com/jonelo/jacksum) take over.

A video is available at https://www.youtube.com/watch?v=aLE6y7Osjac

<a href="http://www.youtube.com/watch?feature=player_embedded&v=aLE6y7Osjac" target="_blank"><img src="http://img.youtube.com/vi/aLE6y7Osjac/0.jpg" 
alt="Jacksum and HashGarten integrated at the Windows File Explorer" width="240" height="180" border="10" /></a>

## Customization

You can modify the batch (just select item 4 at the Send To menu) if the default customized format does not meet your need or if you use a different editor rather than the Windows Notepad.

## Developer hints

The installer called sendto.nsi is written in NSIS. You need the NSIS compiler to compile .nsi, see also https://nsis.sourceforge.io.

### Required binaries

- Jacksum - https://github.com/jonelo/jacksum
- HashGarten - https://github.com/jonelo/HashGarten
- FlatLaF - https://github.com/JFormDesigner/FlatLaf
- OpenJDK Runtime 11+ - https://adoptium.net
- NSIS EnVar plug-in - https://nsis.sourceforge.io/EnVar_plug-in 
