#setwd ("D:/ssda job")
library(tidyverse)

ssda <- read.csv("ssda_tz_0.csv", header= T)
ssda_tib <- as_tibble(ssda)
ssda_tib <- select(ssda_tib, followers_count, last_tweeted_at_GMT)
ssda_tib <- ssda_tib %>%
mutate(last_tweeted_at_GMT= substr(last_tweeted_at_GMT,12,19))
