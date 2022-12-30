#!/usr/bin/bash
apt update
if [ $? -ne 0 ]; then
    echo "did not run apt update correctly"
    exit 1
fi

yes | apt upgrade
if [ $? -ne 0 ]; then
    echo "did not run apt upgrade correctly"
    exit 2
fi

yes | apt install python3
if [ $? -ne 0 ]; then
    echo "did not run apt install python3 correctly"
    exit 3
fi
yes | apt install python3-pip
if [ $? -ne 0 ]; then
    echo "did not run apt install pip3 correctly"
    exit 4
fi
yes | pip3 install Flask
if [ $? -ne 0 ]; then
    echo "did not run pip3 install Flask correctly"
    exit 5
fi
yes | pip3 install Flask_Login
if [ $? -ne 0 ]; then
    echo "did not run pip3 install Flask_Login correctly"
    exit 6
fi
yes | pip3 install SQLAlchemy
if [ $? -ne 0 ]; then
    echo "did not run pip3 install sqlalchemy correctly"
    exit 7
fi
yes | pip3 install Flask_SQLAlchemy
if [ $? -ne 0 ]; then
    echo "did not run pip3 install Flask_sqlalchemy correctly"
    exit 8
fi

if [ ! -d "/database" ]; then 
    mkdir /database
    if [ $? -ne 0 ]; then
        echo "did not run mkdir /database correctly"
        exit 9
    fi
fi

if [ ! -d "/website" ]; then
    mkdir /website
    if [ $? -ne 0 ]; then
        echo "did not run mkdir /website correctly"
        exit 10
    fi
fi

if [ ! -d "/var/log/website" ]; then 
    mkdir /var/log/website
    if [ $? -ne 0 ]; then
        echo "did not mkdir /var/log/website correctly"
        exit 11
    fi
fi

wget https://github.com/bigbrainbrian7/Flask-Web-App-Tutorial/archive/refs/tags/v0.1.1.tar.gz
if [ $? -ne 0]; then
    echo "did not run wget web-app link correctly"
    exit 12
fi
gunzip v0.1.tar.gz
if [ $? -ne 0]; then
    echo "did not run gunzip correctly"
    exit 13
fi
tar -xvf v0.1.tar -C /website
if [ $? -ne 0]; then
    echo "did not run untar correctly"
    exit 14
fi

export DATABASE_PATH=/database
if [ $? -ne 0 ]; then
    echo "did not run export DATABASE_PATH=/database correctly"
    exit 15
fi

if [ ! -f "/var/log/website/console.log.txt" ]; then 
    touch /var/log/website/console.log.txt
    if [ $? -ne 0 ]; then
        echo "did not run touch /var/log/website/console.log.txt correctly"
        exit 16
    fi
fi

nohup python3 /website/Flask-Web-App-Tutorial-0.1/main.py >/var/log/website/console.log.txt
if [ $? -ne 0 ]; then
    echo "did not run nohup correctly"
    exit 17
fi



