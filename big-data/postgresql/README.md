# Postgresql

## Directories

```console
/usr/local/Cellar/postgresql/12.3_4/
/usr/local/Cellar/postgresql/12.3_4/bin
/usr/local/var/postgres # default data dir
```

## Validate the install

By default, it automatically creates a user that matches your os user. Let’s start by using the psql utility, which is a utility installed with Postgres that lets you carry out administrative functions without needing to know their actual SQL commands.

```console
psql postgres
```

Let's see what user's are installed

```console
postgres-# \du
                                   List of roles
 Role name |                         Attributes
-----------+------------------------------------------------
 user   | Superuser, Create role, Create DB, Replication,
```

lists all the databases in Postgres

```console
\list:
```

connect to a specific database

```console
\connect:
```

list the tables in the currently connected database

```console
\dt:
```

Basics on sqlda database

```console
~ ❯ psql sqlda
psql (12.3)
Type "help" for help.

sqlda=# \dt
                    List of relations
 Schema |             Name             | Type  |  Owner
--------+------------------------------+-------+---------
 public | closest_dealerships          | table | $USER
 public | countries                    | table | $USER
 public | customer_sales               | table | $USER
 public | customer_survey              | table | $USER
 public | customers                    | table | $USER
 public | dealerships                  | table | $USER
 public | emails                       | table | $USER
 public | products                     | table | $USER
 public | public_transportation_by_zip | table | $USER
 public | sales                        | table | $USER
 public | salespeople                  | table | $USER
 public | top_cities_data              | table | $USER
(12 rows)

sqlda=# \dt countries
          List of relations
 Schema |   Name    | Type  |  Owner
--------+-----------+-------+---------
 public | countries | table | $USER
(1 row)
```

## Loading a dump file as superuser into database sqlda

```console
createdb -h localhost -p 5432 -U $USER sqlda
psql -U $USER -d sqlda -f ~/Developer/src/github.com/*/SQL-for-Data-Analytics/Datasets/data.dump
```

Expect following errors install should default to \$USER as owner

```console
psql:/SQL-for-Data-Analytics/Datasets/data.dump:616656: ERROR:  role "rdsadmin" does not exist
REVOKE
psql:/SQL-for-Data-Analytics/Datasets/data.dump:616658: ERROR:  role "sqldaadmin" does not exist
```

## Connecting to PgAdmin as superuser (os username)

```console
Connection
name: $USER@localhost
Host: localhost
Port: 5432
Maintenance database: postgres
Username: $USER
```

## Issues with PgAdmin4

PgAdmin4 is a webapp and really flakey. There is an elephant icon in the upper right used to control the server.

To fix issues typically find the process

```console
ps -ef | grep -i pgadmin4
```

kill it and relaunch from launcher

### Reinstalling pgadmin (not typically necessary)

```console
brew cask uninstall pgadmin4
rm -r ~/.pgadmin/
brew cask install pgadmin4
```

## Appendix not applied but tested creating new user ultimately just installed under \$USER

### Create a new user

```console
CREATE ROLE packt WITH LOGIN PASSWORD 'password';
```

```console
postgres=# ALTER ROLE packt CREATEDB;
ALTER ROLE
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 user      | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 packt     | Create DB
```

logout and log in as packt user

```console
postgres=# \q
dotfiles master* ❯ psql postgres -U packt
psql (12.3)
Type "help" for help.

postgres=> CREATE DATABASE packt;
CREATE DATABASE
postgres=> GRANT ALL PRIVILEGES ON DATABASE packt TO packt;
GRANT
postgres=> \list
                           List of databases
   Name    |  Owner  | Encoding | Collate | Ctype |  Access privileges
-----------+---------+----------+---------+-------+---------------------
 packt     | packt   | UTF8     | C       | C     | =Tc/packt          +
           |         |          |         |       | packt=CTc/packt
 postgres  | user    | UTF8     | C       | C     |
 template0 | user    | UTF8     | C       | C     | =c/user         +
           |         |          |         |       | user=CTc/user
 template1 | user    | UTF8     | C       | C     | =c/user         +
           |         |          |         |       | user=CTc/user
(4 rows)
```

Create roles for packt dump

```console
postgres=# CREATE ROLE sqldaadmin WITH LOGIN PASSWORD '';
NOTICE:  empty string is not a valid password, clearing password
CREATE ROLE
postgres=# CREATE ROLE rdsadmin WITH LOGIN PASSWORD '';
NOTICE:  empty string is not a valid password, clearing password
CREATE ROLE
postgres=# \du
                                    List of roles
 Role name  |                         Attributes                         | Member of
------------+------------------------------------------------------------+-----------
 user       | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 packt      | Create DB                                                  | {}
 rdsadmin   |                                                            | {}
 sqldaadmin |
```

### WIP Loading files locally

postgres=# GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO packt;
GRANT
postgres=# GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO packt;
GRANT

### Connecting as pack

```console
Connection
Host: localhost
Port: 5432
Maintenance database: packt
Username: packt
```
