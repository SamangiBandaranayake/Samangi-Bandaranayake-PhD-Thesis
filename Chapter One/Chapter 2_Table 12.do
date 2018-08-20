**********************************************************************************
**//Table 2.12 - Replication of Key Models Using Alternative Competition Variables
**********************************************************************************
**//Ha (logit model vce cluster)
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\Table 12.dta", replace

drop if  DKD_First == 9
keep if year > 1979


**// Model II
logit DKD_First  GDPgrowth_lag Infl realintrate   depr tot ///
creditgrowth  moralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica Ha, vce(cluster country_id)

**// Model III
logit DKD_First GDPgrowth_lag Infl realintrate   depr tot creditgrowth  ///
moralhak   LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha ///
conav, vce(cluster country_id)

**//Lerner
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\chapter One\Chapter-do\Table 12.dta", replace

drop if DKD_First == 9
drop if year < 1979

snapspan country_id year DKD_First , gen(year0) replace
rename year year1

**// STSETTING the dataset
stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)   
 

**// Model II
streg GDPgrowth_lag Infl realintrate   depr tot creditgrowth  moralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Lerner, dist(exponential) ///
nohr robust cluster(country_id)time
 

**// Model III
streg GDPgrowth_lag Infl realintrate   depr tot creditgrowth  moralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Lerner ///
conav, dist(exponential) nohr robust cluster(country_id) time

**//Logit Model
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\Table 12.dta", replace

drop if  DKD_First == 9
keep if year > 1979


**// Model II
logit DKD_First  GDPgrowth_lag Infl realintrate   depr tot ///
creditgrowth  moralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica Lerner, vce(cluster country_id)

**// Model III
logit DKD_First GDPgrowth_lag Infl realintrate   depr tot creditgrowth  ///
moralhak   LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Lerner ///
conav, vce(cluster country_id)

**//Boone
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\chapter One\Chapter-do\Table 12.dta", replace

drop if DKD_First == 9
drop if year < 1979

snapspan country_id year DKD_First , gen(year0) replace
rename year year1

**// STSETTING the dataset
stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)   
 

**// Model II
streg GDPgrowth_lag Infl realintrate   depr tot creditgrowth  moralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Boone, dist(exponential) ///
nohr robust cluster(country_id)time
 

**// Model III
streg GDPgrowth_lag Infl realintrate   depr tot creditgrowth  moralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Boone ///
conav, dist(exponential) nohr robust cluster(country_id) time

**//Logit Model
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\Table 12.dta", replace

drop if  DKD_First == 9
keep if year > 1979


**// Model II
logit DKD_First  GDPgrowth_lag Infl realintrate   depr tot ///
creditgrowth  moralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica Boone, vce(cluster country_id)


**// Model III
logit DKD_First GDPgrowth_lag Infl realintrate   depr tot creditgrowth  ///
moralhak   LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Boone ///
conav, vce(cluster country_id)

