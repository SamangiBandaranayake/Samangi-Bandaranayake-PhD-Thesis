*****************************
**// Table 2.7 
**//Same Sources(1980 - 2005)
*****************************
clear
set more off


use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\pooled data.dta", replace 
**// Duration models
drop if DKD_First == 9
drop if year < 1979

gen yearr = year
snapspan country_id year DKD_First , gen(year0) replace
rename year year1
gen year = yearr

**// STSETTING the dataset
stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)   

**// Model II
streg WGDPgrowth_lag WInfl Wrealintrate Idepr Wtot Wcreditgrowth  Imoralhak  ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha, dist(exponential) ///
nohr vce(cluster country_id) time
 
**// Model III
streg WGDPgrowth_lag WInfl Wrealintrate  Idepr Wtot Wcreditgrowth  Imoralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha conav, dist(exponential) ///
nohr vce(cluster country_id) time

clear
set more off

use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\pooled data.dta", replace 

drop if  DKD_First == 9
keep if year > 1979

**// Logit models

**// Model II
logit DKD_First  WGDPgrowth_lag WInfl Wrealintrate  Idepr Wtot Wcreditgrowth  ///
Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha, vce(cluster country_id)

**// Model III
logit DKD_First WGDPgrowth_lag WInfl Wrealintrate Idepr Wtot Wcreditgrowth  ///
Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha ///
conav, vce(cluster country_id)

************************************
**/*//Multiple sources - (1980-2005)
************************************
clear
set more off

use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Final18022018\pooled data.dta", replace 

**//Duration models
drop if DKD_First == 9
drop if year < 1979
drop if country_id ==.

snapspan country_id year DKD_First , gen(year0) replace
rename year year1

**// STSETTING the dataset
stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)   

**// Model II
streg IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Gcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha, dist(exponential) nohr vce(cluster country_id) time
 
**// Model III
streg IGDPgrowth_lag WInfl Wrealintrate Idepr Dtot Gcreditgrowth  Imoralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha ///
conav, dist(exponential) nohr vce(cluster country_id) time


**// Logit models
clear
set more off

use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Final18022018\pooled data.dta", replace 

drop if  DKD_First == 9
keep if year > 1979

**// Model II
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate  Idepr Dtot ///
Gcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha, vce(cluster country_id)

**// Model III
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate Idepr Dtot ///
Gcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha conav, vce(cluster country_id) 
