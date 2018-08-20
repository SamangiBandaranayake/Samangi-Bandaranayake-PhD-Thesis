****************
**// Table 3.9.1
****************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Z&Hcompetition.dta"
set more off
xtset IDStudy
gen double lnobs = ln(Samplesize)
**//OLS
ivreg2 PCC SEPCC  dummies Hstatistic developed undeveloped Logit lnobs citations firstpub quadratic Boone IFrecursive  ///
regulation OLS reviewed_journal ownership Concentration FE endogeneity NPL Lerner global HHI macro Zscore RE T ///
DtoD sampleyear GMM someAveraged profit_volat profitability SLS capitalization [pweight=investperst], cluster (IDStudy)
**//Fixed effects
xtreg PCC SEPCC  dummies Hstatistic developed undeveloped Logit lnobs citations firstpub quadratic Boone IFrecursive  ///
regulation OLS reviewed_journal ownership Concentration FE endogeneity NPL Lerner global HHI macro Zscore RE T ///
DtoD sampleyear GMM someAveraged profit_volat profitability SLS capitalization [pweight=investperst], fe vce(cluster IDStudy)
