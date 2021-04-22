library(tidyverse)
library(tibble)
library(dplyr)


#I am going to simulate the data for this project! 
#Let's start with HIGH Frequency participants.

#Male-identifying participants
Years_male_H=tibble(Years=rnorm(25, 34, 3))

Male_Frequent=tibble(Age=rnorm(25, 38, 2.5)) %>% 
  mutate(Gender="Male",Frequency_CS="1", Years_male_H)

#Female-identifying participants
Years_female_H=tibble(Years=rnorm(29, 22, 1.8))

Female_Frequent=tibble(Age=rnorm(29, 42, 1.5)) %>% 
  mutate(Gender="Female",Frequency_CS="1", Years_female_H)

#Let's continue with LOW Frequency Participants.

#Male-identifying participants
Years_male_L=tibble(Years=rnorm(32, 22, 5.6))

Male_Infrequent=tibble(Age=rnorm(32, 45, 1.5)) %>% 
  mutate(Gender="Male",Frequency_CS="0", Years_male_L)

#Female-identifying participants
Years_female_L=tibble(Years=rnorm(45, 38, 1.8))

Female_Infrequent=tibble(Age=rnorm(45, 25, 1.75)) %>% 
  mutate(Gender="Female",Frequency_CS="0", Years_female_L)


#Now, let's put this fake data together!

fake_data = rbind(Male_Frequent,Female_Frequent, Male_Infrequent, Female_Infrequent)

#Now, let's save the dataset.

fake_data%>%
  write.csv(.,"./Data/Data_Raw/Dataset_Raw.csv")
