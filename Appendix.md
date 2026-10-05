# Appendix: AI Prompts and Key Responses

> **AI Assistance Declaration**: I used Claude (Anthropic, Claude Opus 5.5, October 4, 2026) for ideation, layout suggestions, and writing assistance. Prompts used: the nine prompts recorded in this file. I verified outputs using GitHub's Markdown preview, knitting in RStudio, and a comparison with the tidyverse `dplyr` README. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

| Item    | Detail                          |
|:--------|:--------------------------------|
| Tool    | Claude (Anthropic)              |
| Version | Claude Opus 5.5                 |
| Date    | October 4, 2026                 |
| Author  | Zia Yousaf                      |

## Step 1: Understand Markdown Structure and Documentation Goals

### Prompt 1 (Seed)

> Explain what sections a good GitHub README for an R data analysis project should include.

**Key response (summary):** A strong README for an R analysis project usually includes a title with a one line description, an overview of the project's purpose, a description of the data, the repository structure, installation steps with package dependencies, usage or example code, a description of outputs or results, a license, and author or contact details. Optional sections include contributing guidelines, a roadmap, and acknowledgements.

### Prompt 2 (Refinement)

> Revise the sections list so it's concise and uses Markdown headers and bullet formatting.

**Key response (the README outline):**

```markdown
# Project Title

One line description of the project.

## Overview
- Purpose of the analysis
- Key steps in the workflow

## Repository Structure
- Folder and file layout

## Installation
- R version
- Required packages

## Example Code
- How to run the script
- How to knit the documentation

## Outputs
- Files the script creates

## Data
- Source and column descriptions

## License
- License type

## Author
- Name and course
```

### Prompt 3 (Critique/Validation)

> Check the Markdown syntax for correctness and readability.

**Key response (summary):** The syntax is valid. There is one H1, all sections use H2, and each header is followed by a blank line. Suggestions: keep a single list marker style throughout, and add a table of contents if the README grows past a screen in length.

### Verification check

Compared with the [`dplyr` README](https://github.com/tidyverse/dplyr) in the tidyverse, which uses Overview, Installation, Cheat Sheet, Usage, and Getting help.

| `dplyr` section | This project            | Decision                                         |
|:----------------|:------------------------|:-------------------------------------------------|
| Overview        | Overview                | Kept                                             |
| Installation    | Installation            | Kept, placed before the example code             |
| Usage           | Example Code            | Kept, named to match the assignment wording      |
| Cheat Sheet     | Not applicable          | Left out, the project is a single script         |
| Getting help    | Author                  | Simplified to author details                     |

Three common sections identified: **Overview**, **Installation**, and **Usage / Example Code**.

## Step 2: Generate an AI-Assisted Draft of the README

### Project summary given to the AI

> My R project is called markdown-buddy-ziayousaf. It simulates a synthetic retail sales dataset of 500 orders with set.seed(400), with columns for order ID, order date, region, category, units, and unit price. The script scripts/sales_summary.R cleans the data, calculates revenue, summarises orders, units, and revenue by region and category, creates a grouped bar chart, and saves a CSV and a PNG to an output folder. It depends on dplyr and ggplot2. A file called sales_summary.Rmd documents the script and needs rmarkdown and knitr.

### Prompt 4 (Seed)

> Here's a summary of my R project: [project summary above]. Generate a professional README.md file using Markdown.

**Key response (summary):** A first draft with a title, short description, Overview, Data, Usage, and Outputs sections. The data columns were presented in a table and the run command in a fenced code block.

### Prompt 5 (Refinement)

> Add sections for Installation, Example Code, and License. Keep tone concise and professional.

**Key response (summary):** Added an Installation section with a clone command and an `install.packages()` call, renamed Usage to Example Code with commands to source the script and knit the `.Rmd`, and added a License section pointing to an MIT `LICENSE` file. Wording was tightened to short bullet points.

### Prompt 6 (Critique/Validation)

> Review the Markdown for syntax errors and suggest 2 improvements for clarity.

**Key response (summary):** No syntax errors were found, with one caution: code blocks inside a numbered list must be indented three spaces so the list numbering continues. Two improvements were suggested:

1. Add a language tag to every fenced code block and add a repository structure tree with a table of contents so readers can navigate quickly.
2. Add an Outputs section so readers know what the example code produces.

**Action taken:** Both improvements were applied. See the final [README.md](README.md).

## Step 3: Document a Single R Script with R Markdown

### Script description given to the AI

> sales_summary.R takes no external input files. It has three settings: seed_value, n_orders, and output_dir. It simulates the sales data, cleans it, adds revenue and month columns, summarises by region and category, plots total revenue, and writes regional_summary.csv and revenue_by_region.png to the output folder.

### Prompt 7 (Seed)

> Here's my R script description. Suggest Markdown formatting and code block examples.

**Key response (summary):** Suggested a YAML header with title, author, date, and `html_document` output, one section per stage of the script, R code chunks for each stage, and tables for the settings and output files.

### Prompt 8 (Refinement)

> Add syntax highlighting and improve section organization (e.g., # Purpose, ## Inputs, ## Outputs).

**Key response (summary):** Reorganised the file into `# Purpose` with `## Inputs` and `## Outputs`, followed by `# Walkthrough`, `# How to Run`, and `# Session Information`. Added `highlight: tango` to the YAML header and a `bash` code block for the terminal command.

### Prompt 9 (Critique/Validation)

> Is the Markdown consistent with RMarkdown best practices?

**Key response (summary):** Mostly consistent. Recommended changes:

- Give every chunk a unique name so knitting errors are easy to trace.
- Add a `setup` chunk with `knitr::opts_chunk$set()` for global options.
- Set `eval=FALSE` on the package install chunk and the file saving chunk so knitting has no side effects.
- Use `knitr::kable()` for tables instead of printing raw data frames.
- End with `sessionInfo()` for reproducibility.

**Action taken:** All five recommendations were applied. See the final [sales_summary.Rmd](sales_summary.Rmd).

## Verification Summary

| File                | Check                                  | Method                            |
|:--------------------|:---------------------------------------|:----------------------------------|
| `README.md`         | Headers, lists, tables, code blocks    | GitHub preview                    |
| `README.md`         | Section structure                      | Compared with the `dplyr` README  |
| `sales_summary.Rmd` | Chunks run, tables and chart render    | Knit to HTML in RStudio           |
| `sales_summary.R`   | Script runs and writes both outputs    | Run in RStudio                    |
| All files           | Wording and accuracy                   | Self spot-check                   |
