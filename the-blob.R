# import packages ----
library(tidyverse)

# load data ----
temp_data <- read_csv(here::here("sci_temps.csv"))

# calculate mean temp by day ----
temp_summary <- temp_data |> 
  group_by(year, doy) |> 
  summarize(mean_temp = mean(temp_c)) 

# plot data ---
ggplot(temp_by_day_sci, aes(x = doy, y = mean_temp, group = year)) + 
  geom_line(alpha = 0.75, linewidth = 0.75) +
  gghighlight::gghighlight(year == 2015) +
  labs(
    x = "Day of Year",
    y = "Temperature (°C)"
  ) +
  theme_minimal()
