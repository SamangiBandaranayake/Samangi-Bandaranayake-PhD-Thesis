***********************************************************************
**// Table 2.8: Replication of Key Models Using Updated Data: 1980-2011
**// Panel A - SCW's H-statistic and Concentration from 1980-2011
***********************************************************************
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\Table6&10.dta", replace


**// Duration models
drop if DKD_First == 9
drop if year < 1979

snapspan country_id year DKD_First , gen(year0) replace
rename year year1

**// STSETTING the dataset
stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)   

**// Model II
streg IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica SCWHa, dist(exponential) nohr vce(cluster country_id) time
estat ic 

**// Model III
streg IGDPgrowth_lag WInfl Wrealintrate Idepr Dtot Wcreditgrowth  Imoralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica SCWHa ///
SCWconav, dist(exponential) nohr vce(cluster country_id) time
estat ic  

**// Logit models
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\Table6&10.dta", replace



drop if  DKD_First == 9
keep if year > 1979

**// Model II
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica SCWHa, vce(cluster country_id) 
estat ic 

**// Model III
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica SCWHa SCWconav, vce(cluster country_id)
estat ic 

************************************************************************
**// Panel B - Two constant H-statistic and Concentration from 1980-2011
************************************************************************
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\Table6&10.dta", replace


**// Duration models
drop if DKD_First == 9
drop if year < 1979

snapspan country_id year DKD_First , gen(year0) replace
rename year year1

**// STSETTING the dataset
stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)   

**// Model II
streg IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha_constant, dist(exponential) nohr vce(cluster country_id) time
estat ic  

**// Model III
streg IGDPgrowth_lag WInfl Wrealintrate Idepr Dtot Wcreditgrowth  Imoralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha_constant ///
conav_constant, dist(exponential) nohr vce(cluster country_id) time
estat ic  

**// Logit models
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\Table6&10.dta", replace



drop if  DKD_First == 9
keep if year > 1979

**// Model II
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha_constant, vce(cluster country_id)
estat ic 

**// Model III
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha_constant conav_constant, vce(cluster country_id)
estat ic 

************************************************************************
**// Panel C - Time varying H-statistic and Concentration from 1980-2011
************************************************************************
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\Table6&10.dta", replace



**// Duration models
drop if DKD_First == 9
drop if year < 1979

snapspan country_id year DKD_First , gen(year0) replace
rename year year1

**// STSETTING the dataset
stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)   

**// Model II
streg IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha_mixed, dist(exponential) nohr vce(cluster country_id) time
estat ic  

**// Model III
streg IGDPgrowth_lag WInfl Wrealintrate Idepr Dtot Wcreditgrowth  Imoralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha_mixed ///
conavmixed_avg, dist(exponential) nohr vce(cluster country_id) time
estat ic  

**// Logit models
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\Table6&10.dta", replace

drop if  DKD_First == 9
keep if year > 1979

**// Model II
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha_mixed, vce(cluster country_id) 
estat ic 

**// Model III
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha_mixed conavmixed_avg, vce(cluster country_id)
estat ic 
