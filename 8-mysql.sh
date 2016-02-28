#!/bin/bash


# SQL       : connexion   >    mysql -uroot -p151185'
# OR     mysql -D medicisdb -uadmin -padm1n

# ------------------------------------------------------------------------------------------------------------------

# SQL      : conf                  : /etc/mysql
# ------------------------------------------------------------------------------------------------------------------

# SQL : SEARCH : savoir la table qui contient une colonne donnee
# ------------------------------------------------------------------------------------------------------------------
# SELECT DISTINCT COLUMN_NAME, DATA_TYPE, TABLE_NAME
# FROM INFORMATION_SCHEMA.COLUMNS
# WHERE COLUMN_NAME IN ('SDD_STATUTDETAILDEPENSES_ID')
# AND TABLE_SCHEMA='medicisdb';


#
# -- CHARLES : savoir comment a ete creer la table
# show create table coutaumille_cam;
#
# -- param de l autocompletion
# no-auto-rehash	# faster start of mysql but no tab completition
# auto-rehash
#
# -- stack
# drop user admin@localhost;
# drop user admin@'%';
# flush privileges;
# SELECT User, Host, Password FROM mysql.user;
# SHOW GRANTS FOR 'admin'@'localhost';
# SHOW GRANTS FOR 'admin'@'%';
# -- create user admin;
# -- update user set password=PASSWORD("adm1n") where User='admin';
# create user admin@localhost identified by 'adm1n';
# create user admin@'%' identified by 'adm1n';
# -- GRANT ALL PRIVILEGES ON medicisdb.* TO 'admin'@'%';
# GRANT ALL ON *.* TO 'admin'@'%';
# GRANT ALL ON *.* TO 'admin'@'localhost';
# flush privileges;
#
# DESCRIBE <table>;
# -- This is acutally a shortcut for:
# SHOW COLUMNS FROM <table>;
#
# -- DATE
# select CURRENT_DATE; 		-- 2015-09-11
# SELECT YEAR(CURDATE());
#
#
