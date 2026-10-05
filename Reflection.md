# Reflection

> **AI Assistance Declaration**: I used Claude (Anthropic, Claude Opus 5.5, October 4, 2026) for writing assistance and structure suggestions on this reflection. Prompts used: the nine prompts listed in [Appendix.md](Appendix.md). I verified outputs using my own review of the repository files, GitHub's Markdown preview, and the knitted `.Rmd`. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

**Course:** BDA400: Data Science Tools and Techniques
**Assignment:** Assignment 1, Markdown Buddy
**Author:** Zia Yousaf

## 1. How did AI support your documentation process, and what were its strengths?

AI was most useful at the start, when the page was blank. The seed prompt gave me a full list of README sections in seconds, and the refinement prompt turned that list into a short Markdown outline I could build on. That saved the time I would normally spend looking at several repositories just to decide on a structure.

Its second strength was consistency. Once the outline existed, the AI kept the same heading levels, list style, and table alignment across the README and the R Markdown file. It was also good at spotting small formatting gaps when asked directly. The critique prompt pointed out that code fences without a language tag do not get syntax highlighting on GitHub, and that a README with example code should say what that code produces. Both were quick fixes that made the final files noticeably cleaner.

For the `.Rmd`, the suggestion to organise the file as Purpose, Inputs, Outputs, then a step by step walkthrough gave the document a logical flow that matches how someone new to the script would read it.

## 2. What weaknesses or limitations did you find, and how did you verify and improve the output?

The first drafts were generic. The AI had no way of knowing my file names, my folder layout, or which packages I actually used, so it filled the gaps with standard wording that had to be replaced with real details. It also tended to include more sections than a small project needs, such as Contributing and Roadmap, which I removed.

The bigger limitation is that the AI cannot see how a file renders. A draft can look correct as plain text and still break in preview. For that reason I did not rely on the critique prompt alone and followed three checks:

- **Preview:** I checked `README.md` in GitHub's preview to confirm that headers, tables, nested code blocks inside the numbered list, and anchor links in the table of contents all rendered correctly.
- **Knit:** I knitted `sales_summary.Rmd` to HTML to confirm that every chunk ran without errors and that the tables and chart appeared.
- **Comparison:** I compared my structure with the `dplyr` README in the tidyverse, which uses Overview, Installation, Usage, and Getting help. This confirmed the core sections and led me to place Installation before Example Code.

The improvements that came out of this review are listed in the AI Assistance Disclosure at the bottom of the README. The main lesson is that AI output is a draft. It becomes documentation only after it has been checked against the real project and a real preview.

## 3. How did you apply ethical practices when using AI in this assignment?

I followed the AI usage rules for the course in four ways.

- **Disclosure:** Every file starts with the AI Assistance Declaration, the README ends with an AI Assistance Disclosure section, and `Appendix.md` records each prompt with the key response, along with the tool name, version, and date.
- **Validation:** Nothing was copied without checking. Each file was previewed or knitted, and the README structure was compared with a real tidyverse repository.
- **No AI computation:** AI was used for layout and wording only. Every number in the project is calculated by R when the script runs or the `.Rmd` is knitted. No results were typed in from an AI response.
- **Privacy:** The dataset is fully synthetic and is generated inside the script with a fixed seed. No real or personal data was shared with the AI tool.

I also think attribution matters beyond the rules of one assignment. On a real data science team, colleagues need to know which parts of the documentation were machine drafted so they know how much to trust them and where to look if something is wrong. Being open about AI use, and taking responsibility for the final result, is what makes it a professional tool rather than a shortcut.
