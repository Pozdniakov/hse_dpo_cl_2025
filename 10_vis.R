library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99", "NA", " "))
weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

install.packages("psych")
psych::skew(weight)
psych::kurtosi(weight)

summary(weight)
weight
summary(heroes)
psych::describe(weight)

heroes %>%
  group_by(Gender, Alignment) %>%
  summarise(psych::describe(Weight))

install.packages("skimr")
skimr::skim(weight)

heroes %>%
  group_by(Gender) %>%
  skimr::skim(ends_with("color"))

xxx
mean(xxx$x)
mean(xxx$y)
var(xxx$x)
var(xxx$y)
psych::skew(xxx$x)
psych::skew(xxx$y)
psych::kurtosi(xxx$x)
psych::kurtosi(xxx$y)
psych::describe(xxx)
cor(xxx$x, xxx$y)

plot(xxx)
plot(xxx$y, xxx$x)

plot(heroes$Height, heroes$Weight)
plot(heroes$Weight)
iris %>%
  select(!Species) %>%
  plot()
plot(iris)

methods(plot)

hist(weight, breaks = 100)
boxplot(weight)
boxplot(Weight ~ Gender, data = heroes)

gg <- ggplot()
ggplot() +
  geom_point(data = heroes, aes(x = Height,
                                y = Weight,
                                colour = Gender))
  
ggplot() +
  geom_point(data = heroes, aes(x = Height,
                                y = Weight),
             colour = "#994120", size = 4, shape = "💔")

ggplot() +
  geom_point(data = heroes, aes(x = Height,
                                y = Weight),
             colour = "#994120", size = 4, shape = 20, alpha = .3) +
  coord_trans(x = "log", y = "log")

ggplot() +
  geom_point(data = heroes, aes(x = Height,
                                y = Weight),
             colour = "#994120", size = 4, shape = 20, alpha = .3) +
  facet_wrap(Alignment~Gender, scales = "free_y")

heroes %>%
  count(Gender)
ggplot() +
  geom_bar(data = heroes, aes(x = Gender))
ggplot() +
  geom_bar(data = heroes %>% count(Gender),
           aes(x = Gender, y = n),
           stat = "identity")

ggplot() +
  geom_point(data = heroes,
             size = 3,
             aes(x = Gender, y = Weight),
             alpha = .3,
             position = position_jitter(height = 0, width = .25))

ggplot() +
  geom_bar(data = heroes, aes(x = Gender, fill = Alignment),
           position = position_fill(), alpha = .3) +
  coord_flip()

ggplot(data = heroes, aes(x = Gender, y = Weight)) +
  geom_point(size = 3,
             alpha = .3,
             position = position_jitter(height = 0, width = .25)) +
  geom_violin() +
  geom_boxplot(outlier.shape = NA, colour = "#C363B1",
               width = .2)

ggplot(data = iris, aes(x = Species, y = Petal.Length)) +
  geom_point(size = 3,
             alpha = .3,
             position = position_jitter(height = 0, width = .25)) +
  geom_violin(aes(fill = Species)) +
  geom_boxplot(outlier.shape = NA,
               width = .15) +
  scale_y_log10()

ggplot() +
  geom_bar(data = heroes, aes(x = "", fill = Alignment)) +
  coord_polar(theta = "y")

skimr::skim(heroes)
heroes %>%
  mutate(`Eye color` = `Eye color` %>% fct_infreq() %>% fct_lump_n(n = 10)) %>%
  ggplot(aes(x = `Eye color`, fill = Alignment)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1") +
  #facet_wrap(~Gender, ncol = 1) +
  labs(title = "Superhero eye colours",
       subtitle = "They have diifferent eye colours",
       y = "number of eyes divided by 2",
       fill = "GOOD OR BAD") +
  hrbrthemes::theme_ipsum()


