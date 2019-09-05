FROM mcr.microsoft.com/windows/servercore:1709



# add vc_redist.x64.exe for VS2015 and install it quietly

ADD https://download.microsoft.com/download/9/3/F/93FCF1E7-E6A4-478B-96E7-D4B285925B00/vc_redist.x64.exe /vc_redist.x64.exe

RUN C:\vc_redist.x64.exe /quiet /install