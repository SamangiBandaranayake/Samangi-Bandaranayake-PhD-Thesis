****************
**// Table 3.8.1
****************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Z&Hcompetition.dta"
set more off
xtset IDStudy
gen double lnobs = ln(Samplesize)
**//OLS
ivreg2 PCC SEPCC  dummies Hstatistic developed undeveloped FE ///
lnobs ownership Logit SLS firstpub citations profitability ///
IFrecursive, cluster (IDStudy)

**// BMA Z&Hunweighted.csv
