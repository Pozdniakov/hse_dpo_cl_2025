library(tidyverse)

new_diet <- tribble(
  ~student, ~before_r_course, ~after_r_course,
  "Masha", 70, 63,
  "Roma", 80, 74,
  "Antonina", 86, 71
)

new_diet_long <- new_diet %>%
  pivot_longer(cols = before_r_course:after_r_course,
               names_to = "time",
               values_to = "weight")

new_diet_long %>%
  pivot_wider(names_from = time,
              values_from = weight)

new_diet_long
new_diet_long %>%
  group_by(time) %>%
  summarise(sum(weight))

new_diet_long %>%
  filter(time == "before_r_course") %>%
  pull(weight) %>%
  sum()

new_diet_long %>%
  arrange(desc(time)) %>%
  group_by(time) %>%
  mutate(cumsum_weight = cumsum(weight))

arranged_long <- new_diet_long %>%
  arrange(desc(time))

arranged_long$time[c(2, 3, 5, 6)] <- NA_character_
arranged_long %>%
  group_by(group_n = cumsum(!is.na(time))) %>%
  mutate(time_2 = first(time))

library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99", "NA", " "))
powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")

powers %>%
  pivot_longer(cols = !hero_names,
               names_to = "power",
               values_to = "has_power") %>%
  group_by(hero_names) %>%
  summarise(power_n = sum(has_power)) %>%
  arrange(desc(power_n))

heroes %>%
  drop_na(Weight, Height) %>%
  group_by(Gender) %>%
  summarise(mean_weight = mean(Weight),
            mean_height = mean(Height))

heroes %>%
  map(function(x) sum(is.na(x)))

heroes %>%
  #drop_na(Weight, Height) %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric), function(x) mean(x, na.rm = TRUE) ))

heroes %>%
  #drop_na(Weight, Height) %>%
  group_by(Gender) %>%
  summarise(across(where(is.character),
                   function(x) mean(nchar(x), na.rm = TRUE)),
            across(where(is.numeric), function(x) mean(x, na.rm = TRUE) ))

heroes %>%
  drop_na(Weight, Height) %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric),
                   list(minimum = min,
                        average = mean,
                        maximum = max,
                        na_n = function(x) sum(is.na(x)))))

heroes %>%
  mutate(across(where(is.character), as.factor))

iris %>%
  mutate(across(where(is.numeric), function(x) x / max(x) * 100 ))

iris %>%
  mutate(across(where(is.numeric), function(x) (x - mean(x))/sd(x)))


heroes %>%
  nest(!Gender) %>%
  mutate(dim = map(data, dim)) %>%
  select(!data) %>%
  unnest_wider(dim, names_sep = "_")

imdb <- tribble(
  ~film, ~genres,
  "Interstellar", "sci-fi, drama",
  "Inception", "sci-fi, fantasy, action",
  "Kill Bill", "action"
)

str_split(imdb$genres, pattern = ", ")

imdb %>%
  mutate(genres = genres %>% str_split(pattern = ", ")) %>%
  unnest()

imdb %>%
  separate_longer_delim(genres, delim = ", ") %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genres, values_from = value, values_fill = FALSE)

na_n <- function(x) sum(is.na(x))
na_n(letters)
na_n(c(NA, NA, 0))

heroes %>%
  group_by(Gender) %>%
  summarise(across(everything(), function(x) mean(is.na(x))))

heroes %>%
  group_by(Gender) %>%
  summarise(across(ends_with("color"), na_n))

which.max(c(20, 10, 50, 20, 50))

vec <- c("Hey", "Ho", "Let's", "goooo", NA)
vec[which.max(nchar(vec))]

longest <- function(x) x[which.max(nchar(x))]
longest(vec)
longest(LETTERS)

heroes %>%
  group_by(Gender) %>%
  summarise(across(where(is.character), longest))

heroes %>%
  mutate(across(c(Weight, Height), function(x) if_else(x > mean(x, na.rm = TRUE), "выше среднего", "ниже среднего") ))

heroes %>%
  group_by(Gender) %>%
  mutate(across(c(Weight, Height), 
                function(x) paste(if_else(x > mean(x, na.rm = TRUE),
                                          "выше среднего",
                                          "ниже среднего"),
                                  "по",
                                  Gender )))
 