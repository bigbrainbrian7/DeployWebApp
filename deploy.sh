#!/usr/bin/bash
apt update
if [ $? -ne 0]; then
    echo "did not run apt update correctly"
fi

apt upgrade
if [ $? -ne 0]; then
    echo "did not run apt upgrade correctly"
fi

apt install python3
if [ $? -ne 0]; then
    echo "did not run apt install python3 correctly"
fi
apt install pip3
if [ $? -ne 0]; then
    echo "did not run apt install pip3 correctly"
fi
pip3 install Flask
if [ $? -ne 0]; then
    echo "did not run pip3 install Flask correctly"
fi
pip3 install Flask_Login
if [ $? -ne 0]; then
    echo "did not run pip3 install Flask_Login correctly"
fi
pip3 install SQLAlchemy
if [ $? -ne 0]; then
    echo "did not run pip3 install sqlalchemy correctly"
fi
pip3 install Flask_SQLAlchemy
if [ $? -ne 0]; then
    echo "did not run pip3 install Flask_sqlalchemy correctly"
fi

mkdir /database
if [ $? -ne 0]; then
    echo "did not run mkdir /database correctly"
fi
mkdir /website
if [ $? -ne 0]; then
    echo "did not run mkdir /website correctly"
fi
mkdir /var/log/website
if [ $? -ne 0]; then
    echo "did not mkdir /var/log/website correctly"
fi

wget https://github.com/bigbrainbrian7/Flask-Web-App-Tutorial/archive/refs/tags/v0.1.tar.gz
if [ $? -ne 0]; then
    echo "did not run wget web-app link correctly"
fi
gunzip v0.1.tar.gz
if [ $? -ne 0]; then
    echo "did not run gunzip correctly"
fi
tar -xvf v0.1.tar -C /website
if [ $? -ne 0]; then
    echo "did not run untar correctly"
fi

export DATABASE_PATH=/database
if [ $? -ne 0]; then
    echo "did not run export DATABASE_PATH=/database correctly"
fi

touch /var/log/website/console.log.txt
if [ $? -ne 0]; then
    echo "did not run touch /var/log/website/console.log.txt correctly"
fi

nohup 1>/var/log/website/console.log.txt 2>/var/log/website/console.log.txt &
if [ $? -ne 0]; then
    echo "did not run nohup correctly"
fi



