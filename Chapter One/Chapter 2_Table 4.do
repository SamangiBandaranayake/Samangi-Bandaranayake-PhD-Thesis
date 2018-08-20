*********************************************************************
**// Table 2.4 - Descriptive Statistics for Original and Updated Data
*********************************************************************
Clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\paper.dta", replace

drop if DKD_First == 9
drop if year < 1979

gen yearr = year
snapspan country_id year DKD_First , gen(year0) replace
rename year year1
gen year = yearr


**// STSETTING the dataset
stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)   

**// Model III
streg GDPgrowth_lag Infl  realintrate   depr tot creditgrowth  moralhak   ///
LegOrGer LegOrFre LegOrSca Africa Other LatinAmerica conav Ha, dist(exponential) nohr ///
robust cluster(country_id) time

gen aaa = e(sample)
keep country_id year year1 year0 aaa

sort country_id year 

save "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\paper(modified).dta", replace

clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\paper.dta"  
sort country_id year
merge country_id year using "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\paper(modified).dta", 
sort country_id year
drop _merge
save "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\paper(revised).dta",replace

clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\pooled.dta", replace
sort country_id year
merge country_id year using "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\paper(revised).dta" 
save "\\file\UsersS$\sba144\Home\Desktop\Chapter one\Chapter-do\common.dta",replace


**//summary statistic with set common observations
summ GDPgrowth_lag WGDPgrowth_lag IGDPgrowth_lag ///
if WGDPgrowth_lag !=. & IGDPgrowth_lag !=. & aaa == 1
summ Infl WInfl IInfl DInfl if WInfl !=. & IInfl !=. & DInfl !=. & aaa == 1
summ depr Wdepr Idepr Ddepr if Wdepr!=. & Idepr!=.& Ddepr!=. & aaa ==1
summ tot Wtot Dtot if Wtot!=. & Dtot!=. & aaa == 1
summ realintrate Wrealintrate Drealintrate if Wrealintrate!=. & Drealintrate!=. ///
& aaa == 1
summ creditgrowth Wcreditgrowth Gcreditgrowth if Wcreditgrowth!=. & ///
Gcreditgrowth!=. & aaa == 1
summ moralhak  Imoralhak if Imoralhak !=. & aaa == 1
