# R and RStudio

## Directories

```console
/usr/local/Cellar/r/4.0.2_1/bin
```

## Validate the R shell

Using R display a bar graph showing the bell curve of a random normal distribution.

To start the shell enter the command `R`

```console
R
```

Run the following command via the R Shell

```console
n <- floor(rnorm(10000, 500, 100))
t <- table(n)
barplot(t)
```

Output

```console
r master ❯ R

R version 4.0.2 (2020-06-22) -- "Taking Off Again"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin19.5.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> n <- floor(rnorm(10000, 500, 100))
> t <- table(n)
> barplot(t)
```

## Validate RStudio

Using launchpad run RStudio

## Install RPostgresql

Run the following command via the R Shell

```console
install.packages("RPostgreSQL")
```

Output

```console
> install.packages("RPostgreSQL")
Installing package into ‘/usr/local/lib/R/4.0/site-library’
(as ‘lib’ is unspecified)
also installing the dependency ‘DBI’

trying URL 'https://cran.rstudio.com/src/contrib/DBI_1.1.0.tar.gz'
Content type 'application/x-gzip' length 633079 bytes (618 KB)
==================================================
downloaded 618 KB

trying URL 'https://cran.rstudio.com/src/contrib/RPostgreSQL_0.6-2.tar.gz'
Content type 'application/x-gzip' length 579968 bytes (566 KB)
==================================================
downloaded 566 KB

* installing *source* package ‘DBI’ ...
** package ‘DBI’ successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (DBI)
* installing *source* package ‘RPostgreSQL’ ...
** package ‘RPostgreSQL’ successfully unpacked and MD5 sums checked
** using staged installation
checking for gcc... gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking build system type... x86_64-apple-darwin19.5.0
checking host system type... x86_64-apple-darwin19.5.0
checking target system type... x86_64-apple-darwin19.5.0
checking for pg_config... /usr/local/bin/pg_config
checking for "/usr/local/include/libpq-fe.h"... yes
configure: creating ./config.status
config.status: creating src/Makevars
** libs
clang -I"/usr/local/Cellar/r/4.0.2_1/lib/R/include" -DNDEBUG -I/usr/local/include  -I/usr/local/opt/gettext/include -I/usr/local/opt/readline/include -I/usr/local/include   -fPIC  -g -O2  -c RS-DBI.c -o RS-DBI.o
clang -I"/usr/local/Cellar/r/4.0.2_1/lib/R/include" -DNDEBUG -I/usr/local/include  -I/usr/local/opt/gettext/include -I/usr/local/opt/readline/include -I/usr/local/include   -fPIC  -g -O2  -c RS-PQescape.c -o RS-PQescape.o
clang -I"/usr/local/Cellar/r/4.0.2_1/lib/R/include" -DNDEBUG -I/usr/local/include  -I/usr/local/opt/gettext/include -I/usr/local/opt/readline/include -I/usr/local/include   -fPIC  -g -O2  -c RS-PostgreSQL.c -o RS-PostgreSQL.o
clang -I"/usr/local/Cellar/r/4.0.2_1/lib/R/include" -DNDEBUG -I/usr/local/include  -I/usr/local/opt/gettext/include -I/usr/local/opt/readline/include -I/usr/local/include   -fPIC  -g -O2  -c RS-pgsql-copy.c -o RS-pgsql-copy.o
clang -I"/usr/local/Cellar/r/4.0.2_1/lib/R/include" -DNDEBUG -I/usr/local/include  -I/usr/local/opt/gettext/include -I/usr/local/opt/readline/include -I/usr/local/include   -fPIC  -g -O2  -c RS-pgsql-getResult.c -o RS-pgsql-getResult.o
clang -I"/usr/local/Cellar/r/4.0.2_1/lib/R/include" -DNDEBUG -I/usr/local/include  -I/usr/local/opt/gettext/include -I/usr/local/opt/readline/include -I/usr/local/include   -fPIC  -g -O2  -c RS-pgsql-pqexec.c -o RS-pgsql-pqexec.o
clang -I"/usr/local/Cellar/r/4.0.2_1/lib/R/include" -DNDEBUG -I/usr/local/include  -I/usr/local/opt/gettext/include -I/usr/local/opt/readline/include -I/usr/local/include   -fPIC  -g -O2  -c RS-pgsql-pqexecparams.c -o RS-pgsql-pqexecparams.o
clang -dynamiclib -Wl,-headerpad_max_install_names -undefined dynamic_lookup -single_module -multiply_defined suppress -L/usr/local/Cellar/r/4.0.2_1/lib/R/lib -L/usr/local/opt/gettext/lib -L/usr/local/opt/readline/lib -L/usr/local/lib -o RPostgreSQL.so RS-DBI.o RS-PQescape.o RS-PostgreSQL.o RS-pgsql-copy.o RS-pgsql-getResult.o RS-pgsql-pqexec.o RS-pgsql-pqexecparams.o -L/usr/local/lib -lpq -L/usr/local/Cellar/r/4.0.2_1/lib/R/lib -lR -lintl -Wl,-framework -Wl,CoreFoundation
installing to /usr/local/lib/R/4.0/site-library/00LOCK-RPostgreSQL/00new/RPostgreSQL/libs
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
** building package indices
** testing if installed package can be loaded from temporary location
** checking absolute paths in shared objects and dynamic libraries
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (RPostgreSQL)

The downloaded source packages are in
	‘/private/var/folders/4t/221sfmt10clfcb24zqv1lcpw0000gn/T/RtmpA1GosN/downloaded_packages’
```

