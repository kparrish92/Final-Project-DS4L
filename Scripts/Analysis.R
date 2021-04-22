Data<-read.csv("./Data/Data_Raw/Dataset_Raw.csv")

library(tidyverse)

#Descriptive Stats

Descriptive<-Data%>% 
  group_by(Generation) %>% 
  summarize(mean_Proficiency=mean(Proficiency), sd_Proficiency=sd(Proficiency),
            range_Proficiency=range(Proficiency))

#Plots

Data %>% 
  ggplot(.,aes(x=Proficiency , y = Frequency_CS, color = Gender)) +
  facet_grid(.~Generation)+
  geom_smooth(method= "glm", method.args=list(family="binomial"))


# Fitting models

mod_null<- glm(Frequency_CS ~ 1, family= binomial(link="logit"), data = Data)
mod_generation<-glm(Frequency_CS ~ 1 + factor(Generation), family= binomial(link="logit"), data = Data)
mod_proficiency<- glm(Frequency_CS ~ 1 + Proficiency, family= binomial(link="logit"), data = Data)
mod_gender<- glm(Frequency_CS ~ 1 + Proficiency + Gender, family= binomial(link="logit"), data = Data)
mod_int<-glm(Frequency_CS ~ 1 + Proficiency*Gender,family= binomial(link="logit"), data = Data)

anova(mod_null,mod_proficiency, mod_gender, test="Chisq")


summary(mod_null)
mean(Data$Frequency_CS)
summary(mod_proficiency)
summary(mod_gender)
