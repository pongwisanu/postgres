DO
$do$
BEGIN
   IF EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = 'dbadmin') THEN
   ELSE
      CREATE ROLE dbadmin LOGIN PASSWORD 'dbadmin';
   END IF;
END
$do$;

SELECT 'CREATE DATABASE testdb'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'testdb')\gexec

ALTER DATABASE testdb OWNER TO dbadmin;
GRANT ALL PRIVILEGES ON DATABASE testdb TO dbadmin;


