![GitHub downloads](https://img.shields.io/github/downloads/jonelo/jacksum-fbi-windows/total?color=green)

# Jacksum for Windows

Jacksum for Windows is an installer that allows you to access features of [Jacksum](https://github.com/jonelo/jacksum) easily on Microsoft Windows

  * through a **Graphical User Interface** called [HashGarten](https://github.com/jonelo/HashGarten)
  * from the **Send To menu** of the Windows File Explorer and compatible file managers
  * and on the **Command Line**

## Requirements

### Hardware

  * Processor with x64 chip set
  * 128 MiB free RAM
  * 128 MiB free disk space

### Software

  * Microsoft Windows 10 or 11
  * Microsoft File Explorer or at least one of the supported file browsers below

#### Supported File Managers

Any file manager that supports the Microsoft Windows Standard **Send To**-Interface is fully supported by the installer.

> [!TIP]
> If your preferred file manager does not support "Send to", chances are high that your file manager supports at least **drag & drop**, so you could use drag & drop to transfer file/directory-paths from your file manager to the HashGarten GUI where you can process data further, e. g. calculate hashes from file/directory-paths.

The following file managers have been tested successfully to work with Jacksum and HashGarten:

| File Manager                                                       | Interfaces    | Comment                                                                    |
|--------------------------------------------------------------------|---------------|----------------------------------------------------------------------------|
| [Altap Salamander](https://www.altap.cz)                           | Send To + DnD | Freeware                                                                   |
| [Directory Opus](https://www.gpsoft.com.au)                        | Send To + DnD | Commercial Software (Trial)                                                |
| [Double Commander](https://sourceforge.net/projects/doublecmd/)    | Send To + DnD | Free/Libre Open Source Software (GPLv2)                                    |
| [EF Commander](https://www.efsoftware.com/cw/d.htm)                | Send To + DnD | Commercial Software (Trial)                                                |
| [Everything](https://www.voidtools.com/)                           | DnD           | Freeware                                                                   |
| [Explorer++](https://github.com/derceg/explorerplusplus)           | Send To + DnD | Free Open Source Software (GPLv3)                                          |
| [Files](https://github.com/files-community/files/)                 | Send To + DnD | Free/Libre Open Source Software (MIT), Jacksum icons are garbled           |
| [FileVoyager](https://www.filevoyager.com)                         | Send To       | Freeware, no DnD support                                                   |
| [FreeCommander XE](https://freecommander.com)                      | Send To + DnD | Freeware (32 bit), Commercial Software (64 bit)                            |
| [IdosWin Pro](https://www.idoswin.de)                              | Send To + DnD | Freeware                                                                   |
| [muCommander](https://github.com/mucommander/mucommander)          | proprietary API + DnD | Free/Libre Open Source Software (GPLv3); supported by commands.xml, API limit: can pass one file or one dir only to HashGarten, see [issue #3](https://github.com/jonelo/jacksum-fbi-windows/issues/3) |
| [Multi Commander](https://multicommander.com)                      | Send To + DnD | Freeware                                                                   |
| [OneCommander](https://www.onecommander.com)                       | DnD           | Freeware, "Send to" does not show Jacksum entries                          |
| [Q-Dir](https://q-dir.com)                                         | Send To + DnD | Freeware                                                                   |
| [SpeedCommander](https://www.speedproject.com)                     | Send To + DnD | Commercial Software (Trial)                                                |
| [Tablacus Explorer](https://github.com/tablacus/TablacusExplorer)  | Send To + DnD | Free/Libre Open Source Software (MIT)                                      |
| [Universal Explorer](https://www.spadixbd.com/universal/index.htm) | Send To + DnD   | Commercial Software (Trial), Send To limited to one file, DnD is instable |
| [VioletGiraffe File Commander](https://github.com/VioletGiraffe/file-commander/) | Send To + DnD | Free/Libre Open Source Software (Apache 2.0) |
| [Windows File Explorer](https://support.microsoft.com/en-us/windows/windows-explorer-has-a-new-name-c95f0e92-b1aa-76da-b994-36a7c7c413d7)      | Send To + DnD   | Commercial Software, bundled with Microsoft Windows, formerly known as Microsoft Explorer |
| [xplorer²](https://www.zabkat.com/)                                | Send To + DnD     | Commercial Software (Trial)                                            |
| [XYplorer](https://www.xyplorer.com/)                              | Send To + DnD     | Commercial Software (Trial)                                            |


## Download

Go to the [Download Page](https://github.com/jonelo/jacksum-fbi-windows/releases/latest) and download the .zip file which contains a precompiled executable for Microsoft Windows.
You also find official hashes in the release notes.

## Installation

Just extract the .zip file and double-click on the executable called `Jacksum for Windows.exe`.
Allow Microsoft Defender SmartScreen to start the app. I didn't sign the app, because it would require a fee for me.
Before you execute the app you should verify the official hash values to make sure you have obtained the executable from a reliable source. The hash values are available on the [download page](https://github.com/jonelo/jacksum-fbi-windows/releases/latest) or on the [Jacksum homepage](https://jacksum.net/en/download.html).

The installer installs the JRE 21 LTS, Jacksum, and HashGarten to the your homedirectory under the folder `Jacksum for Windows`. The environment variable called
JACKSUM_HOME is set with the value of the installation folder, and it is added to the user's PATH, so you can also launch Jacksum just by typing `jacksum` on the command line if you want to.

You can launch the installer as often as you want.

After successful installation a dialog box informs you what have been done.

<img src="https://raw.githubusercontent.com/jonelo/jacksum-fbi-windows/main/docs/images/Jacksum_Windows_Explorer_Integration_2.0.0.png" alt="Jacksum File Explorer Integration Installation" style="vertical-align:top;margin:10px 10px" />

## Usage

> [!TIP]
> The installer does not only integrate Jacksum and HashGarten to your File Browser, and makes it accessible for the start menu, it also allows you to call Jacksum from the command line or call HashGarten as standalone app.

### As Standalone Application

Click on the Window search menu and type "HashGarten" to find the app

![explorer_RTUC1bXfNb](https://github.com/jonelo/jacksum-fbi-windows/assets/10409423/1df6af33-2925-45de-a52a-0eb96c235040)

or go to the installation folder called `Jacksum for Windows` which is located under your home directory and double click on the `.jar` file that is prefixed by `HashGarten`.

![grafik](https://github.com/jonelo/jacksum-fbi-windows/assets/10409423/d50f5236-be94-4c80-824b-a15ab6514a82)

> [!TIP]
> If double click on the HashGarten jar does not work, just call [Jarfix](https://johann.loefflmann.net/en/software/jarfix/index.html).


### From your File Manager

On Windows 11, select files and directories, hold down the shift key when you right-click with your mouse and select "Send to".
On Windows 10, select files and directories, right click with your mouse and select "Send to".

<img src="https://raw.githubusercontent.com/jonelo/jacksum-fbi-windows/main/docs/images/sendto-de.png" alt="Send to screenshot" style="vertical-align:top;margin:10px 10px" />

After a menu item has been selected fro the "Send to" menu, [HashGarten](https://github.com/jonelo/HashGarten) resp. [Jacksum](https://github.com/jonelo/jacksum) take over.

A video is available at https://www.youtube.com/watch?v=aLE6y7Osjac

<a href="http://www.youtube.com/watch?feature=player_embedded&v=aLE6y7Osjac" target="_blank"><img src="http://img.youtube.com/vi/aLE6y7Osjac/0.jpg" 
alt="Jacksum and HashGarten integrated at the Windows File Explorer" width="240" height="180" border="10" /></a>


### At the Command Line

Just open a Command Prompt and type `jacksum`.

![grafik](https://github.com/jonelo/jacksum-fbi-windows/assets/10409423/79ae249c-68f7-42b3-a7ed-488752e023c0)


## Customization

You can modify the batch (just select item 4 at the Send To menu) if the default customized format does not meet your need or if you use a different editor rather than the Windows Notepad.

## Uninstallation

In the `Jacksum Windows File Explorer Integration` folder you also find an `uninstaller.exe` which removes Jacksum and HashGarten entirely from your disk again.

## Developer Hints

The installer called `sendto.nsi` is written in NSIS. You need the [NSIS Compiler](https://nsis.sourceforge.io/Main_Page) to compile .nsi to an .exe.

### Required Binaries

- Jacksum - https://github.com/jonelo/jacksum
- HashGarten - https://github.com/jonelo/HashGarten
- FlatLaF - https://github.com/JFormDesigner/FlatLaf
- OpenJDK Runtime 11+ - https://adoptium.net
- NSIS EnVar plug-in - https://nsis.sourceforge.io/EnVar_plug-in 

## Show Your Support

Please ⭐️ this repository if this project helped you!
