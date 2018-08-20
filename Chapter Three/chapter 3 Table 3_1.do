**************
**// Table 3.1
**************
**//Panel A (Z&H)
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
**//unweighted
ivreg2 PCC, cluster (IDStudy)
ivreg2 PCC if developed==1, cluster (IDStudy)
ivreg2 PCC if undeveloped==1, cluster (IDStudy)
**//unweighted (probability weight by inverse of number of estimates reported per study)
ivreg2 PCC [pweight=investperst], cluster (IDStudy)
ivreg2 PCC if developed==1 [pweight=investperst], cluster (IDStudy)
ivreg2 PCC if undeveloped==1 [pweight=investperst], cluster (IDStudy)

**//Panel B (re-coded data)
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
**Table 1(unweighted)
ivreg2 PCC, cluster (IDStudy)
ivreg2 PCC if developed==1, cluster (IDStudy)
ivreg2 PCC if undeveloped==1, cluster (IDStudy)
**Table 1 (probability weight by inverse of number of estimates reported per study)
ivreg2 PCC [pweight=investperst], cluster (IDStudy)
ivreg2 PCC if developed==1 [pweight=investperst], cluster (IDStudy)
ivreg2 PCC if undeveloped==1 [pweight=investperst], cluster (IDStudy)
