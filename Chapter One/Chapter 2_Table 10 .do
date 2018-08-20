****************************************************************************************************************
**// table 2.10
**// Effect Sizes Calculated from Panel B of Table 2.7 - Two constant H-statistic and Concentration from 1980-2011
****************************************************************************************************************
clear
graph drop _all
set scheme s1mono, permanently
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\Table6&10.dta", replace

drop if DKD_First == 9
drop if year < 1979

snapspan country_id year DKD_First , gen(year0) replace
rename year year1

*********************
**// Duration model 
*********************

**// STSETTING the dataset
stset year1 , origin(time year0) id(country_id) failure(DKD_First) exit(time .)   

**// Model III
streg IGDPgrowth_lag WInfl Wrealintrate Idepr Dtot Wcreditgrowth  Imoralhak ///
LegOrGer LegOrFre LegOrSca Africa Other  LatinAmerica Ha_constant ///
conav_constant, dist(exponential) nohr robust cluster(country_id) time

gen sample1 = e(sample)

****************
**// Logit model 
****************

logit DKD_First IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha_constant conav_constant, vce(cluster country_id)

replace sample1 = e(sample)

summ Ha_constant if sample1 == 1, detail
gen Ha_constant1 = r(p25)
gen Ha_constant2 = r(p50)
gen Ha_constant3 = r(p75)

summ conav_constant if sample1 == 1, detail
gen conav_constant1 = r(p25)
gen conav_constant2 = r(p50)
gen conav_constant3 = r(p75)

// In this do-loop, all the variable values are replaced with their mean values
foreach i in IGDPgrowth_lag WInfl Wrealintrate  Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha_constant conav_constant {
summ `i' if sample1==1
replace `i'=r(mean)
}

// Ha_constant0 = the mean of the original values of the H-stat variable
gen Ha_constant0 = Ha_constant

// In this do-loop, predicted probabilities are calculated for the 25th, 50th, and 75th percentile
// values of H-stat, with all the other variables evaluated at their means
local i = 1
foreach j in Ha_constant1 Ha_constant2 Ha_constant3 {
replace Ha_constant = `j'
predict LogitProb1`i' if sample1 == 1, pr
local i=`i'+1
}

// In this do-loop, predicted probabilities are calculated for the 25th, 50th, and 75th percentile
// values of Concentration, with all the other variables evaluated at their means
replace Ha_constant = Ha_constant0
local i = 1
foreach j in conav_constant1 conav_constant2 conav_constant3 {
replace conav_constant = `j'
predict LogitProb2`i' if sample1 == 1, pr
local i=`i'+1
}
summ LogitProb11 LogitProb12 LogitProb13 LogitProb21 LogitProb22 LogitProb23


clear
*******************************************************************
**//Table 2.9 - Panel A, Column 2
*******************************************************************
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\TABLE11.dta", replace


glm Z Ha_C conav_C IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica,family(binomial) link(logit) vce(cluster country_id) nolog

gen sample1 = e(sample)

set scheme s1mono

summ Ha_C if sample1 == 1, detail
gen Ha_C1 = r(p25)
gen Ha_C2 = r(p50)
gen Ha_C3 = r(p75)

summ conav_C if sample1 == 1, detail
gen conav_C1 = r(p25)
gen conav_C2 = r(p50)
gen conav_C3 = r(p75)

// In this do-loop, all the variable values are replaced with their mean values
foreach i in IGDPgrowth_lag WInfl Wrealintrate  Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa ///
Other  LatinAmerica Ha_C conav_C {
summ `i' if sample1==1
replace `i'=r(mean)
}

// Ha_C0 = the mean of the original values of the H-stat variable
gen Ha_C0 = Ha_C

// In this do-loop, predicted probabilities are calculated for the 25th, 50th, and 75th percentile
// values of H-stat, with all the other variables evaluated at their means
local i = 1
foreach j in Ha_C1 Ha_C2 Ha_C3 {
replace Ha_C = `j'
predict ZPred1`i' if sample1 == 1
local i=`i'+1
}

// In this do-loop, predicted probabilities are calculated for the 25th, 50th, and 75th percentile
// values of Concentration, with all the other variables evaluated at their means
replace Ha_C = Ha_C0
local i = 1
foreach j in conav_C1 conav_C2 conav_C3 {
replace conav_C = `j'
predict ZPred2`i' if sample1 == 1
local i=`i'+1
}
summ ZPred11 ZPred12 ZPred13 ZPred21 ZPred22 ZPred23

