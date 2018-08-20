************************************************
**//Table 2.3 - Replication of Key Logit Models
************************************************

clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\paper.dta", replace
keep if year > 1979


**// Model II
logit DKD_First  GDPgrowth_lag Infl realintrate   depr tot ///
creditgrowth  moralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica Ha, robust


**// Model III
logit DKD_First GDPgrowth_lag Infl realintrate   depr tot creditgrowth  ///
moralhak   LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha ///
conav, robust 




