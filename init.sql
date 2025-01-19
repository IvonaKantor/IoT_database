--ALTER SESSION SET CONTAINER = CDB$ROOT;
-- 1. Creating a new Pluggable Database (PDB)
CREATE PLUGGABLE DATABASE IOT
    ADMIN USER iwona IDENTIFIED BY iwona
    FILE_NAME_CONVERT = ('/opt/oracle/oradata/XE/', '/opt/oracle/oradata/XE/IOT/');

-- 2. Opening the IOT database
ALTER PLUGGABLE DATABASE IOT OPEN;

-- 3. Switching to PDB IOT
--ALTER SESSION SET CONTAINER = IOT;

-- 4. Create a new user
CREATE USER iwona2 IDENTIFIED BY iwona2;

-- 5. Assign privileges to a user
GRANT CONNECT, RESOURCE TO iwona2;
GRANT UNLIMITED TABLESPACE TO iwona2;
GRANT ALL PRIVILEGES TO IWONA;
GRANT ALL PRIVILEGES TO IWONA2;
-- 6. (Optional) Assign a DBA role for full access
-- GRANT DBA TO iot_user;

-- 7. Check the status of a new database
SELECT name, open_mode FROM v$pdbs WHERE name = 'IOT';

SELECT name, pdb FROM v$services;

