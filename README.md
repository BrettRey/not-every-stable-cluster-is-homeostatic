# Not every stable cluster is homeostatic

Working repository for Brett Reynolds's short philosophy-of-science paper:

> Not every stable cluster is homeostatic: Control, projectibility, and the Boyd--Khalidi divide

## Project

The paper uses Naftali Weinberger's 2026 account of homeostasis as causal control to sharpen the relation between Boyd's homeostatic property cluster theory and Khalidi's causal-network account of natural kinds.

Working thesis: projectibility is the epistemic target; network order explains many projectible kinds; strict homeostasis should be reserved for feedback-sensitive corrective control under perturbation.

## Build

This project uses XeLaTeX and Biber:

```bash
make
```

Do not use LuaLaTeX; it can damage the PDF text layer.

## Source Policy

The repo does not vendor article PDFs. Source PDFs and markdown extracts are kept in the portfolio-level `literature/` folder where licensing and provenance can be tracked separately.

Primary trigger source:

- Naftali Weinberger, "Homeostasis and Causal Control," *Biology & Philosophy* 41, article 18 (2026), DOI `10.1007/s10539-026-10018-8`.

## License

Unless otherwise noted, the manuscript, notes, and project documentation are licensed under Creative Commons Attribution 4.0 International (CC BY 4.0). See `LICENSE`.
