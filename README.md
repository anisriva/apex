# oracle-apex image and client setup

Place binaries from sharepoint location to the files directory.
(Sharepoint location can be shared by Animesh or Nikita)

## Server side deployement

Buld the image:
    `docker build -t registry.de.dev.blu.digiCert.com/oracle-apex:21.1 .`

Push the image:
    `docker push registry.de.dev.blu.digiCert.com/oracle-apex:21.1`

## Client side usage

> 1. Provide the token details in the client\src\windows\apex.ps1
> 2. Run the build command and share the zip file "client\build\windows\build.ps1"