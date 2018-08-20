****************
**// Table 3.8.2
****************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep.dta"
set more off
gen double lnobs = ln(Samplesize)
xtset IDStudy
**//OLS
ivreg2 PCC SEPCC dummies Hstatistic developed undeveloped SLS Logit FE RE OLS ///
endogeneity macro sampleyear lnobs ownership citations profitability ///
someAveraged, cluster (IDStudy)

**// OLS -Z&H Variable selection
ivreg2 PCC SEPCC  dummies Hstatistic developed undeveloped FE ///
lnobs ownership Logit SLS firstpub citations profitability ///
IFrecursive, cluster (IDStudy)

**//BMA-598_unweighted.csv
