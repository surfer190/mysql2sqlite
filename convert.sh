#!/bin/sh

# Convert a Mysql Database dump to a sqlite database
# Script creates the dump then converts

# Change the below values
DB_NAME="db_name"
DB_USER="db_user"
DB_PASS="db_pass"

mysqldump --compact --compatible=ansi --default-character-set=binary -u $DB_USER -p$DB_PASS $DB_NAME |
grep -v ' KEY "' |
grep -v ' UNIQUE KEY "' |
perl -e 'local $/;$_=<>;s/,\n\)/\n\)/gs;print "begin;\n";print;print "commit;\n"' |
perl -pe '
if (/^(INSERT.+?)\(/) {
$a=$1;
s/\\'\''/'\'\''/g;
s/\\n/\n/g;
s/\),\(/\);\n$a\(/g;
}
' |
sqlite3 output.sqlite

#to change the output name change the above filename
