**************************
**//Table 2.1- Summary Statistic
**************************
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\paper.dta", replace
keep if year > 1979


**// Model II
logit DKD_First  GDPgrowth_lag Infl realintrate   depr tot ///
creditgrowth  moralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica, robust

gen a=e(sample)
sum if a==1
