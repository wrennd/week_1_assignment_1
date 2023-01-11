library(tidyverse)
library(haven)

nfhs <- read_dta("IAHR52FL.dta")

new_df <- nfhs %>%
  select(hhid:shstruc) %>%
  rename(survey_month = hv006) %>%
  filter(survey_month == 1) %>%
  mutate(rural = hv025 == 2)
glimpse(nfhs)

# histogram
ggplot(data = nfhs) +
  geom_histogram(mapping = aes(x = hv009),binwidth = 1) +
  xlab("Number of household members")

# Boxplot
new_df2 <- nfhs %>%
  select(hhid:hv208) %>%
  mutate(urban = hv025 == 1)

ggplot(nfhs, aes(x = hv026,
                 fill = hv026)) +
  geom_boxplot(fill = "#4271AE",
               outlier.colour = "red") +
  ggtitle("Boxplot: Urban Household sizes") +
  xlab("Number of Household Members") +
  ylab("Urban Area")
