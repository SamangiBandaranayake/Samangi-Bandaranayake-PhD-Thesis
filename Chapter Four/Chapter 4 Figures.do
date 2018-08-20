*********************************
**// Figure 4.1-4.4 -Extra Papers
*********************************
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

***********
**Figure 1
***********
graph twoway (scatter PCCmed firstpub, msize(*1.5) msymbol(Oh)) ///
(lfit PCCmed firstpub)

**********
**Figure 2
**********
**//Box plot:
label define stu 32 "Akins et al.(2016)", add
label define stu 33 "Ali et al.(2016)", add
label define stu 34 "Amidu(2013)", add
label define stu 35 "Amindu and Wolfe(2013)", add
label define stu 36 "Ashraf et al.(2016)", add
label define stu 37 "Beck et al.(2003)", add
label define stu 38 "Bretschger et al.(2012) ", add
label define stu 39 "Bushman et al.(2016)", add
label define stu 40 "Diallo(2015)", add
label define stu 41 "Dushku(2016)", add
label define stu 42 "Fiordelisi and Mare(2014)", add
label define stu 43 "Fungacova and Weill(2013)", add
label define stu 44 "Goetz(2016)", add
label define stu 45 "Huljak (2015)", add
label define stu 46 "Jiang et al.(2017)", add
label define stu 47 "Jimenez et al.(2007)", add
label define stu 48 "Kasman and Kasman (2015)", add
label define stu 49 "Kasman and Kasman (2016)", add
label define stu 50 "Kick and Prieto (2014)", add
label define stu 51 "Labidi and Mensi (2015)", add
label define stu 52 "Leroy and Lucotte (2017)", add
label define stu 53 "Mirzaei et al. (2013)", add
label define stu 54 "Okumus and Kibritciartar (2012)", add
label define stu 55 "Pak and Nurmakhanova(2013)", add
label define stu 56 "Pawlowska(2016)", add
label define stu 57 "Pino and Araya (2013)", add
label define stu 58 "Ruiz-Porras (2007)", add
label define stu 59 "Selvi(2009)", add
label define stu 60 "Sarkar and Sensarma (2015)", add
label define stu 61 "Sinha and Sharma(2016)", add
label define stu 62 "Soedarmono et al.(2011)", add
label define stu 63 "Soedarmono and Tarazi (2016)", add
label define stu 64 "Tan and Floros (2014)", add
label define stu 65 "Troug and Sbia(2015)", add
label define stu 66 "Wang et al. (2014)", add
label values IDStudy stu
graph hbox PCC, over(IDStudy)

**********
**Figure 3
**********
mean PCC
mean PCCmed
mean PCC if reviewed_journal==1
hist PCC, addplot(pci 0 -0.0093565 6 -0.0093565 || pci 0 -0.0118893 6 -0.0118893 || pci 0 -0.0082899 6 -0.0082899)

**********
**Figure 4
**********
**//Funnel plots
**//A:all estimates
scatter invSEPCC PCC, msize(*.9) msymbol(Oh)
**//B:Median estimates
scatter invSEPCCmed PCCmed, msize(*.9) msymbol(Oh)
