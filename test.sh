# /bin/sh
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
    ARCH=x64  # or AMD64 or Intel64 or whatever
    ;;
i*86)
    ARCH=x86  # or IA32 or Intel32 or whatever
    ;;
*)
    # leave ARCH as-is
    ;;
esac

# echo mysql install
echo "MySQL Download"
if [[ $OS -eq "Ubuntu" ]]; then
#   wget http://ftp.us.debian.org/debian/pool/main/m/mysql-5.1/mysql-server_5.1.73-1_all.deb
   sudo apt-get install mysql -y
fi
echo  "MySQL deb install"
   #sudo dpkg -i mysql-server_*_all.deb
if [[ $ARCH -eq 64  ]]; then
   echo "64"
fi
echo $OS
echo $VER
echo $ARCH
