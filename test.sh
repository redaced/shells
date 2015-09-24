#!/bin/bash
ARCH=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')

if [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    OS=Debian  # XXX or Ubuntu??
    VER=$(cat /etc/debian_version)
elif [ -f /etc/redhat-release ]; then
    OS=$(uname -s)
    VER=$(uname -r)
fi
case $(uname -m) in
86_64)
    ARCH=x64  # 64bit
    ;;
i*86)
    ARCH=x86  # 32bit
    ;;
*)
    # leave ARCH as-is
    ;;
esac

# echo mysql install
#echo "MySQL Download"
if [[ $OS -eq "Ubuntu" ]]; then
#  sudo apt-get install apache2
#  sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
#  sudo /usr/bin/mysql_secure_installation
#  sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
#  sudo rm /etc/apache2/mods-enabled/dir.conf
#echo $'First line.\nSecond line.\nThird line.' >foo.txt
sudo nano "<IfModule mod_dir.c> \n DirectoryIndex index.php index.html index.cgi index.pl index.php index.xhtml index.htm \n</IfModule>" >> /etc/apache2/mods-enabled/dir.conf
fi
if [[ $ARCH -eq 64  ]]; then
   echo "64"
fi
