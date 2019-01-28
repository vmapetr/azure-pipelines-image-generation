# Azure Pipelines Windows Container(1803) image

The following software is installed on machines in the Azure Pipelines **Windows Container(1803)** pool.

Components marked with **\*** have been upgraded since the previous version of the image.


## Chocolatey

_Version:_ 0.10.11<br/>
_Environment:_
* PATH: contains location for choco.exe

## Docker

_Version:_ 17.06.2-ee-18<br/>
_Environment:_
* PATH: contains location of docker.exe

## Docker-compose

_Version:_ 1.23.2<br/>
_Environment:_
* PATH: contains location of docker-compose.exe

## Docker images

The following container images have been cached:
* microsoft/aspnet:(sha256:8a8580b556a22e3cbd5f3796386f202784df8603a120db67c07555edaaaf297b)
* microsoft/dotnet-framework:(sha256:661d452fd4ee0e9add9116b4cf76be042387dce5c9187be92505766aa1570216)
* microsoft/windowsservercore:(sha256:260689daae3d9fb5bfca2881cab21e7ca07ae83849bb0511220b83ec6fe99bd5)
* mcr.microsoft.com/windows/servercore:(sha256:260689daae3d9fb5bfca2881cab21e7ca07ae83849bb0511220b83ec6fe99bd5)
* microsoft/nanoserver:(sha256:0e9755d3a3a46ebbfa8a8d91eefa7d8caa3d407dc6041c0863bb05c57e9bdda8)
* mcr.microsoft.com/windows/nanoserver:(sha256:0e9755d3a3a46ebbfa8a8d91eefa7d8caa3d407dc6041c0863bb05c57e9bdda8)
* microsoft/aspnetcore-build:(sha256:82ad5218bb554d0b44ca54c21aba78b5ae10b92cead389d71328614b99fc47af)

## Git

_Version:_ 2.20.1<br/>
_Environment:_
* PATH: contains location of git.exe

## Git LFS

_Version:_ 2.6.1<br/>
_Environment:_
* PATH: contains location of git-lfs.exe
* GIT_LFS_PATH: location of git-lfs.exe

## Subversion

_Version:_ 1.8.17<br/>
_Environment:_
* PATH: contains location of svn.exe
