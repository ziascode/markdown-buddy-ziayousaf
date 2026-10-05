# sales_summary.R
# Author: Zia Yousaf
# Purpose: Generate a synthetic retail sales dataset, summarise revenue by
#          region and product category, and save a summary table and chart.
# Inputs:  None (data is simulated in the script with a fixed seed).
# Outputs: output/regional_summary.csv, output/revenue_by_region.png

library(dplyr)
library(ggplot2)

# ---- Settings ---------------------------------------------------------------
seed_value <- 400
n_orders   <- 500
output_dir <- "output"

# ---- 1. Simulate the synthetic dataset --------------------------------------
set.seed(seed_value)

sales <- tibble(
  order_id   = seq_len(n_orders),
  order_date = sample(
    seq(as.Date("2025-01-01"), as.Date("2025-12-31"), by = "day"),
    n_orders,
    replace = TRUE
  ),
  region     = sample(c("East", "West", "North", "South"), n_orders, replace = TRUE),
  category   = sample(c("Electronics", "Home", "Clothing"), n_orders, replace = TRUE),
  units      = sample(1:10, n_orders, replace = TRUE),
  unit_price = round(runif(n_orders, min = 5, max = 120), 2)
)

# ---- 2. Clean and prepare ---------------------------------------------------
sales_clean <- sales |>
  filter(!is.na(units), !is.na(unit_price)) |>
  mutate(
    revenue = units * unit_price,
    month   = format(order_date, "%Y-%m")
  )

# ---- 3. Summarise -----------------------------------------------------------
regional_summary <- sales_clean |>
  group_by(region, category) |>
  summarise(
    orders          = n(),
    total_units     = sum(units),
    total_revenue   = sum(revenue),
    avg_order_value = mean(revenue),
    .groups = "drop"
  ) |>
  arrange(region, desc(total_revenue))

# ---- 4. Visualise -----------------------------------------------------------
revenue_plot <- ggplot(
  regional_summary,
  aes(x = region, y = total_revenue, fill = category)
) +
  geom_col(position = "dodge") +
  labs(
    title = "Total Revenue by Region and Category",
    subtitle = "Synthetic retail sales data",
    x = "Region",
    y = "Total revenue ($)",
    fill = "Category"
  ) +
  theme_minimal()

# ---- 5. Save outputs --------------------------------------------------------
dir.create(output_dir, showWarnings = FALSE)

write.csv(
  regional_summary,
  file.path(output_dir, "regional_summary.csv"),
  row.names = FALSE
)

ggsave(
  file.path(output_dir, "revenue_by_region.png"),
  plot = revenue_plot,
  width = 8,
  height = 5,
  dpi = 150
)
