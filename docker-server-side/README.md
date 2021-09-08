# Oracle Database & APEX Developer Docker Image

## Content

This Docker Image contains the following:

* Oracle Linux 7.9
* Oracle Database 12.2 / 18.3 / 19.3 Enterprise Edition with non-CDB architecture
* Oracle APEX 20.2
* Oracle ORDS 20.3
* Apache Tomcat 8.5.60
* AdoptOpenJDK 11.0.9.1+1

### Oracle APEX

[http://localhost:8080/ords/](http://localhost:8080/ords/)

Property | Value
-------- | -----
Workspace | INTERNAL
User | ADMIN
Password | OrclAPEX1999!

*If APEX Office Print is installed (INSTALL_AOP=true)*

Property | Value
-------- | -----
Workspace | AOP
User | ADMIN
Password | OrclAPEX1999!

### SQL Developer Web

*If SQL Developer Web is enabled (INSTALL_SQLDEVWEB=true)*

[http://localhost:8080/ords/sql-developer](http://localhost:8080/ords/sql-developer)

Property | Value
-------- | -----
User | SDW_ADMIN
Password | oracle

### Database Connections

To access the database e.g. from SQL Developer you configure the following properties:

Property | Value
-------- | -----
Hostname | localhost
Port | 1521
SID | orcl
Service | orcl

The configured user with their credentials are:

User | Password
-------- | -----
system | oracle
sys | oracle
apex_listener | oracle
apex\_rest\_public\_user | oracle
apex\_public\_user | oracle
logger\_user | oracle
oosutils\_user | oracle
aop | oracle
ame | oracle
sdw\_admin | oracle

Use the following connect string to connect as SYSTEM via SQL*Plus or SQLcl: ```system/oracle@localhost/orcl```

### SSH

To access the Docker Container via SSH: ```ssh root@localhost -p 2222```

User | Password
-------- | -----
root | oracle
oracle | oracle