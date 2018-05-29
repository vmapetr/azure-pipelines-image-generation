# VSTS Windows Container(1803) image

The following software is installed on machines in the VSTS **Windows Container(1803)** pool.

Components marked with **\*** have been upgraded since the previous version of the image.


## Chocolatey

_Version:_ 0.10.11<br/>
_Environment:_
* PATH: contains location for choco.exe

## Docker

_Version:_ 17.06.2-ee-11<br/>
_Environment:_
* PATH: contains location of docker.exe

## Docker-compose

_Version:_ 1.21.2<br/>
_Environment:_
* PATH: contains location of docker-compose.exe

## Visual Studio 2017 Enterprise

_Version:_ VisualStudio/15.7.2+27703.2018<br/>
_Location:_ C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise

The following workloads including required and recommended components are installed with Visual Studio 2017:

* Universal Windows Platform development
* .NET desktop development
* Desktop development with C++
* ASP.NET and web development
* Azure development
* Node.js development
* Data storage and processing
* Data science and analytical applications
* Game development with Unity
* Linux development with C++
* Game development with C++
* Mobile development with C++
* Office/SharePoint development
* Mobile development with .NET
* .NET Core cross-platform development
* Visual Studio extension development
* Python development *
* Mobile development with JavaScript

In addition the following optional components are installed:


## Git

_Version:_ 2.17.0<br/>
_Environment:_
* PATH: contains location of git.exe

## Git LFS

_Version:_ 2.4.0<br/>
_Environment:_
* PATH: contains location of git-lfs.exe
* GIT_LFS_PATH: location of git-lfs.exe

## Subversion

_Version:_ 1.8.17<br/>
_Environment:_
* PATH: contains location of svn.exe
