#!/bin/bash

# quel OS ? et quelle distrib
uname -a // host + username

# distrib
lsb_release -a

# la calculette
bc

# change username directory (il faut etre connecte sous un autre user) : usermod --move-home --login axel --home /home/axel ax
usermod --move-home --login <new-login-name> --home <new-home-dir> <old-login-name>

# add user
useradd -m tom
passwd tom
