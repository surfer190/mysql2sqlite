# mysql2sqlite

### Usage

1. Clone the repo

  `git clone git@github.com:surfer190/mysql2sqlite.git`

2. Change db values

  `vim convert.sh`

3. Change to your credentials

  ```
  DB_NAME="db_name"
  DB_USER="db_user"
  DB_PASS="db_pass"
  ```

4. Run the script

    `bash convert.sh`

5. File `output.sqlite` will be created in the same directory

### Other tools

* [Convert Microsoft SQL database (MSSQL) to MySQL](https://github.com/matriphe/mssql2mysql)


### License

[GPL](http://www.gnu.org/licenses/gpl-3.0.en.html)

A direct port of the [shell script for MySQL to SQLite db conversion on mySQL forums](http://forums.mysql.com/read.php?145,68269,92627)
