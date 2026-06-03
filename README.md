# Not every stable cluster is homeostatic

Working repository for Brett Reynolds's short philosophy-of-science paper:

> Not every stable cluster is homeostatic: Stability, network order, and control in projectible kinds

## Project

The paper uses Naftali Weinberger's 2026 account of homeostasis as causal control to sharpen how Boydian homeostatic property cluster theory should separate stability, network order, and corrective control.

Working thesis: projectibility is the epistemic target; stable co-occurrence, network order, and corrective control are different ways to secure it; strict homeostasis should be reserved for feedback-sensitive control under perturbation.

## Build

This project uses XeLaTeX and Biber:

```bash
make
```

Do not use LuaLaTeX; it can damage the PDF text layer.

## Supplementary analysis

The SPACER diagnostic workflow is published at:

<https://brettrey.github.io/not-every-stable-cluster-is-homeostatic/>

Source lives in `analysis/spacer-diagnostic/`. The workflow downloads the public SPACER data from the original project repository rather than vendoring the raw data here.

## Source Policy

The repo does not vendor article PDFs. Source PDFs and markdown extracts are kept in the portfolio-level `literature/` folder where licensing and provenance can be tracked separately.

Primary trigger source:

- Naftali Weinberger, "Homeostasis and Causal Control," *Biology & Philosophy* 41, article 18 (2026), DOI `10.1007/s10539-026-10018-8`.

## License

Unless otherwise noted, the manuscript, notes, and project documentation are licensed under Creative Commons Attribution 4.0 International (CC BY 4.0). See `LICENSE`.
