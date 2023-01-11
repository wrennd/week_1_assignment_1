library(tidyverse)
library(haven)

nfhs <- read_dta("IAHR52FL.dta")

# New data frame; limited variables
new_df <- nfhs %>%
  select(hhid:shstruc)

# histogram utilizing entire sample
ggplot(data = nfhs) +
  geom_histogram(mapping = aes(x = hv009),binwidth = 1) +
  xlab("Number of household members")

new_df %>%
  group_by(rural) %>%
  count()

# Convert labelled vector to a factor
new_df2$hv026 <- haven::as_factor(new_df2$hv026)

# New data frame: only urban households
new_df2 <- nfhs %>%
  select(hhid:hv208) %>%
  filter(hv025 == 1) %>%
  mutate(urban = hv025 == 1)

# Boxplot: Urban area type to number of household members
ggplot(data = new_df2, mapping = aes(hv026,
                                     hv009)) +
  geom_boxplot(mapping = aes(group = cut_width(hv026, 1)),
               outlier.colour = "red") +
  ggtitle("Number of Household Members by Urban Area Type") +
  labs(x = "Urban area type", y = "Number of household members")

# Urban areas mean household sizes
new_df2 %>%
  group_by(hv026) %>%
  summarise(mean(hv009))
  
