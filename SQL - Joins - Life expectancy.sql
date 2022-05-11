/*
Using some basic SQL to combine these two files.
I went through using python on the inital data and wanted to explore/add
some data of the cost of the health care. I'll look at Canada and Zimbabwe.

I'll be using some basic joins to simply create the tables and show the data.
This was made using MYSQL.

The data being joined on this file exist in one already. This is mainly a test to see
how I would combine the two given a common variable. This would work if I only had
A: Entity, Code, Life expecatancy
b: Code, GDP Per Capita, Population (historical estimates)

The table created can be exported and used in a similar way to my first life expectancy
project. This time, maybe looking at the correlation between the gdp growth and the life expectancy rise
throughout the years.

This data was taken from: https://ourworldindata.org/life-expectancy
*/

select *
from life
where code = 'CAN'

select *
from lifeexpectancygdppercapita
where code = 'CAN'

-- Below allows us to see the data, joined by the year.
-- This would futher allow us to combine the data and use that data to correlate
-- Life expectancy to GDP and how that interaction works.

select *
from life
right outer join lifeexpectancygdppercapita
    on life.year = lifeexpectancygdppercapita.year
where  life.code = 'CAN' and lifeexpectancygdppercapita.code = 'CAN'

-- The export from this is attached. Although the data exists in one file, this was
-- mainly a test of joins. The table can be cleaned and used more easily.

select life.Entity, life.Code, life.Year, life.`Life expectancy`, lifeexpectancygdppercapita.`GDP per capita`, lifeexpectancygdppercapita.`Population (historical estimates)`
from life
inner join lifeexpectancygdppercapita
    on life.year = lifeexpectancygdppercapita.year
where  life.code = 'CAN' and lifeexpectancygdppercapita.code = 'CAN'

-- Below is an example of what data is avaliable on Zimbabwe

-- select life.Entity, life.Code, life.Year, life.`Life expectancy`, lifeexpectancygdppercapita.`GDP per capita`, lifeexpectancygdppercapita.`Population (historical estimates)`
-- from life
-- left outer join lifeexpectancygdppercapita
--    on life.Year = lifeexpectancygdppercapita.Year
--where  lifeexpectancygdppercapita.Entity = 'Zimbabwe' and life.Entity = 'Zimbabwe'

-- I cant seem to get this to print the way I would like. It seems that the sql server is having a
-- hard time finding the information related to Zimbabwe in the lifeexpectancygdppercapita table.


