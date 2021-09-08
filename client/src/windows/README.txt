#################################
# Date Created : 08/08/21       #
# Author : Animesh Srivastava   #
#################################
Contents: 

   apex-loader/
   ├── apex-loader.exe
   └── resources/
       ├── rancher.exe
       └── setting.ini

Minimum Requirements:
    OS : Windows
    Files : resources/rancher.exe

Usage : 
    1. Just double click on apex-loader.exe and the apex URL will be opened in the default browser. 
    2. <Optional> Use settings.ini file to provide custom ports for :
        a) rancher_exe=.\resources\rancher.exe
        b) apex_port=8080
        c) db_port=1521
        d) ssh_port=222
    NOTE : If setting.ini file is not provided then the application assumes 8080, 1521 and 222 as default ports.