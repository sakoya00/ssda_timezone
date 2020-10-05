#Histogram visualization after cleaning data with R and Excel
ssda2 <- read.csv("ssda_weight.csv")

ssda2 <- ssda2 %>%
         ggplot (aes(x=bin, y= adjusted_weight))+
         geom_point()+
         scale_x_continuous(breaks = scales::pretty_breaks(n =23))
