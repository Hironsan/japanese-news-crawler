FROM ubuntu:16.04

RUN apt-get update && apt-get -y upgrade

# Install Git
RUN apt-get -y install git

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
RUN echo "24 * * * * root /japanese-news-crawler/run_crawler.sh > /var/log/crawler.log 2>&1" >> /etc/crontab
CMD ["cron", "-f"]