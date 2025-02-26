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


heroes <- read.csv("data/heroes_information.csv")

read.table("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
           header = TRUE, sep = ",", quote = "\"")

heroes <- read.csv("data/heroes_information.csv",
         na.strings = c("-", "-99", "NA", " "))
mean(heroes$Height, na.rm = TRUE)
write.csv(heroes[heroes$Publisher == "DC Comics",], "data/dc_comics.csv", row.names = FALSE)

vroom::vroom("data/heroes_information.csv")

number <- -1
if (number > 0) {
  "Positive number"
} else {
  "Negative number or zero"
  }

number <- -2:2
if (number > 0) {
  "Positive number"
} else if (number < 0) {
  "Negative number"
} else {
  "Zero"
}

ifelse(number > 0,
       "Positive number",
       "Negative number or zero")

#ifelse(number > 0, TRUE, FALSE) #избыточная конструкция!
number > 0

ifelse(number > 0,
       "Positive number",
       ifelse(number < 0,
              "Negative number",
              "Zero"))

#install.packages("tidyverse")
dplyr::case_when(
  number > 0 ~ "Positive number", #if
  number < 0 ~ "Negative number", #else if
  .default = "zero" #else
)

heroes$weight_group <-  dplyr::case_when(
  is.na(heroes$Weight) ~ NA_character_,
  heroes$Weight > 300 ~ "very overweight",
  heroes$Weight > 150 ~ "overweight",
  heroes$Weight < 60  ~ "underweight",
  .default = "normal weight"
)
