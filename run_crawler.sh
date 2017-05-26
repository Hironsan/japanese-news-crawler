#!/bin/bash

# move to the directory this file exists
cd $(dirname $0)

# activate virtualenv
source venv/bin/activate

# run crawler
scrapy crawl news