library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99", "NA", " "))
weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

mean(weight)
mean(c(weight, 100500))

median(weight)
sort(weight)
median(c(weight, 100500))

mean(weight, trim = 0.1)
mean(c(weight, 100500), trim = 0.1)

heroes %>%
  count(`Eye color`, sort = TRUE)

diff(range(weight))
weight %>% range() %>% diff()
options(scipen = 999)
mean(weight - mean(weight))

sum((weight - mean(weight)) ^ 2)/(length(weight) - 1)
var(weight)

sqrt(sum((weight - mean(weight)) ^ 2)/(length(weight) - 1))
sd(weight)

c(scale(weight))
(weight - mean(weight))/sd(weight)
z <- function(x) (x - mean(x, na.rm = TRUE))/sd(x, na.rm = TRUE)
z(weight)
sd(weight)
sd(c(weight, 100500))

mad(weight)
median(abs(weight - median(weight))) * 1.4826

mad(weight)
mad(c(weight, 100500))
