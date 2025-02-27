
# data.table --------------------------------------------------------------

#install.packages("data.table")

library(data.table)

heroes_dt <- fread("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
      na = c("-", "-99", "NA"))
class(heroes_dt)
print
methods(print)
heroes_dt[Alignment == "good",
          .(mean_height = mean(Height, na.rm = TRUE)),
          by = Gender][order(-mean_height),]

# tidyverse ---------------------------------------------------------------
#install.packages("tidyverse")

library(tidyverse)

heroes_tbl <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
         na = c("NA", "-", "-99", " "))
heroes_tbl
heroes_tbl %>%
  filter(Alignment == "good") %>%
  group_by(Gender) %>%
  summarise(mean_height = mean(Height, na.rm = TRUE)) %>%
  arrange(desc(mean_height))

sum(log(abs(sin(1:22))))
1:22 %>% 
  sin() %>% 
  abs() %>% 
  log(2, base = .) %>% 
  sum()

1:22 |>
  sin() |>
  abs() |>
  log(2, base = _) |>
  sum()

B <- matrix(10:39, nrow = 5)
apply(B, 1, mean)
10:39 %>%
  matrix(nrow = 5) %>%
  apply(1, mean)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                       na = c("NA", "-", "-99", " "))
heroes %>%
  select(1, 3)

selected_columns <- heroes %>%
  select(name, Race, `Eye color`)
selected_columns
select(heroes, name, Race, `Eye color`)

heroes %>%
  select(name:Publisher)
heroes %>%
  select(name:`Eye color`, Publisher:Weight)
heroes %>%
  select(!...1)
heroes %>%
  select(!(Gender:Height))
heroes %>%
  select(name:last_col())
heroes %>%
  select(last_col())
heroes %>%
  select(name, Publisher, everything())

heroes %>%
  select(ends_with("color"))
heroes %>%
  select(starts_with("H"))
heroes %>%
  select(starts_with("H") & ends_with("color"))
heroes %>%
  select(contains("eigh"))
heroes %>%
  select(where(is.numeric))
heroes %>%
  select(where(function(x) !any(is.na(x)) ))

heroes %>%
  select(where(function(x) mean(is.na(x)) < .5  ))

heroes %>%
  select(id = ...1)

heroes %>%
  rename(id = ...1)

names(heroes) %>% str_to_lower()
names(heroes) %>% str_to_upper()
#names(heroes) <- names(heroes) %>% make.names()
heroes %>%
  rename_with(make.names)

heroes %>%
  relocate(Publisher)
heroes %>%
  relocate(name, ends_with("color"), where(is.numeric))
heroes %>%
  relocate(Publisher, where(is.numeric), .after = name)
heroes %>%
  relocate(Universe = Publisher, where(is.numeric), .before = name)

mtcars$mpg
mtcars[,1, drop = FALSE]

heroes %>%
  select(Height) %>%
  pull()

heroes %>%
  pull(Height)

heroes %>%
  pull(Height, name)

powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")
powers
