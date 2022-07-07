![GitHub downloads](https://img.shields.io/github/downloads/jonelo/jacksum-fbi-windows/total?color=green)

# Jacksum FBI for Windows

The Jacksum File Browser Integration for Microsoft Windows allows you to access features of [Jacksum](https://github.com/jonelo/jacksum) through [HashGarten](https://github.com/jonelo/HashGarten) from the Send To menu at the Microsoft Windows Explorer.

## Requirements

  * Microsoft Windows 10 or 11 (well, it actually also works with older releases, but those are not recommended to use anymore due to security reasons)
  * Any Windows-based file manager that supports the Windows Standard "Send To"-API. Tested examples:
    * Microsoft Windows Explorer or
    * [Double Commander](https://sourceforge.net/projects/doublecmd/) (GPLv2) or
    * [Explorer++](https://github.com/derceg/explorerplusplus) (GPLv3) or
    * Altap Salamander (Freeware), FreeCommander (Freeware), Multi Commander (Freeware), Q-Dir (Freeware) or
    * EF Commander (commercial), XYplorer (commercial)
  * Processor with x64 chip set
  * ~128 MiB free RAM
  * ~128 MiB free disk space

## Download

Go to https://github.com/jonelo/jacksum-fbi-windows/releases/latest and download the .zip which contains a precompiled executable for Microsoft Windows.
You also find official hashes in the release notes.

## Installation

Just extract the .zip file and double click on the executable called `Jacksum Windows Explorer Integration.exe`.
Allow Microsoft Defender SmartScreen to start the app. Before you do that you should verify hashes to make sure you have obtained the executable from a reliable source.

<img src="https://raw.githubusercontent.com/jonelo/jacksum-fbi-windows/main/docs/images/Jacksum_Windows_Explorer_Integration_2.0.0.png" alt="Jacksum Windows Explorer Integration Installation" style="vertical-align:top;margin:10px 10px" />


## Use it

<img src="https://raw.githubusercontent.com/jonelo/jacksum-fbi-windows/main/docs/images/sendto-de.png" alt="Send to screenshot" style="vertical-align:top;margin:10px 10px" />

After a menu item has been selected, [HashGarten](https://github.com/jonelo/HashGarten) resp. [Jacksum](https://github.com/jonelo/jacksum) take over.

A video is available at https://www.youtube.com/watch?v=aLE6y7Osjac

<a href="http://www.youtube.com/watch?feature=player_embedded&v=aLE6y7Osjac" target="_blank"><img src="http://img.youtube.com/vi/aLE6y7Osjac/0.jpg" 
alt="Jacksum and HashGarten integrated at the Windows Explorer" width="240" height="180" border="10" /></a>

## Customization

You can modify the batch (just select item 4 at the Send To menu) if the default customized format does not meet your need or if you use a different editor rather than the Windows Notepad.

## Developer hints

The installer called sendto.nsi is written in NSIS. You need the NSIS compiler to compile .nsi, see also https://nsis.sourceforge.io.

### Required binaries

- HashGarten - https://github.com/jonelo/HashGarten
- Jacksum - https://github.com/jonelo/jacksum
- FlatLaF - https://github.com/JFormDesigner/FlatLaf
- OpenJDK Runtime 11+ - https://adoptium.net
