FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade

# Install Git
RUN apt-get -y install git

# Install MongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
RUN echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.4.list
RUN apt-get update
RUN apt-get install -y mongodb-org
RUN mkdir -p /data/db

# Start MongoDB
RUN mongod --fork --logpath /data/db/mongod.log

# Setup japanese-news-crawler
RUN apt-get install -y python3-dev
RUN apt-get install -y python-pip
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev
RUN git clone https://github.com/Hironsan/japanese-news-crawler.git
WORKDIR japanese-news-crawler
RUN chmod +x run_crawler.sh
RUN pip install -r requirements.txt

# write cron setup to /etc/crontab
RUN apt-get install -y cron
RUN echo "24 * * * * ubuntu /home/ubuntu/japanese-news-crawler/run_crawler.sh > /tmp/crawler.log 2>&1" >> /etc/crontab
CMD ["cron", "-f"]