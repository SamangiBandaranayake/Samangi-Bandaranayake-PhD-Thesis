***************************************************************************
**// Table 2.5 - Replication of Key Models Using Updated Data (Same Source)
***************************************************************************

clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\pooled.dta", replace
drop countryname
sort country_id year

save "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\pooled1.dta", replace

use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\paper.dta", replace
sort country_id year
merge country_id year using "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\pooled1.dta" 
order countryname year cncode country_id _merge

save "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\common1.dta",replace
keep if _merge==3

save "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\common2.dta",replace
drop if DKD_First == 9
drop if year < 1979

snapspan country_id year DKD_First , gen(year0) replace
rename year year1


**// STSETTING the dataset

stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)
   
   
**********************
***Duration Models***
**********************

**// Duration Model (generating esample)

streg GDPgrowth_lag Infl  realintrate   depr tot creditgrowth  moralhak   ///
LegOrGer LegOrFre LegOrSca Africa Other LatinAmerica conav Ha, dist(exponential) nohr ///
vce(cluster country_id) time
gen aaa = e(sample)
 
**// Duration Model (Original Data) - column 2 

streg GDPgrowth_lag Infl  realintrate   depr tot creditgrowth  moralhak   ///
LegOrGer LegOrFre LegOrSca Africa Other LatinAmerica Ha if WGDPgrowth_lag !=. & ///
WInfl !=. & Wrealintrate !=. & Idepr !=. & Wtot !=. & Wcreditgrowth !=. & ///
Imoralhak !=., dist(exponential) nohr ///
vce(cluster country_id) time

**// Duration Model (Same Source) - column 2

streg WGDPgrowth_lag WInfl  Wrealintrate   Idepr Wtot Wcreditgrowth  Imoralhak   ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha if  aaa == 1, ///
dist(exponential) nohr vce(cluster country_id) time

**// Duration Model (Original Data) - column 3

streg GDPgrowth_lag Infl  realintrate   depr tot creditgrowth  moralhak   ///
LegOrGer LegOrFre LegOrSca Africa Other LatinAmerica Ha conav if WGDPgrowth_lag !=. & ///
WInfl !=. & Wrealintrate !=. & Idepr !=. & Wtot !=. & Wcreditgrowth !=. & ///
Imoralhak !=., dist(exponential) nohr vce(cluster country_id) time

**// Duration Model (Same Source) - column 3

streg WGDPgrowth_lag WInfl  Wrealintrate Idepr Wtot Wcreditgrowth  Imoralhak  ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha conav ///
if aaa == 1, dist(exponential) nohr vce(cluster country_id) time


********************
***Logit Models***
********************
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\common2.dta", replace

drop if  DKD_First == 9
keep if year > 1979

**// Logit Model (generating esample)

logit DKD_First GDPgrowth_lag Infl  realintrate  depr tot creditgrowth  moralhak ///
LegOrGer LegOrFre LegOrSca Africa Other LatinAmerica Ha conav, vce(cluster country_id) 
gen bbb = e(sample)


**// Logit Model (Original Data) - column 6 

logit DKD_First GDPgrowth_lag Infl  realintrate  depr tot creditgrowth  moralhak ///
LegOrGer LegOrFre LegOrSca Africa Other LatinAmerica Ha if WGDPgrowth_lag !=. & ///
WInfl !=. & Wrealintrate !=. & Idepr !=. & Wtot !=. & Wcreditgrowth !=. & ///
Imoralhak !=., vce(cluster country_id) 

**// Logit Model (Same Source) - column 6

logit DKD_First WGDPgrowth_lag WInfl  Wrealintrate  Idepr Wtot Wcreditgrowth  Imoralhak ///
LegOrGer LegOrFre LegOrSca Africa Other LatinAmerica Ha if bbb == 1, vce(cluster country_id)
 

**// Logit Model (Original Data) - column 7
 
logit DKD_First GDPgrowth_lag Infl  realintrate  depr tot creditgrowth  moralhak ///
LegOrGer LegOrFre LegOrSca Africa Other LatinAmerica Ha conav if WGDPgrowth_lag !=. & ///
WInfl !=. & Wrealintrate !=. & Idepr !=. & Wtot !=. & Wcreditgrowth !=. & ///
Imoralhak !=., vce(cluster country_id)

**// Logit Model (Same Source) - column 7

logit DKD_First WGDPgrowth_lag WInfl  Wrealintrate Idepr Wtot Wcreditgrowth  Imoralhak ///
LegOrGer LegOrFre LegOrSca Africa Other LatinAmerica Ha conav if bbb == 1, vce(cluster country_id)


