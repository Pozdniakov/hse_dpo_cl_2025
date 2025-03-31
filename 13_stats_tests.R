library(tidyverse)
diet <- readr::read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")
diet1 <- diet %>%
  filter(Diet == 1)
diet1 
options(scipen = 999)
t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99", "NA", " "))
t.test(heroes$Weight, mu = 100)

diet2 <- diet %>%
  filter(Diet == 2)
t.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)
diet12 <- diet %>%
  filter(Diet %in% 1:2)
t.test(weight6weeks ~ Diet, data = diet12, paired = FALSE)
t.test(diet12$weight6weeks ~ diet12$Diet, paired = FALSE, var.equal = TRUE)
diet %>%
  group_by(Diet) %>%
  summarise(sd(weight6weeks))

diet13 <- diet %>%
  filter(Diet %in% c(1, 3))
t.test(weight6weeks ~ Diet, data = diet13, paired = FALSE)

shapiro.test(samp)
shapiro.test(rlnorm(700))
shapiro.test(diet1$weight6weeks)
hist(samp)
hist(diet1$weight6weeks)
length(diet1$weight6weeks)
hist(rnorm(length(diet1$weight6weeks)))
qqnorm(diet1$weight6weeks)
qqnorm(rlnorm(length(diet1$weight6weeks)))
qqnorm(rnorm(length(diet1$weight6weeks)))

t.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)
wilcox.test(diet2$pre.weight, diet2$weight6weeks, paired = TRUE)

t.test(weight6weeks ~ Diet, data = diet12, paired = FALSE)
wilcox.test(weight6weeks ~ Diet, data = diet12, paired = FALSE)
