# SPACER Diagnostic Workflow

This is a Quarto workflow for a worked example based on SPACER, the parallel dataset of speech-production repairs and offline comprehender corrections.

The workflow asks whether speaker-side self-repair and comprehender-side correction have aligned correction profiles. The philosophical target is not automatic detection of homeostasis. It is a disciplined ladder report: projection target, perturbation, tracked relation, response pathway, higher-scale relation, and warranted rung.

## Render

From this directory:

```bash
quarto render
```

The first render downloads the public SPACER CSV files from the project repository into `data/raw/`. Derived files and cached model objects are written to `data/processed/`.

## Bayesian model

The default render fits a fast joint mixed model with `lme4`. The Bayesian `brms` model is included as a heavier analysis path in `04-fit-joint-model.qmd`; set the document parameter `fit_bayes: true` before rendering that page if the local Stan backend is configured.

## Reproducibility

Use `renv::init()`, `renv::install()`, and `renv::snapshot()` from this directory if this workflow becomes a standalone project. The `DESCRIPTION` file declares the expected R packages.
