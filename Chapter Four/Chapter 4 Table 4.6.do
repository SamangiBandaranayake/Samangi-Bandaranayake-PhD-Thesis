*****************************
**// Table 4.6 (Extra Papers)
*****************************
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Extra_papers.dta"
set more off
gen double invSEPCC = 1/SEPCC
gen double lnobs = ln(Samplesize)
xtset IDStudy

**Table 4.6 PANEL A- weighted (Z&H variable selection criteria)
ivreg2 PCC SEPCC dummies Hstatistic developed undeveloped Logit lnobs ///
citations firstpub quadratic Boone IFrecursive regulation OLS ///
reviewed_journal [pweight=investperst], cluster (IDStudy)

lincom  _cons + SEPCC*0 + lnobs*11.51234 + IFrecursive*0.486 + ///
citations*2.639057+firstpub*10.42857 + reviewed_journal*1 + ///
dummies*0 +  Hstatistic*0 + developed*0.3238096 + undeveloped*0.3433163 + ///
Logit*0 + regulation*1 + quadratic*0 + Boone*1 + OLS*0

lincom  _cons + SEPCC*0 + lnobs*11.51234 + IFrecursive*0.486 + ///
citations*2.639057+firstpub*10.42857 + reviewed_journal*1 + ///
dummies*0 +  Hstatistic*0 + developed*1+ undeveloped*0 + ///
Logit*0 + regulation*1 + quadratic*0 + Boone*1 + OLS*0

lincom  _cons + SEPCC*0 + lnobs*11.51234 + IFrecursive*0.486 + ///
citations*2.639057+firstpub*10.42857 + reviewed_journal*1 + ///
dummies*0 +  Hstatistic*0 + developed*0 + undeveloped*1 + ///
Logit*0 + regulation*1 + quadratic*0 + Boone*1 + OLS*0

**Table 4.6 PANEL A-unweighted (Based on Z&H variable selection criteria)
ivreg2 PCC SEPCC  dummies Hstatistic developed undeveloped FE ///
lnobs ownership Logit SLS firstpub citations profitability ///
IFrecursive, cluster (IDStudy)

lincom _cons+SEPCC*0+dummies*0+Hstatistic*0+developed*0.4370079+ ///
undeveloped*0.2427822+FE*0.3149606 + lnobs*11.51234 + ownership*0.1023622 + ///
Logit*0 + SLS*0.0564304 + firstpub*10.57087 + citations*2.639057 + ///
profitability*0.0577428 +IFrecursive*0.486

lincom _cons+SEPCC*0+dummies*0+Hstatistic*0+developed*1+ ///
FE*0.3149606 + lnobs*11.51234 + ownership*0.1023622 + ///
Logit*0 + SLS*0.0564304 + firstpub*10.57087 + citations*2.639057 + ///
profitability*0.0577428 +IFrecursive*0.486

lincom _cons+SEPCC*0+dummies*0+Hstatistic*0+ ///
undeveloped*1+FE*0.3149606 + lnobs*11.51234 + ownership*0.1023622 + ///
Logit*0 + SLS*0.0564304 + firstpub*10.57087 + citations*2.639057 + ///
profitability*0.0577428 +IFrecursive*0.486

**// Table 4.6 PANEL B-weighted based on Table 4.5
ivreg2 PCC citations firstpub OLS reviewed_journal Concentration Logit  macro ///
HHI FE RE developed T Zscore global dummies  sampleyear undeveloped [pweight=investperst], cluster (IDStudy) 

lincom  _cons + citations*2.639057+firstpub*10.42857 + reviewed_journal*1+ ///
OLS*0+ Concentration*0 + Logit*0+  macro*0.1428572 + HHI*0+ FE*0.2669671+ ///
RE*0.0806259+  developed*0.3238096  +  T*2.352176+  Zscore*0.3350795+  ///
global*0.7401947 + dummies*0 + sampleyear*10.50945 + undeveloped*0.3433163   

lincom  _cons + citations*2.639057+firstpub*10.42857 + reviewed_journal*1+ ///
OLS*0+ Concentration*0 + Logit*0+  macro*0.1428572 + HHI*0+ FE*0.2669671+ ///
RE*0.0806259+  developed*1 + T*2.352176+Zscore*0.3350795+  ///
global*0.7401947 + dummies*0 + sampleyear*10.50945 + undeveloped*0   

lincom  _cons + citations*2.639057+firstpub*10.42857 + reviewed_journal*1+ ///
OLS*0+ Concentration*0 + Logit*0+  macro*0.1428572 + HHI*0+ FE*0.2669671+ ///
RE*0.0806259+  developed*0 + T*2.352176+  Zscore*0.3350795+  ///
global*0.7401947 + dummies*0 + sampleyear*10.50945 + undeveloped*1   


**//Table 4.6 PANEL B-unweighted (Based on Table 4.8)
ivreg2 PCC Boone NPL sampleyear  HHI DtoD IFrecursive developed undeveloped, cluster (IDStudy)

lincom _cons+ Boone*1+ NPL*0.160105+ sampleyear*9.644357+  HHI*0 + ///
DtoD*1 + IFrecursive*0.486 +developed*0.4370079+ undeveloped*0.2427822

lincom _cons+ Boone*1+ NPL*0.160105+ sampleyear*9.644357+  HHI*0 + ///
DtoD*1 + IFrecursive*0.486 +developed*1+ undeveloped*0

lincom _cons+ Boone*1+ NPL*0.160105+ sampleyear*9.644357+  HHI*0 + ///
DtoD*1 + IFrecursive*0.486 +developed*0+ undeveloped*1
