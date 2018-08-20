*********************************************************************************************
**// Table 2.11 - Pairwise Correlations for the Three Competition Variables and Concentration
*********************************************************************************************
clear
set more off
use "\\file\UsersS$\sba144\Home\Desktop\Chapter One\\Chapter-do\TABLE11.dta", replace
summ Ha if year >=2010
summ Lerner Boone conav
pwcorr Ha Lerner if year>=2010, sig obs
pwcorr Ha Boone if year>=2010, sig obs
pwcorr Ha conav if year>=2010, sig obs
pwcorr Lerner Boone, sig obs
pwcorr Lerner conav, sig obs
pwcorr Boone conav, sig obs
pwcorr Lerner conav if year>=2010, sig obs
pwcorr Boone conav if year>=2010, sig obs
