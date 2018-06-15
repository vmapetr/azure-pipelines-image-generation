# VSTS Windows Container(1803) image

The following software is installed on machines in the VSTS **Windows Container(1803)** pool.

Components marked with **\*** have been upgraded since the previous version of the image.


## Chocolatey

_Version:_ 0.10.11<br/>
_Environment:_
* PATH: contains location for choco.exe

## Docker

_Version:_ 17.06.2-ee-12<br/>
_Environment:_
* PATH: contains location of docker.exe

## Docker-compose

_Version:_ 1.21.2<br/>
_Environment:_
* PATH: contains location of docker-compose.exe

## Docker images

The following container images have been cached:
* microsoft/dotnet-framework:(sha256:80101bfa6a343dd560bdce3843d0e5a8afd00a7861d2048d11bf9b3075d3aaae)
* microsoft/aspnetcore-build:(sha256:0c9b645176a83b484c4f46b17302e0b682fba57a359108f3834a8bb746825953)
* microsoft/aspnet:(sha256:507145dc88e7e91e21b5ef4fa4e1a8b1b23874c08b81981579b63eae1b3825da)
* microsoft/windowsservercore:(sha256:e0bcd704a32172cf2add51c144bb1742d6ca4a754f7856f320b03ff48b1407c3)
* microsoft/nanoserver:(sha256:ae68221b0f4b5d25ff4d42040cb6a044b5011dbbbe02902d8b5ca689a3a71193)

## Visual Studio 2017 BuildTools

_Version:_ VisualStudio/15.7.2+27703.2018<br/>
_Location:_ C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools

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

_Version:_ 2.17.1<br/>
_Environment:_
* PATH: contains location of git.exe

## Git LFS

_Version:_ 2.4.2<br/>
_Environment:_
* PATH: contains location of git-lfs.exe
* GIT_LFS_PATH: location of git-lfs.exe

## Subversion

_Version:_ 1.8.17<br/>
_Environment:_
* PATH: contains location of svn.exe
