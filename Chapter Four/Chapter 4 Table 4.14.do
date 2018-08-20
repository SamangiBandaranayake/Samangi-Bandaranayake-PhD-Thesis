****************************
**// Table 14 (Extra Papers)
****************************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Extra_papers.dta"
set more off

gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
xtset IDStudy
drop if Concentration==1
drop if HHI==1
**//unweighted
ivreg2 PCC, cluster (IDStudy)
ivreg2 PCC if developed==1, cluster (IDStudy)
ivreg2 PCC if undeveloped==1, cluster (IDStudy)
**//probability weight by inverse of number of estimates reported per study
ivreg2 PCC [pweight=investperst], cluster (IDStudy)
ivreg2 PCC if developed==1 [pweight=investperst], cluster (IDStudy)
ivreg2 PCC if undeveloped==1 [pweight=investperst], cluster (IDStudy)
