# -*- coding: utf-8 -*-
import re
import scrapy


def extract_key(url):
    """extract key from URL
    """
    m = re.search(r'/([a-zA-Z\d_]+)/$', url)
    return m.group(1)


class Page(scrapy.Item):
    """
    Web page
    """

    url = scrapy.Field()
    key = scrapy.Field()
    html = scrapy.Field()
    title = scrapy.Field()
    body = scrapy.Field()
    date = scrapy.Field()
    category = scrapy.Field()

    def __repr__(self):
        p = Page(self)
        if len(p['html']) > 100:
            p['html'] = p['html'][:100] + '...'

        return super(Page, p).__repr__()