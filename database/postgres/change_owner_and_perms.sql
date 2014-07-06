-- Change the database ownership
alter database dbname owner to dbuser;

-- and do the same for all tables
psql -tc "select 'alter table ' || tablename || ' owner to dbuser;' from pg_tables where schemaname not in ('pg_catalog', 'information_schema');" dbname | psql -a dbname