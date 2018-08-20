**************
**// Table 3.6
**************

**preferred values=max value from Table 4(weighted):lnobs, IFrecursive,reviewed, regulation, Boone
**not preferred=0: SEPCC,OLS, Dummies, logit, quadratic, H-statistic
**all the other variables:Table 4 mean

**// Panel A -(Z&H)
**//weighted
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Z&Hcompetition.dta"
set more off
xtset IDStudy
gen double lnobs = ln(Samplesize)
ivreg2 PCC SEPCC dummies Hstatistic developed undeveloped Logit lnobs ///
citations firstpub quadratic Boone IFrecursive regulation OLS ///
reviewed_journal [pweight=investperst], cluster (IDStudy)


lincom  _cons + SEPCC*0 + lnobs*11.3 + IFrecursive*0.744 + ///
citations*4.164078 +firstpub*6.677419 + reviewed_journal*1 + ///
dummies*0 +  Hstatistic*0 + developed*0.3663594 + undeveloped*0.375576 + ///
Logit*0 + regulation*1 + quadratic*0 + Boone*1 + OLS*0

lincom  _cons + SEPCC*0 + lnobs*11.3 + IFrecursive*0.744 + ///
citations*4.164078 +firstpub*6.677419 + reviewed_journal*1  + dummies*0 + ///
Hstatistic*0 + developed*1+ Logit*0 +regulation*1 + quadratic*0 + ///
Boone*1 +OLS*0

lincom  _cons + SEPCC*0 + lnobs*11.3 + IFrecursive*0.744 + ///
citations*4.164078 +firstpub*6.677419 + reviewed_journal*1  + ///
dummies*0 +  Hstatistic*0 + undeveloped*1 + Logit*0 +regulation*1 + ///
quadratic*0 + Boone*1 +OLS*0

**//unweighted
ivreg2 PCC SEPCC  dummies Hstatistic developed undeveloped FE ///
lnobs ownership Logit SLS firstpub citations profitability ///
IFrecursive, cluster (IDStudy)

lincom _cons+SEPCC*0+dummies*0+Hstatistic*0+developed*0.3663594+ ///
undeveloped*0.375576+SLS*0.1488294+Logit*0+FE*0.229097+lnobs*11.3+ ///
IFrecursive*0.744+citations*4.164078+firstpub*6.453177+ ///
ownership*0.1655518+profitability*0.0434783

lincom _cons+SEPCC*0+dummies*0+Hstatistic*0+developed*1+SLS*0.1488294+ ///
Logit*0+FE*0.229097+lnobs*11.3+IFrecursive*0.744+citations*4.164078+ ///
firstpub*6.453177+ ownership*0.1655518+profitability*0.0434783

lincom _cons+SEPCC*0+dummies*0+Hstatistic*0+undeveloped*1+SLS*0.1488294+ ///
Logit*0+FE*0.229097+lnobs*11.3+IFrecursive*0.744+citations*4.164078+ ///
firstpub*6.453177+ ownership*0.1655518+profitability*0.0434783


**// Panel B - Re-coded data
**// weighted
**//variables as per Table 5
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep.dta"
set more off
gen double lnobs = ln(Samplesize)
xtset IDStudy
ivreg2 PCC SEPCC Hstatistic  Logit lnobs citations reviewed_journal firstpub ///
global developed undeveloped dummies RE quadratic DtoD Lerner sampleyear ///
ownership someAveraged [pweight=investperst], cluster (IDStudy)

lincom  _cons + SEPCC*0 + Hstatistic*0 + Logit*0 + lnobs*11.3+ citations*4.164078 + ///
reviewed_journal*1 + firstpub*6.677419 + global*0.7809053 + developed*0.2747882+ ///
dummies*0 + RE*0.0496213 + quadratic*0 + DtoD*0.0472383 + Lerner*0.4137677 + ///
sampleyear*9.739342 + ownership*0.2887069 + someAveraged*0.0562448 + undeveloped*0.2465438 

lincom  _cons + SEPCC*0 + Hstatistic*0 + Logit*0 + lnobs*11.3+ citations*4.164078 + ///
reviewed_journal*1 + firstpub*6.677419 + global*0.7809053 + developed*1+ ///
dummies*0 + RE*0.0496213 + quadratic*0 + DtoD*0.0472383 + Lerner*0.4137677 + ///
sampleyear*9.739342 + ownership*0.2887069 + someAveraged*0.0562448 + undeveloped*0

lincom  _cons + SEPCC*0 + Hstatistic*0 + Logit*0 + lnobs*11.3+ citations*4.164078 + ///
reviewed_journal*1 + firstpub*6.677419 + global*0.7809053 + developed*0+ ///
dummies*0 + RE*0.0496213 + quadratic*0 + DtoD*0.0472383 + Lerner*0.4137677 + ///
sampleyear*9.739342 + ownership*0.2887069 + someAveraged*0.0562448 + undeveloped*1


