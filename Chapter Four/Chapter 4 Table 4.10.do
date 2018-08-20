***************************
**// Table 10 (Extra Papers)
**************************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Extra_papers.dta"
set more off

gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
gen variance = invSEPCC^2
xtset IDStudy
ivreg2 PCC SEPCC dummies Hstatistic developed undeveloped Logit lnobs ///
citations firstpub quadratic Boone IFrecursive regulation OLS ///
reviewed_journal ownership Concentration FE endogeneity NPL Lerner global HHI macro Zscore RE T ///
DtoD sampleyear GMM someAveraged profit_volat profitability SLS capitalization [pweight=variance], cluster (IDStudy)

