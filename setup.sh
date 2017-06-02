#!/bin/bash
sudo apt-get update && apt-get -y upgrade

# Install mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
# for 16.04
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo service mongod start

# Install Git
sudo apt-get -y install git

# Setup japanese-news-crawler
sudo apt-get install -y python3-dev
sudo apt-get install -y python-pip
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y virtualenv
virtualenv venv --python=python3
source venv/bin/activate
chmod +x run_crawler.sh
pip install -r requirements.txt

# write cron setup to /etc/crontab
sudo apt-get install -y cron
sudo touch /var/log/crawler.log
sudo sh -c 'echo "24 * * * * root /home/ubuntu/japanese-news-crawler/run_crawler.sh > /var/log/crawler.log 2>&1" >> /etc/crontab'
