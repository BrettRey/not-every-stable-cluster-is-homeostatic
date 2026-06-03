as_binary <- function(x) {
  y <- tolower(as.character(x))
  as.integer(y %in% c("true", "t", "1", "yes"))
}

scale_or_zero <- function(x) {
  x <- as.numeric(x)
  s <- stats::sd(x, na.rm = TRUE)
  if (is.na(s) || s == 0) {
    return(rep(0, length(x)))
  }
  as.numeric(scale(x))
}

make_process_data <- function(metrics,
                              phonemic_measure = c("ipa", "edit"),
                              include_comprehender_all = FALSE) {
  phonemic_measure <- match.arg(phonemic_measure)

  comp_phonemic <- if (phonemic_measure == "ipa") "ipa_distance_comp" else "edit_distance_comp"
  speaker_phonemic <- if (phonemic_measure == "ipa") "ipa_distance_speaker" else "edit_distance_speaker"

  comp <- metrics$comp
  if (!include_comprehender_all) {
    comp <- dplyr::filter(comp, speakerInitProduction != speakerFinalProduction)
  }

  comp_long <- comp |>
    dplyr::transmute(
      process = "comprehender",
      corrected = as_binary(compCorrected),
      itemCrit = as.factor(itemCrit),
      itemID = as.factor(itemID),
      subject = as.factor(subject),
      uttrID = as.factor(uttrID),
      critWindow = as.factor(critWindow),
      context,
      stimulus,
      response,
      initial_word = speakerInitProduction,
      candidate_word = compResponse,
      final_word = speakerFinalProduction,
      target_word = target,
      semantic_distance = as.numeric(semantic_distance_comp),
      phonemic_distance = as.numeric(.data[[comp_phonemic]]),
      delta_frequency = as.numeric(freq_target - freq_speakerInitProduction),
      delta_surprisal = as.numeric(sur_target - sur_speakerInitProduction),
      delta_length = as.numeric(len_target - len_speakerInitProduction)
    )

  speaker_long <- metrics$speaker |>
    dplyr::transmute(
      process = "speaker",
      corrected = as_binary(speakerCorrected),
      itemCrit = as.factor(itemCrit),
      itemID = as.factor(itemID),
      subject = as.factor(subject),
      uttrID = as.factor(uttrID),
      critWindow = as.factor(critWindow),
      context,
      stimulus,
      response,
      initial_word = speakerInitProduction,
      candidate_word = speakerFinalProduction,
      final_word = speakerFinalProduction,
      target_word = target,
      semantic_distance = as.numeric(semantic_distance_speaker),
      phonemic_distance = as.numeric(.data[[speaker_phonemic]]),
      delta_frequency = as.numeric(freq_target - freq_speakerInitProduction),
      delta_surprisal = as.numeric(sur_target - sur_speakerInitProduction),
      delta_length = as.numeric(len_target - len_speakerInitProduction)
    )

  dplyr::bind_rows(comp_long, speaker_long) |>
    dplyr::mutate(
      process = factor(process, levels = c("comprehender", "speaker")),
      subject_key = interaction(process, subject, drop = TRUE),
      item_key = interaction(process, itemCrit, drop = TRUE),
      semantic_z = scale_or_zero(semantic_distance),
      phonemic_z = scale_or_zero(phonemic_distance),
      frequency_z = scale_or_zero(delta_frequency),
      surprisal_z = scale_or_zero(delta_surprisal),
      length_z = scale_or_zero(delta_length)
    ) |>
    tidyr::drop_na(
      corrected, process, itemCrit, subject_key, uttrID, critWindow,
      semantic_z, phonemic_z, frequency_z, surprisal_z, length_z
    )
}

make_predictor_set <- function(include_semantic = TRUE,
                               include_phonemic = TRUE,
                               include_frequency = TRUE,
                               include_surprisal = TRUE,
                               include_length = FALSE) {
  predictors <- character()
  if (include_semantic) predictors <- c(predictors, "semantic_z")
  if (include_phonemic) predictors <- c(predictors, "phonemic_z")
  if (include_frequency) predictors <- c(predictors, "frequency_z")
  if (include_surprisal) predictors <- c(predictors, "surprisal_z")
  if (include_length) predictors <- c(predictors, "length_z")
  predictors
}
