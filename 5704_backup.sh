#!/bin/bash

sql_filename=mysqldump_db5704_$(date +'%Y_%m_%d').sql
zip_filename=5704_backup_$(date +'%Y_%m_%d').zip

mysqldump -u f5704 -p -r $sql_filename --databases 5704
zip $zip_filename $sql_filename data -r
rm $sql_filename