-- Below is the export of the json of the table for Canada. This was an easy way to throw the data into the file for Github.
/*
[
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1831,
    "Life expectancy": 39.046398,
    "GDP per capita": "",
    "Population (historical estimates)": "1215377"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1841,
    "Life expectancy": 40.3172,
    "GDP per capita": "",
    "Population (historical estimates)": "1765826"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1851,
    "Life expectancy": 41.059681,
    "GDP per capita": "",
    "Population (historical estimates)": "2559499"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1861,
    "Life expectancy": 41.595039,
    "GDP per capita": "",
    "Population (historical estimates)": "3381997"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1871,
    "Life expectancy": 42.556801,
    "GDP per capita": "2797",
    "Population (historical estimates)": "3810235"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1881,
    "Life expectancy": 44.729759,
    "GDP per capita": "3252",
    "Population (historical estimates)": "4380612"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1891,
    "Life expectancy": 45.17416,
    "GDP per capita": "3840",
    "Population (historical estimates)": "4892090"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1901,
    "Life expectancy": 48.63448,
    "GDP per capita": "4937",
    "Population (historical estimates)": "5523789"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1911,
    "Life expectancy": 52.510639,
    "GDP per capita": "6715",
    "Population (historical estimates)": "7158958"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1921,
    "Life expectancy": 57.029999,
    "GDP per capita": "5351",
    "Population (historical estimates)": "8726061"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1922,
    "Life expectancy": 56.990002,
    "GDP per capita": "6046",
    "Population (historical estimates)": "8885262"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1923,
    "Life expectancy": 56.93,
    "GDP per capita": "6338",
    "Population (historical estimates)": "9042762"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1924,
    "Life expectancy": 58.759998,
    "GDP per capita": "6339",
    "Population (historical estimates)": "9203054"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1925,
    "Life expectancy": 59.23,
    "GDP per capita": "6918",
    "Population (historical estimates)": "9366188"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1926,
    "Life expectancy": 57.919998,
    "GDP per capita": "7168",
    "Population (historical estimates)": "9532213"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1927,
    "Life expectancy": 58.630001,
    "GDP per capita": "7726",
    "Population (historical estimates)": "9701181"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1928,
    "Life expectancy": 58.540001,
    "GDP per capita": "8244",
    "Population (historical estimates)": "9873144"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1929,
    "Life expectancy": 57.939999,
    "GDP per capita": "8074",
    "Population (historical estimates)": "10034182"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1930,
    "Life expectancy": 58.91,
    "GDP per capita": "7669",
    "Population (historical estimates)": "10183950"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1931,
    "Life expectancy": 60.27,
    "GDP per capita": "6382",
    "Population (historical estimates)": "10322094"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1932,
    "Life expectancy": 61.349998,
    "GDP per capita": "5852",
    "Population (historical estimates)": "10448251"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1933,
    "Life expectancy": 62.259998,
    "GDP per capita": "5372",
    "Population (historical estimates)": "10562053"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1934,
    "Life expectancy": 62.66,
    "GDP per capita": "5883",
    "Population (historical estimates)": "10677095"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1935,
    "Life expectancy": 62.400002,
    "GDP per capita": "6298",
    "Population (historical estimates)": "10793390"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1936,
    "Life expectancy": 62.650002,
    "GDP per capita": "6574",
    "Population (historical estimates)": "10910951"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1937,
    "Life expectancy": 61.290001,
    "GDP per capita": "7130",
    "Population (historical estimates)": "11029793"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1938,
    "Life expectancy": 63.259998,
    "GDP per capita": "7246",
    "Population (historical estimates)": "11149930"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1939,
    "Life expectancy": 63.689999,
    "GDP per capita": "7600",
    "Population (historical estimates)": "11288246"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1940,
    "Life expectancy": 63.959999,
    "GDP per capita": "8557",
    "Population (historical estimates)": "11445248"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1941,
    "Life expectancy": 63.720001,
    "GDP per capita": "9645",
    "Population (historical estimates)": "11621456"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1942,
    "Life expectancy": 64.629997,
    "GDP per capita": "11210",
    "Population (historical estimates)": "11817397"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1943,
    "Life expectancy": 64.550003,
    "GDP per capita": "11577",
    "Population (historical estimates)": "12033612"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1944,
    "Life expectancy": 65.279999,
    "GDP per capita": "11864",
    "Population (historical estimates)": "12253783"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1945,
    "Life expectancy": 66.269997,
    "GDP per capita": "11370",
    "Population (historical estimates)": "12477983"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1946,
    "Life expectancy": 66.470001,
    "GDP per capita": "11048",
    "Population (historical estimates)": "12706285"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1947,
    "Life expectancy": 66.720001,
    "GDP per capita": "11298",
    "Population (historical estimates)": "12938764"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1948,
    "Life expectancy": 67.269997,
    "GDP per capita": "11261",
    "Population (historical estimates)": "13175496"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1949,
    "Life expectancy": 67.589996,
    "GDP per capita": "11260",
    "Population (historical estimates)": "13439995"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1950,
    "Life expectancy": 68.494,
    "GDP per capita": "11622",
    "Population (historical estimates)": "13733398"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1951,
    "Life expectancy": 68.638,
    "GDP per capita": "12007",
    "Population (historical estimates)": "14078449"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1952,
    "Life expectancy": 68.922,
    "GDP per capita": "12486",
    "Population (historical estimates)": "14445453"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1953,
    "Life expectancy": 69.197,
    "GDP per capita": "12726",
    "Population (historical estimates)": "14834905"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1954,
    "Life expectancy": 69.463,
    "GDP per capita": "12272",
    "Population (historical estimates)": "15245416"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1955,
    "Life expectancy": 69.721,
    "GDP per capita": "13072",
    "Population (historical estimates)": "15673764"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1956,
    "Life expectancy": 69.969,
    "GDP per capita": "13791",
    "Population (historical estimates)": "16114734"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1957,
    "Life expectancy": 70.208,
    "GDP per capita": "13719",
    "Population (historical estimates)": "16561262"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1958,
    "Life expectancy": 70.438,
    "GDP per capita": "13603",
    "Population (historical estimates)": "17004835"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1959,
    "Life expectancy": 70.657,
    "GDP per capita": "13829",
    "Population (historical estimates)": "17436204"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1960,
    "Life expectancy": 70.866,
    "GDP per capita": "13952",
    "Population (historical estimates)": "17847404"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1961,
    "Life expectancy": 71.064,
    "GDP per capita": "14080",
    "Population (historical estimates)": "18233965"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1962,
    "Life expectancy": 71.252,
    "GDP per capita": "14787",
    "Population (historical estimates)": "18596848"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1963,
    "Life expectancy": 71.429,
    "GDP per capita": "15248",
    "Population (historical estimates)": "18943237"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1964,
    "Life expectancy": 71.599,
    "GDP per capita": "15938",
    "Population (historical estimates)": "19284228"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1965,
    "Life expectancy": 71.762,
    "GDP per capita": "16694",
    "Population (historical estimates)": "19627973"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1966,
    "Life expectancy": 71.918,
    "GDP per capita": "17448",
    "Population (historical estimates)": "19975695"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1967,
    "Life expectancy": 72.07,
    "GDP per capita": "17658",
    "Population (historical estimates)": "20324786"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1968,
    "Life expectancy": 72.222,
    "GDP per capita": "18297",
    "Population (historical estimates)": "20674999"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1969,
    "Life expectancy": 72.378,
    "GDP per capita": "18988",
    "Population (historical estimates)": "21025257"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1970,
    "Life expectancy": 72.543,
    "GDP per capita": "19207",
    "Population (historical estimates)": "21374326"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1971,
    "Life expectancy": 72.722,
    "GDP per capita": "20024",
    "Population (historical estimates)": "21723465"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1972,
    "Life expectancy": 72.916,
    "GDP per capita": "20837",
    "Population (historical estimates)": "22072193"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1973,
    "Life expectancy": 73.128,
    "GDP per capita": "22058",
    "Population (historical estimates)": "22415313"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1974,
    "Life expectancy": 73.359,
    "GDP per capita": "22643",
    "Population (historical estimates)": "22745896"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1975,
    "Life expectancy": 73.611,
    "GDP per capita": "22819",
    "Population (historical estimates)": "23059266"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1976,
    "Life expectancy": 73.885,
    "GDP per capita": "23754",
    "Population (historical estimates)": "23354587"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1977,
    "Life expectancy": 74.178,
    "GDP per capita": "24265",
    "Population (historical estimates)": "23634377"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1978,
    "Life expectancy": 74.485,
    "GDP per capita": "24994",
    "Population (historical estimates)": "23901716"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1979,
    "Life expectancy": 74.798,
    "GDP per capita": "25775",
    "Population (historical estimates)": "24161133"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1980,
    "Life expectancy": 75.108,
    "GDP per capita": "25784",
    "Population (historical estimates)": "24416885"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1981,
    "Life expectancy": 75.406,
    "GDP per capita": "26256",
    "Population (historical estimates)": "24668159"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1982,
    "Life expectancy": 75.686,
    "GDP per capita": "25151",
    "Population (historical estimates)": "24916538"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1983,
    "Life expectancy": 75.944,
    "GDP per capita": "25625",
    "Population (historical estimates)": "25171436"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1984,
    "Life expectancy": 76.178,
    "GDP per capita": "26836",
    "Population (historical estimates)": "25444886"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1985,
    "Life expectancy": 76.388,
    "GDP per capita": "28025",
    "Population (historical estimates)": "25744807"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1986,
    "Life expectancy": 76.581,
    "GDP per capita": "28472",
    "Population (historical estimates)": "26075504"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1987,
    "Life expectancy": 76.764,
    "GDP per capita": "29246",
    "Population (historical estimates)": "26432894"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1988,
    "Life expectancy": 76.944,
    "GDP per capita": "30275",
    "Population (historical estimates)": "26806125"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1989,
    "Life expectancy": 77.123,
    "GDP per capita": "30458",
    "Population (historical estimates)": "27179497"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1990,
    "Life expectancy": 77.303,
    "GDP per capita": "30082",
    "Population (historical estimates)": "27541323"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1991,
    "Life expectancy": 77.48,
    "GDP per capita": "29151.697265625",
    "Population (historical estimates)": "27888813"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1992,
    "Life expectancy": 77.653,
    "GDP per capita": "29141.19140625",
    "Population (historical estimates)": "28224410"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1993,
    "Life expectancy": 77.821,
    "GDP per capita": "29657.57421875",
    "Population (historical estimates)": "28547964"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1994,
    "Life expectancy": 77.986,
    "GDP per capita": "30745.822265625",
    "Population (historical estimates)": "28860734"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1995,
    "Life expectancy": 78.152,
    "GDP per capita": "31330.720703125",
    "Population (historical estimates)": "29164153"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1996,
    "Life expectancy": 78.324,
    "GDP per capita": "31594.2421875",
    "Population (historical estimates)": "29457820"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1997,
    "Life expectancy": 78.505,
    "GDP per capita": "32709.69140625",
    "Population (historical estimates)": "29742378"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1998,
    "Life expectancy": 78.698,
    "GDP per capita": "33785.74609375",
    "Population (historical estimates)": "30022078"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 1999,
    "Life expectancy": 78.902,
    "GDP per capita": "35345.72265625",
    "Population (historical estimates)": "30302511"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2000,
    "Life expectancy": 79.118,
    "GDP per capita": "36942.5625",
    "Population (historical estimates)": "30588379"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2001,
    "Life expectancy": 79.341,
    "GDP per capita": "37307.20703125",
    "Population (historical estimates)": "30880072"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2002,
    "Life expectancy": 79.567,
    "GDP per capita": "38123.98828125",
    "Population (historical estimates)": "31178260"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2003,
    "Life expectancy": 79.793,
    "GDP per capita": "38559.9765625",
    "Population (historical estimates)": "31488046"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2004,
    "Life expectancy": 80.015,
    "GDP per capita": "39491.5703125",
    "Population (historical estimates)": "31815490"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2005,
    "Life expectancy": 80.235,
    "GDP per capita": "40485.01953125",
    "Population (historical estimates)": "32164313"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2006,
    "Life expectancy": 80.454,
    "GDP per capita": "41247.1484375",
    "Population (historical estimates)": "32536994"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2007,
    "Life expectancy": 80.675,
    "GDP per capita": "41806.86328125",
    "Population (historical estimates)": "32930795"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2008,
    "Life expectancy": 80.897,
    "GDP per capita": "41896.42578125",
    "Population (historical estimates)": "33337638"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2009,
    "Life expectancy": 81.114,
    "GDP per capita": "40312.62109375",
    "Population (historical estimates)": "33746093"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2010,
    "Life expectancy": 81.322,
    "GDP per capita": "41209.42578125",
    "Population (historical estimates)": "34147566"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2011,
    "Life expectancy": 81.51,
    "GDP per capita": "42197",
    "Population (historical estimates)": "34539156"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2012,
    "Life expectancy": 81.674,
    "GDP per capita": "42445",
    "Population (historical estimates)": "34922031"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2013,
    "Life expectancy": 81.812,
    "GDP per capita": "42994",
    "Population (historical estimates)": "35296535"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2014,
    "Life expectancy": 81.927,
    "GDP per capita": "43607",
    "Population (historical estimates)": "35664338"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2015,
    "Life expectancy": 82.026,
    "GDP per capita": "43619",
    "Population (historical estimates)": "36026668"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2016,
    "Life expectancy": 82.117,
    "GDP per capita": "43745",
    "Population (historical estimates)": "36382942"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2017,
    "Life expectancy": 82.21,
    "GDP per capita": "44591.640625",
    "Population (historical estimates)": "36732091"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2018,
    "Life expectancy": 82.315,
    "GDP per capita": "44868.7421875",
    "Population (historical estimates)": "37074558"
  },
  {
    "Entity": "Canada",
    "Code": "CAN",
    "Year": 2019,
    "Life expectancy": 82.434,
    "GDP per capita": "",
    "Population (historical estimates)": "37411038"
  }
]
