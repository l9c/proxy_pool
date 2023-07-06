# -*- coding: utf-8 -*-
"""
-------------------------------------------------
   File Name：     ProxyHelper
   Description :
   Author :        JHao
   date：          2019/8/8
-------------------------------------------------
   Change Activity:
                   2019/8/8:
-------------------------------------------------
"""
__author__ = 'JHao'

from Util import validUsefulProxy

from datetime import datetime


def checkProxyUseful(proxy_obj):
    """
    检测代理是否可用
    :param proxy_obj: Proxy object
    :return: Proxy object, status
    """
    result, response_ms, country = validUsefulProxy(proxy_obj.proxy)
    if result:
        # Proxy check passed, update proxy_obj properties
        proxy_obj.last_status = 1
        proxy_obj.response_ms = response_ms
        proxy_obj.country = country
        proxy_obj.ignore = False
    else:
        proxy_obj.last_status = 0
        proxy_obj.fail_count += 1
        if proxy_obj.check_count > 10 and proxy_obj.fail_count / proxy_obj.check_count > 0.5:
            proxy_obj.ignore = True


    proxy_obj.check_count += 1
    proxy_obj.last_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    is_valid = (proxy_obj.last_status == 1)
    return proxy_obj, is_valid
