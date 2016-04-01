#!/usr/bin/env python2

import urllib
import urllib2
#import requests
import BeautifulSoup
import cookielib
def dump():
    for cookie in cj:
        return cookie.value
# get page
url ='http://challenges.neverlanctf.com:8088'
cj = cookielib.CookieJar()
opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj), urllib2.HTTPSHandler(debuglevel=1))
#home = opener.open(url)
req = urllib2.Request(url)
res = opener.open(req)
cookie = dump()
doc = BeautifulSoup.BeautifulSoup(res)
#print doc
# pick out numbers
first_p =  doc.find(attrs={'class':'content'})
problem =  str(first_p).split('<p>')[-1].split('</p>')[0] # .next_sibling
num1 = problem.split(' ')[0]
num2 = problem.split(' ')[-1]
print num1
print num2
operator = problem.split(' ')[1]
# do math
print operator
if(operator =="+"):
    anwser =  int(num1) + int(num2)
print anwser
# send back answer
value = {'val3':anwser, 'submit': 'Send Answer'}
data = urllib.urlencode(value)
opener.addheaders.append(('Cookie', 'connect.sess='+cookie))
req = opener.open(url, data)
print cookie
#req = urllib2.Request(url, data)
# get response
# response = urllib2.urlopen('POST', req)
#print response.read()
print req.read()
#print respobse.read(req)
#print cookie
