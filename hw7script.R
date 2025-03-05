library(dplyr)
library(tidyverse)
data(iris)
#question1
glimpse(iris)
#question2
iris1 <- iris%>%
  filter(Species %in% c("versicolor", "virginica"),Sepal.Length>6, Sepal.Width>2.5)
glimpse(iris1)
#question3
iris2 <- iris1%>%
  select(Species, Sepal.Length, Sepal.Width)
glimpse(iris2)
#question4
iris3 <- iris2 %>%
  arrange(desc(Sepal.Length))
head(iris3)
#question5
iris4 <- iris3 %>%
  mutate(Sepal.Area = Sepal.Length*Sepal.Width)
glimpse(iris4)
#question6
iris5 <- iris4 %>%
  summarise(Avg.Sepal.Length = mean(Sepal.Length), Avg.Sepal.Width=mean(Sepal.Width), Sample.Size= n())
print(iris5)
#question7
iris6 <- iris4 %>%
  group_by(Species) %>%
  summarise(Avg.Sepal.Length = mean(Sepal.Length), Avg.Sepal.Width=mean(Sepal.Width), Sample.Size= n())
print(iris6)
#question8
irisFinal <- iris %>%
  filter(Species %in% c("versicolor", "virginica"),Sepal.Length>6, Sepal.Width>2.5) %>%
  select(Species, Sepal.Length, Sepal.Width) %>%
  arrange(desc(Sepal.Length)) %>%
  mutate(Sepal.Area = Sepal.Length*Sepal.Width) %>%
  group_by(Species) %>%
  summarise(Avg.Sepal.Length = mean(Sepal.Length), Avg.Sepal.Width=mean(Sepal.Width), Sample.Size= n())
print(irisFinal)
#question9
longiris <- iris %>%
  pivot_longer(cols=1:4, names_to="Measure", values_to="Value")
head(longiris)
