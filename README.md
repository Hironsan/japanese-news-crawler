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

```shell
$ sudo apt-get install docker.io
$ sudo usermod -aG docker $USER
$ wget https://raw.githubusercontent.com/Hironsan/japanese-news-crawler/master/dockerfile
$ docker build .
$ docker images
$ docker run -it IMAGE_ID /bin/bash
```

## Usage
