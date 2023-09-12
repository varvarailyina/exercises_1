# Set-up your script ------------------------------------------------------

# install.packages(c("tidyverse", "gapminder", "pacman")) # uncomment if already installed
pacman::p_load(tidyverse, gapminder)


# Load your Data into R ---------------------------------------------------

data(gapminder)
head(gapminder)



# Clean your Data ---------------------------------------------------------

gapminder_clean <- gapminder %>% 
  rename(life_exp = lifeExp, gdp_per_cap = gdpPercap) %>% 
  mutate(gdp = pop * gdp_per_cap)


## look at levels of continents
unique(gapminder$continent)


## calculate average gdp per capita
avg_gdp <- mean(gapminder_clean$gdp_per_cap)


## exercise ii
gapminder_clean <- gapminder_clean %>%
  filter(continent == "Americas") %>%
  mutate(rich_country = ifelse(gdp_per_cap > avg_gdp, 1, 0))
