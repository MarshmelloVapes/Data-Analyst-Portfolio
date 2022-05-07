# Import Libaries
from bs4 import BeautifulSoup as bs
import requests
import time
import datetime
import csv

def checkPrice():
    # URL's used:
    mainURL = 'https://www.dailyfx.com/eur-usd'
    priceURL = 'https://finance.yahoo.com/quote/EURUSD=X/'

    # Headers
    headers = {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.54 Safari/537.36", "Accept":"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", "DNT":"1","Connection":"close", "Upgrade-Insecure-Requests":"1"}

    # Connect to website & pull data.
    getData = requests.get(mainURL, headers=headers)
    getPriceData = requests.get(priceURL, headers=headers)

    ps1 = bs(getData.content, "html.parser")
    ps2 = bs(ps1.prettify(), "html.parser")

    ps1 = bs(getPriceData.content, "html.parser")
    ps2 = bs(ps1.prettify(), "html.parser")

    # Get data.
    pairTitle = ps2.find(class_="mr-sm-4 dfx-serif-anti-cls").get_text()
    pairCurrnetPrice = ps2.find(class_="Fw(b) Fz(36px) Mb(-4px) D(ib)").get_text()
    pairCurrentDayChange = ps2.find(class_="Fw(500) Pstart(8px) Fz(24px)").get_text()
    today = datetime.date.today()
    timeNow = datetime.datetime.now().time()

    # Format data.
    pairTitle = pairTitle.strip()
    pairCurrnetPrice = pairCurrnetPrice.strip()
    timeNow = timeNow.strftime("%H:%M:%S")
    pairCurrentDayChange = pairCurrentDayChange.strip()

    # header = ['Pair', 'Price', 'Day_Change', 'Current_Time', 'Date']
    data = [pairTitle, pairCurrnetPrice, pairCurrentDayChange, today, timeNow]

    with open('Forex.csv', 'a+', newline='', encoding='UTF8') as f:
        writer = csv.writer(f)
        writer.writerow(data)

    print('Printed Prices')

# Get values every 4 hours and print them to the CSV file.
# There is so much to add, however, the websites make it very challenging.
# 4hr = 14400
while(True):
    checkPrice()
    time.sleep(14400)