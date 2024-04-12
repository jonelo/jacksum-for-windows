![GitHub downloads](https://img.shields.io/github/downloads/jonelo/jacksum-fbi-windows/total?color=green)

# Jacksum FBI for Windows

The Jacksum File Browser Integration for Microsoft Windows allows you to access features of [Jacksum](https://github.com/jonelo/jacksum) through [HashGarten](https://github.com/jonelo/HashGarten) from the Send To menu at the Microsoft File Explorer, and other file managers that are supported.

## Requirements

  * Microsoft Windows 10 or 11
  * At least one of the supported file browsers below
  * Hardware
    * Processor with x64 chip set
    * 128 MiB free RAM
    * 128 MiB free disk space
   
## Supported File Browsers

Any file manager that supports the Microsoft Windows Standard **Send To**-API is supported by this integration program. In addition to that, file managers are supported that support a way to pass files or directories to external scripts or programs - which allows them to access Send To functions indirectly.

If your preferred file manager is not listed below, or it does not support "Send to", chances are high that your file manager supports at least **drag & drop**, so you could use drag & drop to transfer file/directory-paths from your file manager to the HashGarten GUI where you can process data further, e. g. calculate hashes from file/directory-paths.

The following file managers have been tested successfully:

| File Manager                                                      | License     | API         | Comment                                                                     |
|-------------------------------------------------------------------|-------------|-------------|-----------------------------------------------------------------------------|
| Altap Salamander                                                  | proprietary | Send To     | Freeware                                                                    |
| Directory Opus                                                    | proprietary | Send To     | Commercial Software                                                         |
| [Double Commander](https://sourceforge.net/projects/doublecmd/)   | GPLv2       | Send To     | Free Open Source Software                                                   |
| EF Commander                                                      | proprietary | Send To     | Commercial Software                                                         |
| [Explorer++](https://github.com/derceg/explorerplusplus)          | GPLv3       | Send To     | Free Open Source Software                                                   |
| Explorer Commander                                                | proprietary | Send To     | Freeware                                                                    |
| [Files](https://github.com/files-community/files/)                | MIT         | Send To     | Free Open Source Software                                                   |
| FileVoyager                                                       | proprietary | Send To     | Freeware                                                                    |
| FreeCommander                                                     | proprietary | Send To     | Freeware                                                                    |
| IdosWin Pro                                                       | proprietary | Send To     | Freeware
| [muCommander](https://github.com/mucommander/mucommander)         | GPLv3       | proprietary | supported via commands.xml, API limit: can pass one file or one dir only to HashGarten, see [issue #1](https://github.com/jonelo/jacksum-fbi-windows/issues)  |
| Multi Commander                                                   | proprietary | Send To     | Freeware                                                                    |
| OneCommander                                                      | proprietary | Send To     | Freeware, "Send To" for files only, not for directories                     |
| Q-Dir                                                             | proprietary | Send To     | Freeware                                                                    |
| SpeedCommander                                                    | proprietary | Send To     | Commercial Software                                                         |
| [Tablacus Explorer](https://github.com/tablacus/TablacusExplorer) | MIT         | Send To     | Free Open Source Software                                                   |
| Universal Explorer                                                | proprietary | Send To     | Commercial Software                                                         |
| Windows File Explorer                                             | proprietary | Send To     | Commercial Software, bundled with Microsoft Windows, formerly known as Microsoft Explorer |
| xplorer²                                                          | proprietary | Send To     | Commercial Software                                                         |
| XYplorer                                                          | proprietary | Send To     | Commercial Software                                                         |


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

On Windows 11, select files and directories, hold down the shift key when you right-click with your mouse and select "Send to".
On Windows 10, select files and directories, right click with your mouse and select "Send to".

<img src="https://raw.githubusercontent.com/jonelo/jacksum-fbi-windows/main/docs/images/sendto-de.png" alt="Send to screenshot" style="vertical-align:top;margin:10px 10px" />

After a menu item has been selected fro the "Send to" menu, [HashGarten](https://github.com/jonelo/HashGarten) resp. [Jacksum](https://github.com/jonelo/jacksum) take over.

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

## Show your support

Please ⭐️ this repository if this project helped you!
