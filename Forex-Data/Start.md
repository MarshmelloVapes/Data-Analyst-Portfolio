# Forex Data

    Thank you for taking the time to look into this with me. Although this project is just getting started, I choose to throw
    this up onto the GitHub now. The current code only includes this file and the python file used to collect the data. I may
    decide to change some of the code to make it faster in the future, however, everything is working now.

    I have had this feeling with the market for the longest time and I am super curious over how this data may be seen in the
    future. Initally I have had the thoughts that headlines/articles really do force traders to trade in certain ways, this
    was clear with the S&P 500 and Trump. I am excited to see if this is true and how the "sentiment" of IG compares to the
    actual market move. I also plan on using pytorch to see how AI reads the headlines and what "sentiment" the AI would side with.

    Please look through my code/final data (when ready) and tell me what you would change or how I could
    improve how I code/show my data in the future. I am looking at this for a career and hope to learn as
    much as I can with this little personal project.

## hypothesis:

    The media headlines have a direct impact on the price action. The test base will be on the EUR/USD.

    This has been a commonly held thought I've had for the last few years, however, I haven't come across data that proves this yet.
    I want to collect some data and use different tools like Python, SQL, and Tableau.

    This will be a great first project that will allow me to use all my known tools to see if my hypothesis is correct. Although
    some of this data exists, I want to use my own tools to obtain the data.

## Data to use:

    Forex Data
        - Two different approaches can be used for this. A API that will allow an easier connection and access to data.
          The other approache would be to use python to data scrap, similiarly to my other project that collects the data.
            - Most of the API's have a limit of 100/month. This may not be enough to capture what I need.
                - https://www.freeforexapi.com/Home/Api This could be an useful source.

        - All Forex API's are most likely scams or only update daily. I really wanted the hourly rate update so I decided to
          use the data from Yahoo instead.

    New's Data 
        - Yahoo data. This will give a good base, 1 or 2 headlines plus the "market move" (bear/bullish).
            - https://finance.yahoo.com/quote/EURUSD=X/
        - DailyFX. This can be used to cross the "market move" with the yahoo data.
            - https://www.dailyfx.com/sentiment
        - Trading view. This can be used for new's headlines (how I did my api) + sentient.
            - https://www.tradingview.com/symbols/EURUSD/news/
            - New's data hidden behind ajax. Data scrape managed to get around that.

## Data structure.

    I want to use two different files for the data, this will allow me to work on my skills with SQL.

    Forex
        [ Pair, Rate, Time, Date ]
            - Time will be important for future joins.

    New's Data
        [ Source, NewsHeadlineOne, NewsHeadlineTwo, Time, Date ]
            - This structure has changed with the bypass of the AJAX request. I am now collecting up to 40 headlines per fetch.
              Many of these will be repeating headlines that I will later remove in SQL/Python.

    Sentiment Data
        [ YahooSentiment, IGSentiment, Time, Date ]
        - Getting the Yahoo data seems to be more challenging.
            - Avoding the Yahoo sentiment for now.

## Notes.

    [ Thursday May 26th, 2022. ]
        The data collection process has started. I have this being hosted on a cloud server.
        I'm hoping to let this run for atleast a month, maybe longer, to allow me to collect as much data as possible.
        Along with the orignal though, news controlls price action, I will also be really looking at the Sentiment data.
        I plan on using pytorch to create an ML that will get the sentiment data from the titles alone.

        There have been some problems with the alread, including API's and some other coding problems, however, everything
        seems to be working as indented now. While this is in the process of the data collection, I will leave this on my
        Github and update it when the collection is complete.