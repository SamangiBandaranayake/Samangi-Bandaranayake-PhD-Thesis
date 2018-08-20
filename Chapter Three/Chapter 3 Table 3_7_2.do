****************
**// Table 3.7.2
****************
**OLS
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep.dta"
set more off
gen double lnobs = ln(Samplesize)
xtset IDStudy
ivreg2 PCC SEPCC Hstatistic  Logit lnobs citations reviewed_journal firstpub ///
global developed dummies RE quadratic DtoD Lerner sampleyear ///
ownership someAveraged [pweight=investperst], cluster (IDStudy)
**//OLS (Z&H variable selection)
ivreg2 PCC SEPCC dummies Hstatistic developed undeveloped Logit lnobs ///
citations firstpub quadratic Boone IFrecursive regulation OLS ///
reviewed_journal [pweight=investperst], cluster (IDStudy)

************************************
**//Rearrange for Table 3.7.2 -BMA
************************************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep.dta"
set more off
gen double lnobs = ln(Samplesize)

local variables PCC SEPCC dummies Hstatistic developed undeveloped Logit ///
lnobs citations firstpub quadratic Boone IFrecursive  ///
regulation OLS reviewed_journal ownership Concentration FE endogeneity NPL Lerner global HHI macro Zscore RE T ///
DtoD sampleyear GMM someAveraged profit_volat profitability SLS capitalization 

foreach x of varlist `variables' {
				gen `x'_w = `x' * investperst
}


order PCC_w SEPCC_w dummies_w Hstatistic_w developed_w undeveloped_w Logit_w ///
lnobs_w citations_w firstpub_w quadratic_w Boone_w IFrecursive_w  ///
regulation_w OLS_w reviewed_journal_w ownership_w Concentration_w FE_w ///
endogeneity_w NPL_w Lerner_w global_w HHI_w macro_w ///
Zscore_w RE_w T_w DtoD_w sampleyear_w GMM_w someAveraged_w ///
profit_volat_w profitability_w SLS_w capitalization_w

drop PCC SEPCC dummies Hstatistic developed undeveloped Logit ///
lnobs citations firstpub quadratic Boone IFrecursive  ///
regulation OLS reviewed_journal ownership Concentration ///
FE endogeneity NPL Lerner global HHI macro Zscore RE T ///
DtoD sampleyear GMM someAveraged profit_volat profitability ///
SLS capitalization IDStudy t Samplesize investperst citations17 IFrecursive17 ///
other_stability other_competition mixed other_method

**//save as 598_weighted.csv
