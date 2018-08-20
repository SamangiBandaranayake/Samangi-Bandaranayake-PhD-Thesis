*****************************
**// Table 4.8 (Extra Papers)
*****************************
**// OLS (PIP>0.5)
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Extra_papers.dta"
set more off

gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
xtset IDStudy
ivreg2 PCC NPL sampleyear HHI DtoD Boone IFrecursive, cluster (IDStudy)

**// OLS (Z&H variable selection criteria)
ivreg2 PCC SEPCC dummies Hstatistic developed undeveloped FE ///
lnobs ownership Logit SLS firstpub citations profitability ///
IFrecursive, cluster (IDStudy)

**// BMA - save as Extra Papers_unweighted
