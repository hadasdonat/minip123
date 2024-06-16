drop user hadas12345chaya;

CREATE USER hadas IDENTIFIED BY 12345;
GRANT CONNECT, RESOURCE, DBA TO hadas;
GRANT CREATE SESSION to hadas;
 
GRANT UNLIMITED TABLESPACE TO hadas;
grant create view, create procedure, create sequence to hadas;
