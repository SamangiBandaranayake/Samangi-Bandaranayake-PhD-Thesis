******************************************************************************
**// Table 2.9 - Replication Using Z-Score as the Stability Measure: 1999-2015
******************************************************************************

clear
set more off
*****************************************************
**//Panel A - Constant H-statistic and Concentration
*****************************************************
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\\Chapter-do\TABLE7.dta", replace

glm Z Ha_C IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica,family(binomial) link(logit) vce(cluster country_id) nolog
estat ic

glm Z Ha_C conav_C IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica,family(binomial) link(logit) vce(cluster country_id) nolog
estat ic


*******************************************************************
**//Panel B - Constant + Time-Varying H-statistic and Concentration
*******************************************************************
glm Z Ha_T IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica,family(binomial) link(logit) vce(cluster country_id) nolog
estat ic

glm Z Ha_T conav IGDPgrowth_lag WInfl Wrealintrate   Idepr Dtot ///
Wcreditgrowth  Imoralhak   LegOrGer LegOrFre LegOrSca Africa Other  ///
LatinAmerica,family(binomial) link(logit) vce(cluster country_id) nolog
estat ic
