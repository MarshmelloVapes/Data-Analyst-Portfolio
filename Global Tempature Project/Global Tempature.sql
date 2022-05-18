-- The data connected is related to global tempature change.
-- I want to use this data to correleate tempature change to
-- sea level rise + glacier mass (This one is a little different
-- due to annual size changes in ice).

-- Good to know info before jumping in:
-- http://www.cmar.csiro.au/sealevel/N_a_altimetry_gmsl_refined.html
-- https://insideclimatenews.org/news/31052016/why-antarctica-sea-ice-level-growing-while-arctic-glaciers-melts-climate-change-global-warming/
-- https://www.carbonbrief.org/explainer-how-do-scientists-measure-global-temperature/
-- https://climate.nasa.gov/news/2876/new-studies-increase-confidence-in-nasas-measure-of-earths-temperature/

-- Temp tables



-- Current data sets.

select * from globalTempature.globaltempannual

select * from globalTempature.sealevelannual
order by Year DESC

select * from  globalTempature.glaciermassannual
order by Year DESC;

-- Start joining a few of the tables togeather.

-- Tempature and glacier mass.

select source as "Tempature Source", globaltempannual.year, globaltempannual.Mean as "Mean Tempature",
glaciermassannual.`Mean cumulative mass balance`,
glaciermassannual.`Number of observations`
from globalTempature.globaltempannual
right outer join globalTempature.glaciermassannual
    on globaltempannual.year = glaciermassannual.year
where source = "GCAG"

-- Tempature and sea level

select source as "Tempature Source", globaltempannual.year, globaltempannual.Mean as "Mean Tempature",
sealevelannual.`CSIRO Adjusted Sea Level`, sealevelannual.`Lower Error Bound`,
sealevelannual.`Upper Error Bound`, sealevelannual.`NOAA Adjusted Sea Level`
from globalTempature.globaltempannual
right outer join globalTempature.sealevelannual
    on globaltempannual.year = sealevelannual.year
where source = "GCAG"

-- glacier mass and sea level
-- This will be a fun comparison, however, has no ground for any
-- arugment on tempature rise.

select glaciermassannual.year, glaciermassannual.`Mean cumulative mass balance`,
glaciermassannual.`Number of observations`, sealevelannual.`CSIRO Adjusted Sea Level`,
sealevelannual.`Lower Error Bound`, sealevelannual.`Upper Error Bound`,
sealevelannual.`NOAA Adjusted Sea Level` from globalTempature.glaciermassannual
right outer join globalTempature.sealevelannual
    on glaciermassannual.year = sealevelannual.year
where glaciermassannual.year >= 1945


-- All of these tables were exported to json to be used
-- in Tableau or python in the future. Any NULL values were
-- subbed out with "0" instead just so Tableau will work.