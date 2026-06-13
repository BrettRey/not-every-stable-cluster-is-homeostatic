# SPACER Revision Plan
## Proposed Manuscript Change
Add a short empirical-extension paragraph to the discussion section, after the paragraph ending:

> the label can't be granted on the strength of stability alone.

The paragraph should say that SPACER illustrates how the diagnostic can be operationalized without inflating repair into homeostasis. It should make four points:

1. The empirical question is whether speaker self-repair and comprehender correction have aligned correction profiles, not whether repairs occur.

2. The current Quarto workflow models correction jointly by process and perturbation predictors.

3. The preliminary signal points to divergent profiles for phonemic distance and surprisal.

4. The philosophical payoff is negative and diagnostic: recovery of intelligibility may be maintained by neighboring stabilizers rather than by one shared corrective-control architecture.

## Draft {==Paragraph==}{>>overall this seems too compressed. I don't think the reader will have a clear idea of what happened, let alone what it means.<<}{id="c2" by="user" at="2026-06-03T16:12:28.596Z"}
This diagnostic point can also be operationalized. The SPACER dataset pairs naturalistic lexical substitution errors from Switchboard with speaker self-repairs and offline comprehender corrections \citep{upadhyeEtAl2025spacer}. In a companion {==Quarto==}{>>does Quarto need a citation/explanation?<<}{id="c1" by="user" at="2026-06-03T16:12:14.596Z"} workflow, the relevant question is not whether repair occurs, but whether the same perturbation measures predict speaker-side and comprehender-side correction. A joint model of the SPACER metric files gives preliminary evidence of divergence: phonemic distance and contextual-surprisal contrasts have different profiles across the two processes. That result should not be read as evidence against linguistic control in general, since the comprehender task is offline text editing rather than online interaction. Its use is diagnostic. It shows why correction profiles have to be compared before speaker monitoring, comprehender repair, and intelligibility recovery are folded into a single homeostatic architecture.
## Bibliography Change
Add a verified SPACER entry to `references.bib`:

```bibtex
@inproceedings{upadhyeEtAl2025spacer,
  title = {{SPACER}: A Parallel Dataset of Speech Production And Comprehension of Error Repairs},
  author = {Upadhye, Samhita and Sun, Li-Yuan and Levy, Roger},
  booktitle = {Proceedings of the Workshop on Cognitive Modeling and Computational Linguistics},
  year = {2025},
  publisher = {Association for Computational Linguistics},
  doi = {10.18653/v1/2025.cmcl-1.19},
  url = {https://aclanthology.org/2025.cmcl-1.19/}
}
```
## Intended Effect
This should strengthen the paper by showing that the ladder does empirical work. It should not change the case architecture or the conclusion: SPACER is a proof of concept for the diagnostic, not a new homeostatic case.
