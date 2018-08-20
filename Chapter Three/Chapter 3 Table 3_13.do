***************
**// Table 3.13
***************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep_exclude interaction.dta"
set more off
gen double lnobs = ln(Samplesize)
gen double invlnobs=1/lnobs
gen double invSEPCC = 1/SEPCC

**//unweighted
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
