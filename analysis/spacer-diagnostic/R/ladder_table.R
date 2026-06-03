ladder_declaration <- function() {
  tibble::tribble(
    ~diagnostic_step, ~declaration_for_spacer, ~evidence_or_limit,
    "Projection target",
    "Predict when an erroneous lexical item is corrected, and whether production and comprehension support the same correction profile.",
    "The target is a profile comparison, not a general claim that utterance correction is homeostatic.",
    "Stable profile",
    "A stable correction profile would show repeatable associations between lexical perturbation measures and correction probability.",
    "Evidence comes from repeated items and comprehender responses in SPACER.",
    "Network order",
    "Candidate ordering runs from contextual fit, lexical similarity, and phonemic distance to correction decisions.",
    "These are predictors of correction, not by themselves causal ordering relations.",
    "Maintenance",
    "Speaker self-repair and comprehender correction are candidate stabilizers of intelligible utterance recovery.",
    "The comprehender task is offline text editing, so its pathway is not the same as online conversational repair.",
    "Corrective control",
    "The strongest claim would require perturbation-sensitive correction preserving a specified higher-scale relation.",
    "SPACER can test profile alignment or divergence; it should not be read as direct evidence for one shared controller."
  )
}

ladder_result_template <- function() {
  tibble::tribble(
    ~question, ~current_answer,
    "Do repairs happen?",
    "Yes, but occurrence alone is not the target.",
    "Do predictors align across process?",
    "Test with process-by-predictor interactions in one joint model.",
    "Would alignment imply one controller?",
    "No. Alignment would be compatible with one profile, but the task design still separates production monitoring from offline text editing.",
    "Would divergence matter philosophically?",
    "Yes. Divergence supports the diagnostic warning that stable recovery can result from neighboring but non-identical stabilizers."
  )
}
