install.packages("tidytuesdayR")
library(tidytuesdayR)
tuesdata <- tidytuesdayR::tt_load('2025-04-01')
pokedata <- tuesdata$pokemon_df
library(ggridges)
library(ggplot2)
library(viridis)
library(hrbrthemes)
library(ggthemes)
library(patchwork)

#graph 1: violin
type <- pokedata$type_1
height <- pokedata$height

violin <- ggplot(data=pokedata, aes(x=type, y=height, fill=type)) + geom_violin()+ geom_point(position=position_jitter(width=0.2, height=0.3), color='black',size=0.69) + labs(title='Height versus Pokemon type', x='Pokemon Type', y='Height')
print(violin)

#graph 2: hex 2d density
attk <- pokedata$attack
dfns <- pokedata$defense

hex <- ggplot(data=pokedata, aes(x=attk, y=dfns) ) +
  geom_hex(bins=25) + scale_fill_continuous(type = "viridis") +
  theme_economist() + labs(title='Attack versus Defense Stats of all Pokemon', x="Attack Stat", y='Defense Stat')
print(hex)

#graph 3: beeswarm
gen <- pokedata$generation_id
hp <- pokedata$hp

beeswarm <- ggplot(data=pokedata) + aes(x=gen,y=hp,color=gen) + ggbeeswarm::geom_beeswarm(size=2) + labs(title='HP variation within Pokemon generations', x= 'Generation', y='HP')
print(beeswarm)


#graph 4: ridgeline
xp <- pokedata$base_experience

ridge <- ggplot(data=pokedata) + aes(x=xp, y=type, fill=type) + ggridges::geom_density_ridges() + ggridges::theme_ridges() + labs(title='Average starting experience (XP) per Pokemon type', x='XP', y='Pokemon Type')
print(ridge)
