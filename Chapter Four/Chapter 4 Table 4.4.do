***************************
**// Table 4 (Extra Papers)
**************************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Extra_papers.dta"
set more off
gen double lnobs = ln(Samplesize)

sum PCC SEPCC  dummies Hstatistic developed undeveloped Logit lnobs citations ///
firstpub quadratic Boone IFrecursive regulation OLS reviewed_journal ownership ///
Concentration FE endogeneity NPL Lerner global HHI macro Zscore RE T ///
DtoD sampleyear GMM someAveraged profit_volat profitability SLS capitalization ///
mixed Otherstability othercompetition Othermethod

sum PCC SEPCC  dummies Hstatistic developed undeveloped Logit lnobs citations ///
firstpub quadratic Boone IFrecursive regulation OLS reviewed_journal ownership ///
Concentration FE endogeneity NPL Lerner global HHI macro Zscore RE T ///
DtoD sampleyear GMM someAveraged profit_volat profitability SLS capitalization ///
mixed Otherstability othercompetition Othermethod [aweight=investperst]
