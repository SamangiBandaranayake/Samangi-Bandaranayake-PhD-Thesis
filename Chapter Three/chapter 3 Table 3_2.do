**************
**// Table 3.2
**************
**// Panel A-(Z&H)
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Z&Hcompetition.dta"
set more off

gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
gen double root=sqrt(Samplesize)
gen double invlnobs=1/lnobs
gen double invroot=1/root
bysort IDStudy: egen PCCmed = median(PCC)
bysort IDStudy: egen invSEPCCmed = median(invSEPCC)
bysort IDStudy: egen SEPCCmed = median(SEPCC)
bysort IDStudy: egen tmed = median(t)
*Funnel asymmetry tests:
xtset IDStudy
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

**// Panel B - Re-coded data
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep.dta"
set more off

gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
gen double root=sqrt(Samplesize)
gen double invlnobs=1/lnobs
gen double invroot=1/root
bysort IDStudy: egen PCCmed = median(PCC)
bysort IDStudy: egen invSEPCCmed = median(invSEPCC)
bysort IDStudy: egen SEPCCmed = median(SEPCC)
bysort IDStudy: egen tmed = median(t)
*Funnel asymmetry tests:
xtset IDStudy
**unweighted
**column 1 and 2
eststo: xtreg PCC SEPCC, fe vce(cluster IDStudy)
eststo: xtreg PCC SEPCC if reviewed_journal==1, fe vce(cluster IDStudy)
**column 3 and 4
eststo: xtivreg PCC (SEPCC=lnobs), fe
eststo: xtivreg PCC (SEPCC=lnobs) if reviewed_journal==1, fe
**weighted
eststo: xtreg PCC SEPCC [pweight=investperst], fe vce(cluster IDStudy)
eststo: xtreg PCC SEPCC [pweight=investperst] if reviewed_journal==1, ///
fe vce(cluster IDStudy)
