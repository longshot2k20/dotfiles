# MySQL tips

# login to mysql as root

```console
mysql -u root -p
```

### Lower security settings

```console
mysql> SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+--------+
| Variable_name                        | Value  |
+--------------------------------------+--------+
| validate_password.check_user_name    | ON     |
| validate_password.dictionary_file    |        |
| validate_password.length             | 8      |
| validate_password.mixed_case_count   | 1      |
| validate_password.number_count       | 1      |
| validate_password.policy             | MEDIUM |
| validate_password.special_char_count | 1      |
+--------------------------------------+--------+
7 rows in set (0.00 sec)

mysql> SET GLOBAL validate_password.length = 6;
Query OK, 0 rows affected (0.00 sec)

mysql> SET GLOBAL validate_password.number_count = 0;
Query OK, 0 rows affected (0.00 sec)

mysql>  SET GLOBAL validate_password.mixed_case_count = 0;
Query OK, 0 rows affected (0.00 sec)

mysql>  SET GLOBAL validate_password.special_char_count = 0;
Query OK, 0 rows affected (0.00 sec)

mysql>  SHOW VARIABLES LIKE 'validate_password%';
+--------------------------------------+--------+
| Variable_name                        | Value  |
+--------------------------------------+--------+
| validate_password.check_user_name    | ON     |
| validate_password.dictionary_file    |        |
| validate_password.length             | 6      |
| validate_password.mixed_case_count   | 0      |
| validate_password.number_count       | 0      |
| validate_password.policy             | MEDIUM |
| validate_password.special_char_count | 0      |
+--------------------------------------+--------+
7 rows in set (0.00 sec)
```

### Create user with access to database

```console
create user emp_user@localhost identified by 'password';
grant all privileges on employee_db.* to 'emp_user'@'localhost';
flush privileges;
```

### MySQL old client connection in node error

```console
Request connection/GetChildrenForTreeItemRequest failed with message: ER_NOT_SUPPORTED_AUTH_MODE: Client does not support authentication protocol requested by server; consider upgrading MySQL client
```

fix

```console
ALTER USER 'emp_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password'
```
