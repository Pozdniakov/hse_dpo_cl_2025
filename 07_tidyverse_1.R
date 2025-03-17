library(tidyverse)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                       na = c("NA", "-", "-99", " "))

heroes %>%
  slice(c(10, 100, 700))

heroes %>%
  filter(Publisher == "DC Comics")

heroes %>%
  filter(Height > 150 & Height < 200)
heroes %>%
  filter(Height > 150, Height < 200)
heroes %>%
  filter(Height > 150) %>%
  filter(Height < 200)

heroes %>%
  slice_max(Weight, n = 10, with_ties = FALSE)

heroes %>%
  slice_min(Weight, n = 3)

heroes %>%
  slice_sample(n = 3)

heroes %>%
  slice_sample(prop = .01)

heroes %>%
  slice_sample(prop = 1)

heroes %>%
  drop_na()

heroes %>%
  drop_na(Height, Weight)

heroes %>%
  drop_na(where(is.numeric))

heroes %>%
  slice(100:110)

heroes %>%
  arrange(Weight)

heroes %>%
  arrange(-(Weight - mean(Weight, na.rm = TRUE))^2 ) 

heroes %>%
  arrange(desc(Weight))

heroes %>%
  arrange(desc(`Eye color`), Weight)
options(scipen = 999)
#heroes$imt <- heroes$Weight/(heroes$Height/100)^2
heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = name)

heroes %>%
  transmute(hero = name, Publisher, imt = Weight/(Height/100)^2)

heroes %>%
  mutate(weight_group = if_else(Weight >= 150, "overweight", "normal_weight"), .after = name)

heroes %>%
  mutate(weight_group = case_when(
    is.na(Weight) ~ NA_character_, #if
    Weight >= 200 ~ "very overweight", #else if
    Weight >= 150 ~ "overweight", #else if
    Weight <= 50 ~ "underweight", #else if
    .default = "normal weight" #else
  ))

heroes %>%
  summarise(mean(Weight, na.rm = TRUE))

heroes %>%
  drop_na(Weight) %>%
  summarise(mean_weight = mean(Weight),
            max_weight = max(Weight),
            first_weight = first(Weight),
            last_weight = last(Weight),
            tenth_weight = nth(Weight, n = 10))

heroes %>%
  drop_na(Weight) %>%
  reframe(range(Weight))


heroes %>%
  group_by(Gender) %>% str()

heroes %>%
  drop_na(Weight) %>%
  group_by(Gender) %>%
  summarise(mean_weight = mean(Weight),
            max_weight = max(Weight),
            first_weight = first(Weight),
            last_weight = last(Weight),
            tenth_weight = nth(Weight, n = 10),
            n = n())

heroes %>%
  group_by(Gender) %>%
  summarise(n = n())

heroes %>%
  summarise(mean_height = mean(Height, na.rm = TRUE), .by = Gender)

heroes %>%
  count(Gender, Alignment)

heroes %>%
  count(Race, sort = TRUE)

heroes %>%
  group_by(Gender) %>%
  mutate(mean_weight_by_group = mean(Weight, na.rm = TRUE)) %>%
  ungroup() %>%
  mutate(Weight_diff_to_gender_mean = Weight - mean_weight_by_group) %>%
  select(!c(`Eye color`:Alignment))

heroes %>%
  group_by(Race) %>%
  filter(n() >= 10)

heroes %>%
  group_by(Race) %>%
  filter(n() == 1)

heroes %>%
  distinct(`Eye color`, Alignment)

install.packages("janitor")

heroes %>%
  janitor::get_dupes(name)

heroes %>%
  group_by(name) %>%
  filter(n() > 1)

heroes %>%
  group_by(name) %>%
  slice(1)

list_of_tibbles <- heroes %>%
  group_by(Alignment, Gender) %>%
  summarise(mean_height = mean(Height, na.rm = TRUE)) %>%
  drop_na(Alignment) %>%
  ungroup() %>%
  split(.$Alignment)

dir("data")
dir.create("data/alignment")

list_of_tibbles %>%
  iwalk(function(x, idx) write_csv(x, paste0("data/alignment/", idx, ".csv") ))

dir("data/alignment", full.names = TRUE) %>%
  read_csv

dir("data/alignment", full.names = TRUE) %>%
  map(read_csv)

list_of_tibbles

bind_cols(list_of_tibbles)
bind_rows(list_of_tibbles, .id = "id")
bind_rows(list_of_tibbles)

band_members
band_instruments
bind_cols(band_members, band_instruments)

left_join(band_members, band_instruments)
band_members %>%
  left_join(band_instruments, by = "name")
band_instruments2
band_members %>%
  left_join(band_instruments2, by = join_by(name == artist))

band_members %>%
  right_join(band_instruments)

band_members %>%
  full_join(band_instruments)

band_members %>%
  inner_join(band_instruments)

band_members %>%
  filter(name %in% unique(band_instruments$name))

band_members %>%
  semi_join(band_instruments)

band_instruments %>%
  semi_join(band_members)

band_members %>%
  filter(!name %in% unique(band_instruments$name))

band_members %>%
  anti_join(band_instruments)

band_instruments %>%
  anti_join(band_members)
