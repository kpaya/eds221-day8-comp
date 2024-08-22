library("tidyverse")
library("patchwork")
library("here")

lizards <- read_csv(here("data_tidy", "lizards.csv"))

two_lizards<-lizards%>%
  filter(common_name %in% c("eastern fence", "western whiptail"))

ggplot(data=two_lizards, aes(x=total_length, y=weight))+
  geom_point(aes(color=common_name)) +
  scale_color_manual(values=c("orange","navy"),
                                                        name="Lizzard Species:",
                                                        labels=c("Eastern Fence Lizard",
                                                                 "Western Whiptail Lizard"))+ 
  theme(legend.position = c(0.2,0.9),legend.background = element_blank() )+labs(x="Total Length (mm)",y="weight(g)")

 

p2<-ggplot(data=two_lizards, aes(x=weight,y=site))+geom_boxplot()+labs(x="Weight", y="Site")

p3<-ggplot(data=lizards, aes(x=weight))+geom_histogram()+labs(x="Weight", y="Counts")

(p1+p2+p3 & theme_minimal())

ggsave("name.png",)
