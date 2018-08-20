****************************************************************************************************
**// TABLE 2.13-Replication of Key Models Using Alternative Competition Variables with updated data
****************************************************************************************************
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
Other  LatinAmerica Lerner_C, dist(exponential) nohr vce(cluster country_id) time
estat ic
 
**// Model III
streg IGDPgrowth_lag WInfl Wrealintrate Idepr Dtot Wcreditgrowth  Imoralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Lerner_C ///
SCWconav, dist(exponential) nohr vce(cluster country_id) time
estat ic 

streg IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Boone_C, dist(exponential) nohr vce(cluster country_id) time
estat ic
 
**// Model III
streg IGDPgrowth_lag WInfl Wrealintrate Idepr Dtot Wcreditgrowth  Imoralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Boone_C ///
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
Other  LatinAmerica Lerner_C, vce(cluster country_id)
estat ic

**// Model III
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Lerner_C SCWconav, vce(cluster country_id)

**// Model II
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Boone_C, vce(cluster country_id)
estat ic

**// Model III
logit DKD_First IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Boone_C SCWconav, vce(cluster country_id)
estat ic


