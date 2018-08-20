***************************************************************************************************
**// Table 2.15 - Z-score as the Dependent Variable and Additional Competition Measures (1999-2015)
**//Panel A - Constant H-statistic, Lerner, Boone and Concentration
***************************************************************************************************
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\Chapter-do\TABLE11.dta", replace

glm Z Ha_C Lerner_C Boone_C IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica,family(binomial) link(logit) vce(robust) nolog
estat ic

glm Z Ha_C Lerner_C Boone_C conav_C IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica,family(binomial) link(logit) vce(robust) nolog
estat ic
***********************************************************************
**//Panel B - Time varying H-statistic, Lerner, Boone and Concentration
***********************************************************************
glm Z Ha_T Lerner Boone IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica,family(binomial) link(logit) vce(robust) nolog
estat ic

glm Z Ha_T Lerner Boone conav IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica,family(binomial) link(logit) vce(robust) nolog
estat ic
