# STATUS

## Project

Not every stable cluster is homeostatic: Stability, network order, maintenance, and control in projectible kinds.

## Stage

Seed project scaffolded on 2026-05-28. Public GitHub repo created as infrastructure for a short philosophy-of-science article. Preprint posted at PhilArchive on 2026-06-01: https://philarchive.org/rec/REYNES. A companion SPACER diagnostic supplement is live at https://brettrey.github.io/not-every-stable-cluster-is-homeostatic/ and frozen as GitHub release `spacer-supplement-2026-06-03`. Submitted to the Journal for General Philosophy of Science on 2026-06-13 as `JGPS-D-26-00202`.

## Working Thesis

Boydian HPC theory needs a sharper homeostasis constraint. The paper treats projectibility as the target and separates five evidential demands in a diagnostic grid:

1. projection target;
2. stable profile;
3. network order;
4. maintenance;
5. corrective control that preserves a higher-scale relation through lower-scale variation.

## Immediate Next Actions

- Wait for the Editorial Manager acknowledgement/status update for `JGPS-D-26-00202`.
- If JGPS requests source files, use `main.tex` with the XeLaTeX magic comment and ensure all supporting files are uploaded at the same folder level as required by the portal.
- If the manuscript moves to revision, start from the submitted source state and restore identifying acknowledgements/data links only if the journal no longer requires anonymity.

## Source Anchors

- `weinberger2026HomeostasisCausalControl`: homeostasis as causal control.
- `boyd1991` and `boyd1999`: homeostatic property clusters.
- `khalidi2013` and `khalidi2018nodes`: projectibility through causal-network order.
- `slater2015` and `onishi2022`: stability-first and mechanism-sceptical pressure on HPC theory.
- `dingemanse2024`, `ameka1992`, and `norrick2009`: interjections as stable pragmatic projectibility.
- `fitzgeraldBean2018` and `bichMossioSoto2020`: glycemic regulation as a harder biological control case.
- `corbett2006`, `bockMiller1991`, and `levelt1983`: agreement monitoring/repair as the candidate positive linguistic case.
- `upadhyeEtAl2025spacer`: SPACER dataset for the companion speaker/comprehender correction-profile analysis.

## Session Notes

### 2026-05-28

- Scaffolded the project from the house-style LaTeX template.
- Added CC BY 4.0 license text via GitHub's license API.
- Added a buildable seed manuscript with a provisional abstract and section architecture.
- Added self-contained BibTeX entries for the immediate source anchors.
- Created `notes/project-brief.md`, `STATUS.md`, `DECISIONS.md`, and `README.md`.
- Verified the Weinberger Springer DOI and revised the paper around diagnostics rather than a ladder.
- Added the Watt governor as the calibration case, glycemic regulation as a harder biological extension, and interjections as the negative linguistic case.
- Clarified that the governor is a calibration case rather than a kind, glycemic regulation is the biological candidate domain, and grammaticality is the plausible positive linguistic case for later expansion.
- Locked Journal for General Philosophy of Science as the primary target and added `notes/jgps-submission-plan.md`.
- Added JGPS-ready keywords, confirmed the abstract is in the required range, and added `notes/jgps-audience-tone.md`.
- Saved the JGPS reviewer board as Khalidi, Onishi, Weinberger, and Ereshefsky in `advisory-board.md`.
- Saved GPT-5.5 Pro feedback and the full four-reviewer board outputs in `notes/review-board-2026-05-28.md`.
- Replaced gender concord with agreement monitoring/repair as the candidate positive linguistic case.

### 2026-06-01

- Read the prose synthesis report at `Project-Management/analysis/reports/prose-synthesis-hpc-stability-interjections-2026-06-01.md`.
- Reframed the article around the diagnostic ladder: projection target -> stable profile -> network order -> maintenance -> corrective control.
- Kept the case architecture: Watt governor as calibration, glycemic regulation as strict control, interjections as the negative linguistic case, and agreement monitoring/repair as the positive linguistic candidate.
- Posted the preprint to PhilArchive: https://philarchive.org/rec/REYNES.

### 2026-06-02

- Resumed shutdown after the PhilArchive posting and completed publication tracking.
- Added the public preprint PDF and text extract to the central literature folder.
- Added the central bibliography key `reynolds2026notEveryStableCluster` for the PhilArchive record.
- Updated portfolio, website publications, and CV tracking; website commit `bd5bc90` was pushed.
- Next project action remains the anonymized Journal for General Philosophy of Science submission package.

### 2026-06-03 Session Notes

- Built a companion Quarto workflow in `analysis/spacer-diagnostic/` for the SPACER speaker/comprehender repair dataset.
- Rendered and published the workflow to GitHub Pages: https://brettrey.github.io/not-every-stable-cluster-is-homeostatic/.
- Added a verified SPACER citation (`upadhyeEtAl2025spacer`) and revised the discussion to say the analysis is a proof of concept for the diagnostic, not evidence that correction itself is homeostasis.
- Added a data/code availability section linking the live supplement and source workflow; raw SPACER data are downloaded from the original public project and are not redistributed here.
- Shipped source commit `3de4e38` to `main`, published the rendered site on `gh-pages` commit `4b785a2`, and created GitHub release `spacer-supplement-2026-06-03`.
- Verification: Quarto render succeeded, `make` reports the PDF up to date, manuscript logs have no unresolved citation/reference warnings, GitHub Pages status is `built`, and the live supplement returns HTTP 200.
- Local caveat: `notes/spacer-revision-plan.md` remains untracked because it is a Roughdraft checkpoint containing review comments.

### 2026-06-13

- Submitted the manuscript to the Journal for General Philosophy of Science through Editorial Manager.
- Manuscript ID: `JGPS-D-26-00202`.
- Submitted title: "Not every stable cluster is homeostatic: Stability, network order, maintenance, and control in projectible kinds."
- Package used an anonymous manuscript PDF plus separate title page. The submission office comment disclosed AI-tool use and pointed to the title-page disclosure.
