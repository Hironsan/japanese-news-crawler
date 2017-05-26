# -*- coding: utf-8 -*-
import scrapy
from newspider.items import Page, extract_key


class NewsSpider(scrapy.Spider):
    name = 'news'
    allowed_domains = ['www.nikkei.com']
    start_urls = ['http://www.nikkei.com/news/category/']

    def parse(self, response):
        for url in response.css('h4.cmn-article_title a::attr("href")').re(r'/article/[a-zA-Z\d_]+/$'):
            yield scrapy.Request(response.urljoin(url), self.parse_articles)

    def parse_articles(self, response):
        yield Page(
            url=response.url,
            key=extract_key(response.url),
            html=response.text
        )
