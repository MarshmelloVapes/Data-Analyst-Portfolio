from bs4 import BeautifulSoup as bs
import requests
import csv
import datetime
import time

# Used throughout the program.
today = datetime.date.today()
timeNow = datetime.datetime.now().time()
timeNow = timeNow.strftime("%H:%M")

# This code block connects to an API to request the data for EUR/USD.
# This can be refreshed every hour to keep a detailed log of the data.
# API broken. Had to switch over to this
def newData():

    priceURL = 'https://finance.yahoo.com/quote/EURUSD=X/'
    headers = {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36", "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT":"1","Connection":"close", "Upgrade-Insecure-Requests":"1"}
    
    getPriceData = requests.get(priceURL, headers=headers)
    ps2 = bs(getPriceData.content, "html.parser")
    ps2 = bs(ps2.prettify(), "html.parser")

    pairCurrnetPrice = ps2.find(class_="Fw(b) Fz(36px) Mb(-4px) D(ib)").get_text()
    pairCurrnetPrice = pairCurrnetPrice.strip()
    pairTitle = 'EUR/USD'

    data = [ pairTitle, pairCurrnetPrice, today, timeNow ]
    with open ('ForexData.csv', 'a+', newline='', encoding='UTF8') as f:
        writer = csv.writer(f)
        writer.writerow(data)

    

# This bypasses the ajax request and allows the data to be used.
# This collects the headlines along with some other imformation.
# This should only be refreshed every 12/24 hours.
def TradingViewNewsData():

    tradingViewURL = 'https://news-headlines.tradingview.com/headlines/?category=forex&client=web&country=US&lang=en&symbol=FX:EURUSD'
    headers = {"authority": "news-headlines.tradingview.com", "method": "GET", "path": "/headlines/?category=forex&client=web&country=US&lang=en&symbol=FX%3AEURUSD", "scheme": "https", "accept": "*/*", "accept-encoding": "gzip, deflate, br", "accept-language": "en-US,en;q=0.9", "origin": "https://www.tradingview.com", "referer": "https://www.tradingview.com/", "sec-ch-ua-mobile": "?0", "sec-ch-ua-platform": "macOS", "sec-fetch-dest": "empty", "sec-fetch-mode": "cors", "sec-fetch-site": "same-site", "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.64 Safari/537.36"}

    r = requests.get(tradingViewURL, headers=headers)
    data = r.json()
    
    for i in data:
        source = i['source']
        title = i['title']
        published = i['published']

        data = [ source , title, published, timeNow, today ]
        with open ('NewsData.csv', 'a+', newline='', encoding='UTF8') as f:
            writer = csv.writer(f)
            writer.writerow(data)

# Get the sentiment data on the market.
# This can be updated by the hour.
def sentimentData():

    igURL = 'https://www.dailyfx.com/eur-usd'
    r = requests.get(igURL)
    
    data = r.content
    data = bs(data, 'html.parser')

    igData = data.find(class_ = "dfx-singal").get_text()
    igData = igData.strip()
    
    data = [ igData, timeNow, today ]
    with open ('SentimentData.csv', 'a+', newline='', encoding='UTF8') as f:
       writer = csv.writer(f)
       writer.writerow(data)










# Ugly, but works.
while(True):
    newData()
    sentimentData()
    TradingViewNewsData()
    time.sleep(3600)
    newData()
    sentimentData()
    time.sleep(3600)
    newData()
    sentimentData()
    time.sleep(3600)
    newData()
    sentimentData()
    time.sleep(3600)
    newData()
    sentimentData()
    time.sleep(3600)
    newData()
    sentimentData()
    time.sleep(3600)
    newData()
    sentimentData()
    time.sleep(3600)
    newData()
    sentimentData()
    time.sleep(3600)
    newData()
    sentimentData()
    time.sleep(3600)
    newData()
    sentimentData()
    time.sleep(3600)
    newData()
    sentimentData()
    time.sleep(3600)
