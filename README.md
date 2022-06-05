# Jacksum FBI for Windows

Jacksum File Browser Integration for Microsoft Windows.

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

## Customization

You can modify the batch (menu item 4 at the Send To menu) if the default does not meet your need.

## Developer hints

The installer called sendto.nsi is written in NSIS. You need the NSIS compiler to compile .nsi, see also https://nsis.sourceforge.io.

### Required binaries

- HashGarten - https://github.com/jonelo/HashGarten
- Jacksum - https://github.com/jonelo/jacksum
- FlatLaF - https://github.com/JFormDesigner/FlatLaf
- OpenJDK Runtime 17.0.3 - https://adoptium.net
