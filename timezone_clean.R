#setwd ("D:/ssda job")
#install.packages("sjmisc")
library(sjmisc)
library(tidyverse)

ssda <- read.csv("ssda_tz_0.csv", header= T, na.strings=c(""," ","NA"))
ssda_tib <- as_tibble(ssda)
ssda_tib <- select(ssda_tib, followers_count, last_tweeted_at_GMT)
sum_followers <- sum(ssda_tib$followers_count)
ssda_tib <- ssda_tib %>%
mutate(last_tweeted_at_GMT= substr(last_tweeted_at_GMT,12,19)) %>%
mutate(last_tweeted_at_GMT= as.numeric(gsub(":", "", ssda_tib$last_tweeted_at_GMT))) %>%
mutate(fraction_of_followers= ssda_tib$followers_count/sum_followers)
ssda_tib <- na.omit(ssda_tib)
ssda_tib$bin= cut(ssda_tib$last_tweeted_at_GMT, c(000000, 010000,020000,030000,040000,050000,
                                                  060000,070000,080000,090000,100000,110000,
                                                  120000,130000, 140000, 150000, 160000,170000, 
                                                  180000, 190000, 200000, 210000, 220000, 230000, 
                                                  240000))       

ssda_tib %>% 
    group_by(bin) %>% 
    mutate(N=n()) %>%
    ungroup() %>% 
    filter(N==max(N))

ssda_tib %>%
    group_by(bin) %>%
    summarise(test_sum=sum(fraction_of_followers))
