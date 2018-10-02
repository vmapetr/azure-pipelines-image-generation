#-----------------------------------------------------------------------
# In VSTS:
# - build product
# - build container
# - deploy container
#-----------------------------------------------------------------------
# docker build -t bryanmacfarlane/poc-debian-dev:1806 .
# docker run -it bryanmacfarlane/poc-debian-dev bash

FROM microsoft/windowsservercore:1803

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
