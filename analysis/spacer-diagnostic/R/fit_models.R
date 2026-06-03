joint_formula <- function(predictors,
                          random_effects = c("uttrID", "critWindow", "subject_key")) {
  fixed <- paste0("process * (", paste(predictors, collapse = " + "), ")")
  random <- paste0("(1 | ", random_effects, ")", collapse = " + ")
  stats::as.formula(paste("corrected ~", fixed, "+", random))
}

fit_joint_glmer <- function(dat,
                            predictors = make_predictor_set(),
                            control = lme4::glmerControl(optimizer = "bobyqa")) {
  f <- joint_formula(predictors)
  lme4::glmer(f, data = dat, family = stats::binomial(), control = control)
}

fit_or_load_joint_glmer <- function(dat,
                                    predictors = make_predictor_set(),
                                    cache_path = file.path("data", "processed", "joint_glmer.rds"),
                                    refresh = FALSE) {
  dir.create(dirname(cache_path), recursive = TRUE, showWarnings = FALSE)
  if (!refresh && file.exists(cache_path)) {
    return(readRDS(cache_path))
  }
  model <- fit_joint_glmer(dat, predictors = predictors)
  saveRDS(model, cache_path)
  model
}

tidy_glmer <- function(model) {
  coefs <- as.data.frame(summary(model)$coefficients)
  coefs$term <- rownames(coefs)
  rownames(coefs) <- NULL
  coefs |>
    dplyr::rename(
      estimate = Estimate,
      std_error = `Std. Error`,
      z_value = `z value`,
      p_value = `Pr(>|z|)`
    ) |>
    dplyr::select(term, estimate, std_error, z_value, p_value)
}

fit_joint_brms <- function(dat,
                           predictors = make_predictor_set(),
                           chains = 4,
                           iter = 2000,
                           seed = 20260603,
                           ...) {
  if (!requireNamespace("brms", quietly = TRUE)) {
    stop("Package 'brms' is required for the Bayesian model.", call. = FALSE)
  }
  f <- brms::bf(joint_formula(predictors))
  priors <- c(
    brms::prior(normal(0, 1.5), class = "b"),
    brms::prior(student_t(3, 0, 2.5), class = "Intercept"),
    brms::prior(exponential(1), class = "sd")
  )
  brms::brm(
    formula = f,
    data = dat,
    family = brms::bernoulli(),
    prior = priors,
    chains = chains,
    iter = iter,
    seed = seed,
    ...
  )
}

make_prediction_grid <- function(model,
                                 predictor,
                                 predictors = make_predictor_set(),
                                 values = seq(-2, 2, length.out = 41)) {
  grid <- tidyr::crossing(
    process = factor(c("comprehender", "speaker"), levels = c("comprehender", "speaker")),
    value = values
  )

  for (p in predictors) {
    grid[[p]] <- 0
  }
  grid[[predictor]] <- grid$value

  grid$uttrID <- levels(model@frame$uttrID)[1]
  grid$critWindow <- levels(model@frame$critWindow)[1]
  grid$subject_key <- levels(model@frame$subject_key)[1]
  grid$predicted <- stats::predict(model, newdata = grid, type = "response", re.form = NA, allow.new.levels = TRUE)
  grid
}

observed_vs_predicted <- function(model, dat) {
  dat |>
    dplyr::mutate(predicted = stats::predict(model, type = "response")) |>
    dplyr::group_by(process) |>
    dplyr::summarise(
      observed_rate = mean(corrected),
      predicted_rate = mean(predicted),
      n = dplyr::n(),
      .groups = "drop"
    )
}

simulate_process_rates <- function(model, nsim = 100, seed = 20260603) {
  set.seed(seed)
  sims <- simulate(model, nsim = nsim)
  frame <- model@frame
  purrr::imap_dfr(sims, function(y, sim_id) {
    frame |>
      dplyr::mutate(corrected_sim = as.integer(y)) |>
      dplyr::group_by(process) |>
      dplyr::summarise(rate = mean(corrected_sim), .groups = "drop") |>
      dplyr::mutate(sim = sim_id)
  })
}
