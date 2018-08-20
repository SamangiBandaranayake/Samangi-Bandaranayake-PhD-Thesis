*****************************
**//Table 2.2 - Replication of Key Duration Models
*****************************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\paper.dta", replace

drop if DKD_First == 9
drop if year < 1979

snapspan country_id year DKD_First , gen(year0) replace
rename year year1

**// STSETTING the dataset
stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)   
 

**// Model II (column 2)
streg GDPgrowth_lag Infl realintrate   depr tot creditgrowth  moralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha, dist(exponential) ///
nohr robust cluster(country_id)time
 

**// Model III (column 3)
streg GDPgrowth_lag Infl realintrate   depr tot creditgrowth  moralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha ///
conav, dist(exponential) nohr robust cluster(country_id) time

