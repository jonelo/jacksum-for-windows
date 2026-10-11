![GitHub downloads](https://img.shields.io/github/downloads/jonelo/jacksum-fbi-windows/total?color=green)

# Jacksum for Windows

Jacksum for Windows is an installer that makes the features of [Jacksum](https://github.com/jonelo/jacksum) easily accessible on Microsoft Windows.

The installer sets up:

- [Jacksum](https://github.com/jonelo/jacksum) – the hash engine, which also provides the command-line interface (CLI)
- [HashGarten](https://github.com/jonelo/HashGarten) – a standalone graphical user interface (GUI) for Jacksum
- glue scripts that call Jacksum and HashGarten from your preferred file manager
- an uninstaller that reverts all changes

## Requirements

### Hardware

  * x64 processor
  * 128 MiB free RAM
  * 150 MiB free disk space

### Software

  * Microsoft Windows 10 or 11
  * Microsoft File Explorer or one of the file managers listed below

#### Supported File Managers

Any file manager that supports the standard Windows **Send To** interface is fully supported by the installer.

> [!TIP]
> If your file manager does not support "Send To", it most likely supports **drag & drop**. You can then drag files and folders into the HashGarten GUI and process them there, e.g. to calculate their hashes.

The following file managers have been successfully tested with Jacksum and HashGarten:

| File Manager                                                                                                                              | Interfaces            | Comment                                                                                                                                                                                                            |
|-------------------------------------------------------------------------------------------------------------------------------------------|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [7-Zip](https://7-zip.org/)                                                                                                               | DnD                   | Free/libre open-source software (LGPLv2.1)                                                                                                                                                                         |
| [Altap Salamander](https://www.altap.cz)                                                                                                  | Send To + DnD         | Freeware                                                                                                                                                                                                           |
| [Directory Opus](https://www.gpsoft.com.au)                                                                                               | Send To + DnD         | Commercial software (trial)                                                                                                                                                                                        |
| [Double Commander](https://sourceforge.net/projects/doublecmd/)                                                                           | Send To + DnD         | Free/libre open-source software (GPLv2)                                                                                                                                                                            |
| [EF Commander](https://www.efsoftware.com/cw/d.htm)                                                                                       | Send To + DnD         | Commercial software (trial)                                                                                                                                                                                        |
| [Everything](https://www.voidtools.com/)                                                                                                  | DnD                   | Freeware                                                                                                                                                                                                           |
| [Explorer++](https://github.com/derceg/explorerplusplus)                                                                                  | Send To + DnD         | Free open-source software (GPLv3)                                                                                                                                                                                  |
| [File-IO](https://www.file-io.de/)                                                                                                        | Send To               | Commercial software (trial); limitation: files only, no directories                                                                                                                                                |
| [Files](https://github.com/files-community/files/)                                                                                        | Send To + DnD         | Free/libre open-source software (MIT); Jacksum icons are garbled                                                                                                                                                   |
| [Fileside](https://www.fileside.app)                                                                                                      | DnD                   | Commercial software (trial)                                                                                                                                                                                        |
| [FileVoyager](https://www.filevoyager.com)                                                                                                | Send To               | Freeware; no DnD support                                                                                                                                                                                           |
| [FileZilla](https://filezilla-project.org/)                                                                                               | DnD                   | Free/libre open-source software (GPLv2)                                                                                                                                                                            |
| [FreeCommander XE](https://freecommander.com)                                                                                             | Send To + DnD         | Freeware (32-bit), commercial software (64-bit)                                                                                                                                                                    |
| [IdosWin Pro](https://www.idoswin.de)                                                                                                     | Send To + DnD         | Freeware                                                                                                                                                                                                           |
| [Just Manager](http://justmanager.ru)                                                                                                     | Send To + DnD         | Freeware                                                                                                                                                                                                           |
| [muCommander](https://github.com/mucommander/mucommander)                                                                                 | proprietary API + DnD | Free/libre open-source software (GPLv3); supported via commands.xml; API limitation: can pass only one file or one directory to HashGarten, see [issue #3](https://github.com/jonelo/jacksum-fbi-windows/issues/3) |
| [Multi Commander](https://multicommander.com)                                                                                             | Send To + DnD         | Freeware                                                                                                                                                                                                           |
| [OneCommander](https://www.onecommander.com)                                                                                              | DnD                   | Freeware; "Send to" does not show the Jacksum entries                                                                                                                                                              |
| [Q-Dir](https://q-dir.com)                                                                                                                | Send To + DnD         | Freeware                                                                                                                                                                                                           |
| [Saladin](https://saladin.mimec.org/)                                                                                                     | Send To + DnD         | Free/libre open-source software (GPLv3)                                                                                                                                                                            |
| [SpeedCommander](https://www.speedproject.com)                                                                                            | Send To + DnD         | Commercial software (trial)                                                                                                                                                                                        |
| [Tablacus Explorer](https://github.com/tablacus/TablacusExplorer)                                                                         | Send To + DnD         | Free/libre open-source software (MIT)                                                                                                                                                                              |
| [Universal Explorer](https://www.spadixbd.com/universal/index.htm)                                                                        | Send To + DnD         | Commercial software (trial); Send To is limited to one file, DnD is unstable                                                                                                                                       |
| [VioletGiraffe File Commander](https://github.com/VioletGiraffe/file-commander/)                                                          | Send To + DnD         | Free/libre open-source software (Apache 2.0)                                                                                                                                                                       |
| [Windows File Explorer](https://support.microsoft.com/en-us/windows/windows-explorer-has-a-new-name-c95f0e92-b1aa-76da-b994-36a7c7c413d7) | Send To + DnD         | Commercial software, bundled with Microsoft Windows, formerly known as Windows Explorer                                                                                                                            |
| [xplorer²](https://www.zabkat.com/)                                                                                                       | Send To + DnD         | Commercial software (trial)                                                                                                                                                                                        |
| [XYplorer](https://www.xyplorer.com/)                                                                                                     | Send To + DnD         | Commercial software (trial)                                                                                                                                                                                        |


## Download

Go to the [download page](https://github.com/jonelo/jacksum-for-windows/releases/latest) and download the .zip file, which contains a precompiled executable for Microsoft Windows.
The official hash values are listed in the release notes.

## Installation

Before running the installer, verify the official hash values to make sure the executable comes from a trustworthy source. The hash values are available on the [download page](https://github.com/jonelo/jacksum-fbi-windows/releases/latest) and on the [Jacksum homepage](https://jacksum.net/en/download.html).

Extract the .zip file and double-click the executable `Jacksum for Windows.exe`.
If Microsoft Defender SmartScreen warns you, allow the app to run. I haven't code-signed it because signing certificates cost money.

The installer installs the JRE 25 LTS, Jacksum, and HashGarten into the folder `Jacksum for Windows` in your home directory. It sets the environment variable `JACKSUM_HOME` to the installation folder and adds it to your user `PATH`, so you can run Jacksum by typing `jacksum` at the command line.

You can run the installer again at any time.

After a successful installation, a dialog box summarizes what has been installed.

<img src="https://raw.githubusercontent.com/jonelo/jacksum-fbi-windows/main/docs/images/Jacksum_Windows_Explorer_Integration_2.0.0.png" alt="Jacksum File Explorer Integration Installation" style="vertical-align:top;margin:10px 10px" />

## Usage

> [!TIP]
> Besides integrating Jacksum and HashGarten into your file manager and the Start menu, the installer lets you call Jacksum from the command line and run HashGarten as a standalone app.

### As a Standalone Application

Open Windows Search and type "HashGarten" to find the app,

![explorer_RTUC1bXfNb](https://github.com/jonelo/jacksum-fbi-windows/assets/10409423/1df6af33-2925-45de-a52a-0eb96c235040)

or go to the installation folder `Jacksum for Windows` in your home directory and double-click the `.jar` file whose name starts with `HashGarten`.

![](https://github.com/jonelo/jacksum-for-windows/assets/10409423/d50f5236-be94-4c80-824b-a15ab6514a82)

> [!TIP]
> If double-clicking the HashGarten jar does not work, run [Jarfix](https://johann.loefflmann.net/en/software/jarfix/index.html).


### From Your File Manager

On Windows 11, select files and directories, hold down Shift while right-clicking, then select "Send to".
On Windows 10, select files and directories, right-click, and select "Send to".

<img src="https://raw.githubusercontent.com/jonelo/jacksum-fbi-windows/main/docs/images/sendto-de.png" alt="Send to screenshot" style="vertical-align:top;margin:10px 10px" />

Once you select an item from the "Send to" menu, [HashGarten](https://github.com/jonelo/HashGarten) or [Jacksum](https://github.com/jonelo/jacksum) (depending on the entry) takes over.

A video is available at https://www.youtube.com/watch?v=aLE6y7Osjac

<a href="http://www.youtube.com/watch?feature=player_embedded&v=aLE6y7Osjac" target="_blank"><img src="http://img.youtube.com/vi/aLE6y7Osjac/0.jpg" 
alt="Jacksum and HashGarten integrated into Windows File Explorer" width="240" height="180" border="10" /></a>


### At the Command Line

Open a Command Prompt and type `jacksum`.

![](https://github.com/jonelo/jacksum-for-windows/assets/10409423/79ae249c-68f7-42b3-a7ed-488752e023c0)


## Customization

If the default customized output format doesn't meet your needs, or if you prefer an editor other than Windows Notepad, you can modify the batch file (select item 4 in the Send To menu).

## Uninstallation

Open "Installed apps" (Windows 11) or "Programs and Features" (Windows 10), search for "HashGarten", and choose Uninstall from the "…" menu.

![ApplicationFrameHost_mMKeJAoU6f](https://github.com/jonelo/jacksum-for-windows/assets/10409423/c68621e1-f24b-46ac-a2ae-4472cf971e08)

Alternatively, run `uninstall.exe` from the `Jacksum for Windows` folder in your home directory.

The uninstaller completely removes Jacksum and HashGarten from your disk.

## Developer Notes

The installer script `src/sendto.nsi` is written in NSIS. Compiling it into an .exe requires the [NSIS compiler](https://nsis.sourceforge.io/Main_Page).

### Required Binaries

Place the following binaries in `src/` before compiling:

- Jacksum - https://github.com/jonelo/jacksum
- HashGarten - https://github.com/jonelo/HashGarten
- FlatLaF - https://github.com/JFormDesigner/FlatLaf
- OpenJDK Runtime 25 LTS - https://adoptium.net
- NSIS EnVar plug-in - https://nsis.sourceforge.io/EnVar_plug-in 

## Show Your Support

Please ⭐️ this repository if this project helped you!
