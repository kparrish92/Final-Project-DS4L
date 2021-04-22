library(tidyverse)
library(tibble)
library(dplyr)

#Gen 1 - Frequent - Male

Proficiency_Gen1_Male_Freq=tibble(Proficiency=rnorm(29, 96, 1.8)) %>% 
                                    mutate(Gender="male", Frequency_CS="1", Generation="1")


#Gen 1 - Frequent - Female

Proficiency_Gen1_Female_Freq=tibble(Proficiency=rnorm(23, 96.5, 1.88)) %>% 
  mutate(Gender="female", Frequency_CS="1", Generation="1")


#Gen 1 - Infrequent - Male

Proficiency_Gen1_Male_Infreq=tibble(Proficiency=rnorm(32, 97, .98)) %>% 
  mutate(Gender="male", Frequency_CS="0", Generation="1")


#Gen 1 - Infrequent - Female

Proficiency_Gen1_Female_Infreq=tibble(Proficiency=rnorm(18, 98, .36)) %>% 
  mutate(Gender="female", Frequency_CS="0", Generation="1")




#Gen 2 - Frequent - Male

Proficiency_Gen2_Male_Freq=tibble(Proficiency=rnorm(42, 82, 1.65)) %>% 
  mutate(Gender="male", Frequency_CS="1", Generation="2")


#Gen 2 - Frequent - Female

Proficiency_Gen2_Female_Freq=tibble(Proficiency=rnorm(23, 89, 2.88)) %>% 
  mutate(Gender="female", Frequency_CS="1", Generation="2")


#Gen 2 - Infrequent - Male

Proficiency_Gen2_Male_Infreq=tibble(Proficiency=rnorm(12, 80, 3.4)) %>% 
  mutate(Gender="male", Frequency_CS="0", Generation="2")


#Gen 2 - Infrequent - Female

Proficiency_Gen2_Female_Infreq=tibble(Proficiency=rnorm(8, 89, .36)) %>% 
  mutate(Gender="female", Frequency_CS="0", Generation="2")


#Now, let's put this fake data together!

fake_data = rbind(Proficiency_Gen1_Female_Freq, Proficiency_Gen1_Female_Infreq, 
                  Proficiency_Gen1_Male_Freq, Proficiency_Gen1_Male_Infreq, 
                  Proficiency_Gen2_Female_Freq, Proficiency_Gen2_Female_Infreq, 
                  Proficiency_Gen2_Male_Freq, Proficiency_Gen2_Male_Infreq)


#Now, let's save the dataset.

fake_data%>%
  write.csv(.,"./Data/Data_Raw/Dataset_Raw.csv")