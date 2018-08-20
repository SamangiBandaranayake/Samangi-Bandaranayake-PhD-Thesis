**************
**// Table 3.4
**************
**// Panel A-(Z&H)
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\Z&Hcompetition.dta"
set more off
gen double lnobs = ln(Samplesize)
sum PCC SEPCC lnobs T sampleyear developed undeveloped mixed quadratic ///
endogeneity macro someAveraged dummies NPL Zscore profit_volat profitability  ///
capitalization DtoD other_stability Hstatistic Boone Concentration Lerner HHI ///
other_competition Logit OLS FE RE GMM SLS other_method regulation ownership ///
global citations firstpub  IFrecursive reviewed_journal    

sum PCC SEPCC lnobs T sampleyear developed undeveloped mixed quadratic ///
endogeneity macro someAveraged dummies NPL Zscore profit_volat profitability  ///
capitalization DtoD other_stability Hstatistic Boone Concentration Lerner HHI ///
other_competition Logit OLS FE RE GMM SLS other_method regulation ownership ///
global citations firstpub  IFrecursive reviewed_journal [aweight=investperst]       



**// Panel B - Re-coded data
clear
use "\\file\UsersS$\sba144\Home\Desktop\Chapter Two\598_Rep.dta"
set more off
gen double lnobs = ln(Samplesize)
sum PCC SEPCC lnobs T sampleyear developed undeveloped mixed quadratic ///
endogeneity macro someAveraged dummies NPL Zscore profit_volat profitability  ///
capitalization DtoD other_stability Hstatistic Boone Concentration Lerner HHI ///
other_competition Logit OLS FE RE GMM SLS other_method regulation ownership ///
global citations firstpub  IFrecursive reviewed_journal 

sum PCC SEPCC lnobs T sampleyear developed undeveloped mixed quadratic ///
endogeneity macro someAveraged dummies NPL Zscore profit_volat profitability  ///
capitalization DtoD other_stability Hstatistic Boone Concentration Lerner HHI ///
other_competition Logit OLS FE RE GMM SLS other_method regulation ownership ///
global citations firstpub  IFrecursive reviewed_journal [aweight=investperst]

