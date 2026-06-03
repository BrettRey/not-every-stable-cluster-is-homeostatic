simulate_correction_profiles <- function(n_items = 240,
                                         n_comprehenders = 8,
                                         shared_profile = TRUE,
                                         seed = 20260603) {
  set.seed(seed)

  item <- seq_len(n_items)
  item_effect <- stats::rnorm(n_items, 0, 0.8)
  semantic_z <- stats::rnorm(n_items)
  phonemic_z <- stats::rnorm(n_items)
  surprisal_z <- stats::rnorm(n_items)
  frequency_z <- stats::rnorm(n_items)

  speaker <- tibble::tibble(
    process = "speaker",
    item = item,
    subject = "speaker_proxy",
    semantic_z = semantic_z,
    phonemic_z = phonemic_z,
    surprisal_z = surprisal_z,
    frequency_z = frequency_z,
    item_effect = item_effect
  )

  comp <- tidyr::crossing(
    process = "comprehender",
    item = item,
    subject = paste0("c", seq_len(n_comprehenders))
  ) |>
    dplyr::mutate(
      semantic_z = semantic_z[item],
      phonemic_z = phonemic_z[item],
      surprisal_z = surprisal_z[item],
      frequency_z = frequency_z[item],
      item_effect = item_effect[item],
      subject_effect = stats::rnorm(n_comprehenders, 0, 0.5)[match(subject, paste0("c", seq_len(n_comprehenders)))]
    )

  dat <- dplyr::bind_rows(
    dplyr::mutate(speaker, subject_effect = 0),
    comp
  ) |>
    dplyr::mutate(
      process = factor(process, levels = c("comprehender", "speaker")),
      process_speaker = as.integer(process == "speaker")
    )

  if (shared_profile) {
    b_process_phonemic <- 0
    b_process_surprisal <- 0
  } else {
    b_process_phonemic <- 1.0
    b_process_surprisal <- -0.6
  }

  dat |>
    dplyr::mutate(
      eta = -1.6 +
        0.8 * process_speaker +
        0.25 * semantic_z -
        0.65 * phonemic_z +
        0.45 * surprisal_z -
        0.15 * frequency_z +
        b_process_phonemic * process_speaker * phonemic_z +
        b_process_surprisal * process_speaker * surprisal_z +
        item_effect + subject_effect,
      p = stats::plogis(eta),
      corrected = stats::rbinom(dplyr::n(), size = 1, prob = p),
      subject_key = interaction(process, subject, drop = TRUE),
      uttrID = as.factor(item),
      critWindow = as.factor(item)
    )
}

fit_fake_recovery <- function(dat) {
  stats::glm(
    corrected ~ process * (semantic_z + phonemic_z + surprisal_z + frequency_z),
    data = dat,
    family = stats::binomial()
  )
}
