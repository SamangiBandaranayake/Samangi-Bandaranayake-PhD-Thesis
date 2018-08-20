****************************
**// Table 12 (Extra Papers)
****************************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Extra_papers.dta"
set more off

gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
xtset IDStudy
drop if quadratic==1
**//unweighted
**column 1 and 2
eststo: xtreg PCC SEPCC, fe vce(cluster IDStudy)
eststo: xtreg PCC SEPCC if reviewed_journal==1, fe vce(cluster IDStudy)
**column 3 and 4
eststo: xtivreg PCC (SEPCC=lnobs), fe
eststo: xtivreg PCC (SEPCC=lnobs) if reviewed_journal==1, fe
**//weighted
eststo: xtreg PCC SEPCC [pweight=investperst], fe vce(cluster IDStudy)
eststo: xtreg PCC SEPCC [pweight=investperst] if reviewed_journal==1, ///
fe vce(cluster IDStudy)
