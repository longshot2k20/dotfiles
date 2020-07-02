# PrestoDB

## Directories

```console
/usr/local/Cellar/prestodb/0.235.1_1/libexec
/usr/local/Cellar/prestodb/0.235.1_1/libexec/conf
/usr/local/Cellar/prestodb/0.235.1_1/libexec/bin
$HOME/Data/appData/presto/data
```

## Validate the install

Run in the foreground

```console
presto-sever run
```

Run in the background

```console
presto-sever start
```

## Validate Hive integration(not currently working)

Currently if hive.properties is placed in the \$PRESTO_CATALOG_DIR you will get the following error.

Tried jdk8 and jdk11 this issue may be fixed in newer versions. For now don't include the hive.properties in the install until a new version is installed in homebrew.

```console
2020-07-02T16:08:59.466-0400    ERROR   main    com.facebook.presto.server.PrestoServer java.lang.NoSuchFieldException: modifiers
java.lang.AssertionError: java.lang.NoSuchFieldException: modifiers
        at org.apache.hadoop.fs.HadoopExtendedFileSystemCache.setFinalStatic(HadoopExtendedFileSystemCache.java:47)
        at org.apache.hadoop.fs.HadoopExtendedFileSystemCache.initialize(HadoopExtendedFileSystemCache.java:28)
```
