***************
**// Table 3.16
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

xtset IDStudy
**//weighted by precision
eststo: xtreg t invSEPCC, fe vce(cluster IDStudy)
eststo: xtreg t invSEPCC if reviewed_journal==1, fe vce(cluster IDStudy)
eststo: xtivreg t (invSEPCC=invlnobs), fe
eststo: xtivreg t (invSEPCC=invlnobs) if reviewed_journal==1, fe
**//weighted by invertperst
eststo: xtreg t invSEPCC [pweight=investperst], fe vce(cluster IDStudy)
eststo: xtreg t invSEPCC [pweight=investperst] if reviewed_journal==1, ///
fe vce(cluster IDStudy)
