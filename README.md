# Japanese News Crawler
This is a japanese news crawler built on the top of Scrapy framework.
<div align="center">
  <img src="https://github.com/Hironsan/japanese-news-crawler/blob/master/doc/news.jpg?raw=true">
</div>

-----------------

## Supported News Site
So far, following news sites are supported:
* [Nikkei](http://www.nikkei.com/news/category/)


## Requirements
* Python 3.x
* MongoDB
* Docker(Preferable)

## Installation
First of all, you should install Docker:

```shell
$ sudo apt-get install docker.io
$ sudo usermod -aG docker $USER
```

After Docker installation, you have to prepare Docker images:

```shell
$ wget https://raw.githubusercontent.com/Hironsan/japanese-news-crawler/master/dockerfile
$ docker build -t newscrawler .
$ docker pull mongo
```

Finaly, you have to create Docker container:

```shell
$ mkdir ~/data
$ docker run -d -p 27017:27017 --name dbserver -v ~/data:/data/db mongo
$ docker run -it --name crawler --link dbserver:mng newscrawler
```

