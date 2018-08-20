***************
**// Table 3.15
***************
**//Exclude quadratic estimates

clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep_exclude interaction and quardratic.dta"
set more off
gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
gen double invlnobs=1/lnobs
bysort IDStudy: egen PCCmed = median(PCC)
bysort IDStudy: egen invSEPCCmed = median(invSEPCC)
bysort IDStudy: egen SEPCCmed = median(SEPCC)
bysort IDStudy: egen tmed = median(t)

**//unweighted
xtset IDStudy
eststo: xtreg PCC SEPCC, fe vce(cluster IDStudy)
eststo: xtreg PCC SEPCC if reviewed_journal==1, fe vce(cluster IDStudy)
eststo: xtivreg PCC (SEPCC=lnobs), fe
eststo: xtivreg PCC (SEPCC=lnobs) if reviewed_journal==1, fe
**//weighted
eststo: xtreg PCC SEPCC [pweight=investperst], fe vce(cluster IDStudy)
eststo: xtreg PCC SEPCC [pweight=investperst] if reviewed_journal==1, ///
fe vce(cluster IDStudy)
