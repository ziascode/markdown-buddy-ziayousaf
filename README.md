# markdown-buddy-ziayousaf

> **AI Assistance Declaration**: I used Claude (Anthropic, Claude Opus 5.5, October 4, 2026) for ideation, layout suggestions, and writing assistance on this README. Prompts used: "Here's a summary of my R project: [project summary]. Generate a professional README.md file using Markdown."; "Add sections for Installation, Example Code, and License. Keep tone concise and professional."; "Review the Markdown for syntax errors and suggest 2 improvements for clarity." (full text and responses are in [Appendix.md](Appendix.md)). I verified outputs using GitHub's Markdown preview, a comparison with the tidyverse `dplyr` README, and by running the example code in RStudio. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

![R](https://img.shields.io/badge/R-4.1%2B-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-green)

A small, reproducible R project that simulates synthetic retail sales data and summarises revenue by region and product category. Built for **BDA400: Data Science Tools and Techniques, Assignment 1 (Markdown Buddy)**.

## Table of Contents

- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Installation](#installation)
- [Example Code](#example-code)
- [Outputs](#outputs)
- [Data](#data)
- [Documentation](#documentation)
- [License](#license)
- [Author](#author)
- [AI Assistance Disclosure](#ai-assistance-disclosure)

## Overview

The project shows a clean, well documented analytics workflow in R:

- Simulates 500 synthetic retail orders with a fixed random seed.
- Cleans the data and calculates revenue per order.
- Summarises orders, units, and revenue by region and category.
- Produces a grouped bar chart of total revenue.
- Documents the script step by step in R Markdown.

## Repository Structure

```text
markdown-buddy-ziayousaf/
├── README.md              # Project overview (this file)
├── sales_summary.Rmd      # R Markdown documentation of the script
├── Reflection.md          # Responses to the reflection questions
├── Appendix.md            # AI prompts and key responses
├── LICENSE                # MIT License
├── .gitignore
└── scripts/
    └── sales_summary.R    # Analysis script
```

## Installation

**Requirements:** R 4.1 or later (the script uses the native pipe `|>`). RStudio or Posit Cloud is recommended.

1. Clone the repository:

   ```bash
   git clone https://github.com/ziascode/markdown-buddy-ziayousaf.git
   cd markdown-buddy-ziayousaf
   ```

2. Install the required packages from the R console:

   ```r
   install.packages(c("dplyr", "ggplot2", "rmarkdown", "knitr"))
   ```

| Package     | Used for                              |
|:------------|:--------------------------------------|
| `dplyr`     | Data cleaning and summarising         |
| `ggplot2`   | Charting                              |
| `rmarkdown` | Knitting `sales_summary.Rmd`          |
| `knitr`     | Formatted tables in the knitted file  |

## Example Code

Run the full analysis from the project root:

```r
source("scripts/sales_summary.R")
```

Knit the script documentation to HTML:

```r
rmarkdown::render("sales_summary.Rmd")
```

The core of the analysis is a single grouped summary:

```r
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
```

## Outputs

Running the script creates an `output/` folder containing:

| File                    | Description                                              |
|:------------------------|:---------------------------------------------------------|
| `regional_summary.csv`  | Orders, units, revenue, and average order value by group |
| `revenue_by_region.png` | Grouped bar chart of total revenue by region             |

The `output/` folder is listed in `.gitignore` because both files can be regenerated at any time.

## Data

All data is **synthetic**. It is generated inside the script with `set.seed(400)`, so results are identical on every run. No real or personal data is used anywhere in this project.

| Column       | Description                                 |
|:-------------|:--------------------------------------------|
| `order_id`   | Sequential order number                     |
| `order_date` | Random date in 2025                         |
| `region`     | East, West, North, or South                 |
| `category`   | Electronics, Home, or Clothing              |
| `units`      | Units ordered (1 to 10)                     |
| `unit_price` | Price per unit in dollars (5.00 to 120.00)  |

## Documentation

- [sales_summary.Rmd](sales_summary.Rmd): purpose, inputs, outputs, and a step by step walkthrough of the script.
- [Reflection.md](Reflection.md): reflection on the AI-assisted documentation workflow.
- [Appendix.md](Appendix.md): all prompts and key AI responses.

## License

This project is released under the [MIT License](LICENSE).

## Author

**Zia Yousaf**
BDA400: Data Science Tools and Techniques

## AI Assistance Disclosure

**Tool used**

- Claude (Anthropic), model Claude Opus 5.5, used on October 4, 2026.

**Main prompts**

1. "Explain what sections a good GitHub README for an R data analysis project should include."
2. "Revise the sections list so it's concise and uses Markdown headers and bullet formatting."
3. "Check the Markdown syntax for correctness and readability."
4. "Here's a summary of my R project: [project summary]. Generate a professional README.md file using Markdown."
5. "Add sections for Installation, Example Code, and License. Keep tone concise and professional."
6. "Review the Markdown for syntax errors and suggest 2 improvements for clarity."
7. "Here's my R script description. Suggest Markdown formatting and code block examples."
8. "Add syntax highlighting and improve section organization (e.g., # Purpose, ## Inputs, ## Outputs)."
9. "Is the Markdown consistent with RMarkdown best practices?"

**Changes made after reviewing the outputs**

- Added a table of contents and a repository structure tree so the layout is clear at a glance.
- Added a language tag (`r`, `bash`, `text`) to every fenced code block so syntax highlighting renders on GitHub.
- Added an Outputs section so readers know what the example code produces.
- Replaced generic placeholder wording with the actual file names, packages, and settings used in this repository.
- Stated the minimum R version (4.1) because the script uses the native pipe.
- Compared the section order with the `dplyr` README and moved Installation ahead of Example Code to match.
- In the `.Rmd`, named every code chunk, added a setup chunk with global options, and set `eval=FALSE` on the install and save chunks.

AI was used as a writing and layout assistant only. All code was run and all results were produced directly in R. Full prompts and key responses are in [Appendix.md](Appendix.md).
