***************
**// Table 4.1 
**************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Extra_papers.dta"
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
