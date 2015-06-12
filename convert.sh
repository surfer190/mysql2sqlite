#!/bin/sh 

DB_NAME="name"
DB_USER="user"
DB_PASS="pass"

mysqldump --compact --compatible=ansi --default-character-set=binary -u DB_USER -pDB_PASS DB_NAME | 
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
sqlite3 output.db
