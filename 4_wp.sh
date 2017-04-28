#!/bin/bash

alias llsof='alias lsof -i | h -ni : - \> established close_wait LISTEN closed udp ipv4 axel google https tcp'



# php
# php -i | grep "php.ini"
#  se ttrouve dans /etc/php.ini
# /usr/lib/php/extensions/no-debug-non-zts-20121212/xdebug.so


# VAGRANT_LOG=info vagrant reload | h port default ssh 127.0.0.1 vagrant = guest adapter boot start stop restart

# VAGRANT_LOG=info
# vagrant ssh -- -vvv  | h port default ssh 127.0.0.1 vagrant = guest adapter boot start stop restart

# vagrant up
# vagrant reload --provision
# vagrant provision


#-------------------------------------------------------------------------------
#  GIT
#-------------------------------------------------------------------------------
# GIT - create dir distant
# curl -u "terragroup:a29c9d596b3a7468bfbe12f9766a38521efc053f" https://api.github.com/user/repos -d '{"name":"'test2'"}'

# ssh key
 # ssh-keygen -t rsa -b 4096 -C "axel.regnoult@gmail.com"
 # ssh-add -K ~/.ssh/id_rsa
# pbcopy < ~/.ssh/id_rsa.pub
# ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC0DZxeos/ycrkfVX6tAbrokHVBEGYwjLWJojDVoD0bspOsHmQl6wrnkJeJXm3r2hjkaM7uMnhO3PrNaOHY2FrIqNkv7x//D0gvNRowcxeM16FVS3UpT7nawXLjAU3onoRtCXZKVsJbIOLgHr/8n9ETdx1fitlnvi2HnB4vAVuPecasG4h1c+2E747/Yn/9ocXcyGNiBpSMe9QCz2qzTRSds9OUlZBbcyAZWunZzNWELcY1heuXIgEEs31vDDA0tNOoMwkQhijL4wrz/mxy8A+NNgAiiTGjZAEh3U+r5d6PDX1iLrgqxHD/brBt1lHLeJmtY4HPEl8E1qP8DOPYs4YbSwazeS5NuItGKr3OHO+61ALWPBeuLmbDCsHHLRSORCYgV56AmWaQaJLF32kA5rW18LjJPTt7E2FgFUth77XFwkCoeGawCr9BiuN9w5bICh2Eif7O2dgMtraXkRmBlW+9eE4hAgBPo49dPoyEQO0c2bEFRBLgQeC49gZWMagJXEiwyecgYmT2gZbfhmrGBSJRC2XcUHFYQphp9G/Csl/DZG6HaEBfLmjyr6oKm7WZtbqgxoiyNkoq+TVK9sR7y6PQiza+c2zieoxutqOYOQtoPjchpHqu7rnfqYTq+3Iy61C1KJE+oALi6bcAC7DGdLj4JDoRBLqoCRsq9jzB/ToODQ== axel.regnoult@terra-group.com


#-------------------------------------------------------------------------------
#  Wordpress
#-------------------------------------------------------------------------------
# sudo chown -R root:wheel /Library/LaunchDaemons/com.mysql.mysql.plist
# cvariante- chown -R mysql:mysql /usr/local/mysql/data
# sudo -u _mysql mysqld -- lancer le process en user _mysql
# sudo chmod 644 /Library/LaunchDaemons/com.mysql.mysql.plist
# sudo chown -R _mysql data/
# netstat -na | grep 3306


#-------------------------------------------------------------------------------
#  axel dir
#-------------------------------------------------------------------------------
alias dev='cd /Users/axel/Documents/dev'
# utilise par le wp-cli
# alias wp='cd /Users/axel/Documents/dev'
alias paf='echo $PATH | h   -n  olo olo olo olo olo olo ":" "usr" "sbin" "opt" "local" "games" "ack"'

alias wpp='atom /Library/WebServer/Documents/wordpress/'

# SUPPRIMER LICENCE IDEA
# rm /Users/axel/Library/Preferences/IntelliJIdea2016.2/idea162.key

#-------------------------------------------------------------------------------
#  status process (ps) et var
#-------------------------------------------------------------------------------

alias paf='echo $PATH | h   -n  olo olo olo olo olo olo ":" "usr" "sbin" "opt" "local" "games" "ack"'

# APACHE - /etc/apache2/conf/httpd.conf (DocumentRoot "/Library/WebServer/Documents")
alias psa='echo -e "\n\n" && ps aux | grep  "httpd|apache" | h  "/usr/sbin/" "FOREGROUND" "axel" "root" "_www" " --database=" " --annotation=" " --url=" "/Applications/Atom.app" "/Applications/Google" "/bin|/data|/usr/local|/lib/plugin|.local.err|.local.pid" "/usr/local/mysql/bin/mysqld" && echo -e "\n\n" '

alias as='sudo apachectl start'
alias ast='sudo apachectl stop'
alias ars='sudo apachectl restart'
 # apachectl configtest
alias www='cd /Library/WebServer/Documents'

# httpd.conf
alias apa='cd /private/etc/apache2'
# root
alias apr='cd /Library/WebServer/Documents'



# MYSQL
alias psm='echo -e "\n\n" && ps aux  | grep  "mysql" | h " --user=" " --basedir=" " --datadir=" " --plugin-dir=" " --log-error=" " --pid-file=" "00" "00" "/Applications/Atom.app"  "/usr/local" && echo -e "\n\n" '

alias ms='sudo /usr/local/mysql/support-files/mysql.server start'
alias mst='sudo /usr/local/mysql/support-files/mysql.server stop'
alias mrs='sudo /usr/local/mysql/support-files/mysql.server restart'



# PHP MYADMIN
# phpmyadmin
alias pha='cd /Library/WebServer/Documents/phpMyAdmin'


#ps -ef | grep tomcat | grep -v grep | awk '{print $4}' | xargs kill -9


# list all users
# dscl . list /Users


#PHP
 # /etc/php.ini
# php --ini
# sudo cp /etc/php.ini.default /etc/php.ini

#-------------------------------------------------------------------------------
#  now
#-------------------------------------------------------------------------------

# TUTO PHP ADMIN
# https://coolestguidesontheplanet.com/installing-phpmyadmin-on-mac-osx-10-7-lion/
#
# root@localhost: =e=D/4t1uhAh
#   gelanSo
#
#
# :/Users/axel/Documents/soft-WP/mysql-5.7.17-macos10.12-x86_64/bin
#
# cd /Library/LaunchDaemons && sudo launchctl load -F com.oracle.oss.mysql.mysqld.plist
#
#
# To tell MySQL daemon (service) to start and stop MySQL server use the following commands:

#
# mysqladmin -u root -p password
#
#
# Set/Change password:
#
# mysqladmin -u root -p password
# Login to MySQL console:
#
# mysql -u root -p
# To exit the console:
#
# .\q



#
# WP
#
# directory plugin : /wp-content/plugins
#
#
# ./gcloud components list | h -n  "Installed" "Not Installed"
#
# gcloud components install [COMPONENT]
#
#
# gcloud components install app-engine-php
