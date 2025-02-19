installed.packages(priority = "base")
install.packages("beepr")
library(beepr)
beep(3)
beep()
beepr::beep_on_error(beep(3))

if(!require(devtools)) {install.packages("devtools")}
devtools::install_github("brooke-watson/BRRR", force = TRUE)
BRRR::skrrrahh(2)

read.csv("heroes_information.csv")
getwd()