## Validate RPostgresql via R Shell(Assumes you have sqlda datbase from SQL for Data Analytics book)

Run the following command via the R Shell

```console
library(RPostgreSQL)
con <- dbConnect(PostgreSQL(), host="localhost", user="$USER", password="$USER_PWD", dbname="sqlda", port=5432)
result <- dbGetQuery(con, "select * from customers limit 10;")
result
```

Output

```console
> library(RPostgreSQL)
Loading required package: DBI
> con <- dbConnect(PostgreSQL(), host="localhost", user="$USER", password="$USER_PWD", dbname="sqlda", port=5432)
> result <- dbGetQuery(con, "select * from customers limit 10;")
> result
   customer_id title   first_name   last_name suffix                     email gender      ip_address        phone
1            1  <NA>       Arlena     Riveles   <NA> ariveles0@stumbleupon.com      F   98.36.172.246         <NA>
2            2    Dr          Ode      Stovin   <NA>          ostovin1@npr.org      M    16.97.59.186 314-534-4361
3            3  <NA>       Braden      Jordan   <NA>    bjordan2@geocities.com      M   192.86.248.59         <NA>
4            4  <NA>      Jessika      Nussen   <NA>        jnussen3@salon.com      F 159.165.138.166 615-824-2506
5            5  <NA>       Lonnie     Rembaud   <NA>   lrembaud4@discovery.com      F    18.131.58.65 786-499-3431
6            6  <NA>       Cortie    Locksley   <NA>    clocksley5@weather.com      M   140.194.59.82         <NA>
7            7  <NA>         Wood     Kennham   <NA>        wkennham6@sohu.com      M 191.190.135.172 407-552-6486
8            8  <NA>       Rutger Humblestone   <NA>    rhumblestone7@digg.com      M   77.10.235.191 203-551-6530
9            9  <NA>     Melantha        Tibb   <NA>            mtibb8@bbb.org      F  155.176.37.197 913-590-8429
10          10    Ms Barbara-anne     Gowlett     Jr         bgowlett9@who.int      F   67.110.62.119 915-714-5735
          street_address            city state postal_code latitude longitude date_added
1                   <NA>            <NA>  <NA>        <NA>       NA        NA 2017-04-23
2    2573 Fordem Parkway     Saint Louis    MO       63116  38.5814  -90.2625 2014-10-02
3      5651 Kennedy Park       Pensacola    FL       32590  30.6143  -87.2758 2018-10-27
4     224 Village Circle       Nashville    TN       37215  36.0986  -86.8219 2017-09-03
5       38 Lindbergh Way           Miami    FL       33124  25.5584  -80.4582 2014-03-06
6  6537 Delladonna Drive           Miami    FL       33158  25.6364  -80.3187 2013-03-31
7       001 Onsgard Park         Orlando    FL       32891  28.5663  -81.2608 2011-08-25
8     21376 Esker Center       New Haven    CT       06510  41.3087  -72.9271 2013-12-15
9       05915 Havey Hill Shawnee Mission    KS       66225  38.8999  -94.8320 2016-02-11
10           9 Kim Point         El Paso    TX       79940  31.6948 -106.3000 2012-06-28
>
```
