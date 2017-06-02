# -*- coding: utf-8 -*-
from scrapy.spider import CrawlSpider, Rule
from scrapy.linkextractors import LinkExtractor

from newspider.items import Page, extract_key


class NewsSpider(CrawlSpider):
    name = 'news'
    allowed_domains = ['www.nikkei.com']
    start_urls = ['http://www.nikkei.com/news/category/']
    rules = [
        Rule(LinkExtractor(allow=r'/news/category/[a-zA-Z]+/$')),
        Rule(LinkExtractor(allow=r'/article/[a-zA-Z\d_]+/$'), callback='parse_articles'),
    ]

    #def parse(self, response):
     #   for url in response.css('h4.cmn-article_title a::attr("href")').re(r'/article/[a-zA-Z\d_]+/$'):
      #      yield scrapy.Request(response.urljoin(url), self.parse_articles)

    def parse_articles(self, response):
        title = response.css('.cmnc-middle ::text').extract_first()
        body = response.css('.cmn-article_text').xpath('string()').extract_first().strip()
        publish_date = response.css('.cmnc-publish ::text').extract_first()
        category = response.css('.cmn-topic_path').xpath('string()').extract_first().strip()
        yield Page(
            url=response.url,
            key=extract_key(response.url),
            html=response.text,
            title=title,
            body=body,
            date=publish_date,
            category=category
        )
        """
        yield Page(
            url=response.url,
            key=extract_key(response.url),
            html=response.text
        )
        """
