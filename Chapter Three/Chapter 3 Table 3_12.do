***************
**// Table 3.12
***************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep_exclude interaction.dta"
set more off
gen double lnobs = ln(Samplesize)
gen double invlnobs=1/lnobs

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
