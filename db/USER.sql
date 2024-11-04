CREATE USER C##LINKEDIN
  IDENTIFIED BY "oracle"
  DEFAULT TABLESPACE USERS
  TEMPORARY TABLESPACE TEMP;
--asignar cuota ilimitada al tablespace por defecto  
ALTER USER C##LINKEDIN QUOTA UNLIMITED ON USERS;

GRANT create session TO C##LINKEDIN;
GRANT create table TO C##LINKEDIN;
GRANT create view TO C##LINKEDIN;
GRANT create any trigger TO C##LINKEDIN;
GRANT create any procedure TO C##LINKEDIN;
GRANT create sequence TO C##LINKEDIN;
GRANT create synonym TO C##LINKEDIN;