**//variable selection as per Table 8
ivreg2 PCC SEPCC dummies Hstatistic developed undeveloped SLS Logit FE RE OLS ///
endogeneity macro sampleyear lnobs ownership citations profitability ///
someAveraged, cluster (IDStudy)

lincom _cons+ SEPCC*0+dummies*0+Hstatistic*0+developed*0.2491639+ ///
undeveloped*0.2575251+SLS*0.1220736+Logit*0+FE*0.2508361+RE*0.0719064 + ///
OLS*0 + endogeneity*1 + macro*0.1705686 + sampleyear*9.252508+lnobs*11.3+ ///
ownership*0.1856187+ citations*4.164078+profitability*0.0434783 + ///
someAveraged*0.0267559

lincom _cons+ SEPCC*0+dummies*0+Hstatistic*0+developed*1+ ///
undeveloped*0+SLS*0.1220736+Logit*0+FE*0.2508361+RE*0.0719064 + ///
OLS*0 + endogeneity*1 + macro*0.1705686 + sampleyear*9.252508+lnobs*11.3+ ///
ownership*0.1856187+ citations*4.164078+profitability*0.0434783 + ///
someAveraged*0.0267559

lincom _cons+ SEPCC*0+dummies*0+Hstatistic*0+developed*0+ ///
undeveloped*1+SLS*0.1220736+Logit*0+FE*0.2508361+RE*0.0719064 + ///
OLS*0 + endogeneity*1 + macro*0.1705686 + sampleyear*9.252508+lnobs*11.3+ ///
ownership*0.1856187+ citations*4.164078+profitability*0.0434783 + ///
someAveraged*0.0267559


**// Panel C  -Re-coded data (variable selection as per Z&H )
**weighted
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep.dta"
set more off
gen double lnobs = ln(Samplesize)
xtset IDStudy
**//variable selection as per Z&H 
ivreg2 PCC SEPCC dummies Hstatistic developed undeveloped Logit lnobs ///
citations firstpub quadratic Boone IFrecursive regulation OLS ///
reviewed_journal [pweight=investperst], cluster (IDStudy)


lincom  _cons + SEPCC*0 + dummies*0 + Hstatistic*0 + developed*0.2747882 +  ///
undeveloped*0.2465438 + Logit*0 + lnobs*11.3 + citations*4.164078 + firstpub*6.677419 +  ///
quadratic*0 + Boone*1+ IFrecursive*0.744 + regulation*1 + OLS*0 + reviewed_journal*1

lincom  _cons + SEPCC*0 + dummies*0 + Hstatistic*0 + developed*1 +  ///
undeveloped*0 + Logit*0 + lnobs*11.3 + citations*4.164078 + firstpub*6.677419 +  ///
quadratic*0 + Boone*1+ IFrecursive*0.744 + regulation*1 + OLS*0 + reviewed_journal*1

lincom  _cons + SEPCC*0 + dummies*0 + Hstatistic*0 + developed*0 +  ///
undeveloped*1 + Logit*0 + lnobs*11.3 + citations*4.164078 + firstpub*6.677419 +  ///
quadratic*0 + Boone*1+ IFrecursive*0.744 + regulation*1 + OLS*0 + reviewed_journal*1

**Table 6-unweighted
**//variable selection as per Z&H 
ivreg2 PCC SEPCC  dummies Hstatistic developed undeveloped FE ///
lnobs ownership Logit SLS firstpub citations profitability ///
IFrecursive, cluster (IDStudy)

lincom _cons+SEPCC*0+dummies*0+Hstatistic*0+developed*0.2491639+ ///
undeveloped*0.2575251+SLS*0.1220736+Logit*0+FE*0.2508361+lnobs*11.3+ ///
IFrecursive*0.744+citations*4.164078+firstpub*6.406355+ ///
ownership*0.1856187+profitability*0.0434783

lincom _cons+SEPCC*0+dummies*0+Hstatistic*0+developed*1+ ///
undeveloped*0+SLS*0.1220736+Logit*0+FE*0.2508361+lnobs*11.3+ ///
IFrecursive*0.744+citations*4.164078+firstpub*6.406355+ ///
ownership*0.1856187+profitability*0.0434783

lincom _cons+SEPCC*0+dummies*0+Hstatistic*0+developed*0+ ///
undeveloped*1+SLS*0.1220736+Logit*0+FE*0.2508361+lnobs*11.3+ ///
IFrecursive*0.744+citations*4.164078+firstpub*6.406355+ ///
ownership*0.1856187+profitability*0.0434783
