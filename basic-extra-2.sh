0 # voir le code retour
false | true; echo $?
echo "${pipestatus[1]} ${pipestatus[2]}"


1 # quel OS ? et quelle distrib
uname -a // host + username

2 # quel est le shell UNIX ?
ps -p $$

2 # retourner tt ce qui est installe
2 #  dpkg --get-selections | grep -v deinstall - (The -v tag "inverts" grep to return non-matching lines)



3 # distrib
lsb_release -a

# la calculette
bc

# change username directory (il faut etre connecte sous un autre user) : usermod --move-home --login axel --home /home/axel ax
usermod --move-home --login <new-login-name> --home <new-home-dir> <old-login-name>

# add user
useradd -m tom
passwd tom

# INSTALLATION PKG
sudo dpkg --install





# SOURCE : NOT FOUND ?
$ls -l `which sh`
/bin/sh -> dash
$sudo dpkg-reconfigure dash #Select "no" when you're asked
[...]
$ls -l `which sh`
/bin/sh -> bash
