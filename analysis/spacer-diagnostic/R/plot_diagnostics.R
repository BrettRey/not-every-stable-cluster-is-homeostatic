plot_correction_rates <- function(dat) {
  dat |>
    dplyr::group_by(process) |>
    dplyr::summarise(rate = mean(corrected), n = dplyr::n(), .groups = "drop") |>
    ggplot2::ggplot(ggplot2::aes(x = process, y = rate, fill = process)) +
    ggplot2::geom_col(width = 0.65, show.legend = FALSE) +
    ggplot2::geom_text(ggplot2::aes(label = scales::percent(rate, accuracy = 0.1)), vjust = -0.35) +
    ggplot2::coord_cartesian(ylim = c(0, 1)) +
    ggplot2::labs(x = NULL, y = "Correction rate")
}

plot_predictor_distribution <- function(dat, predictor, label = predictor) {
  ggplot2::ggplot(dat, ggplot2::aes(x = .data[[predictor]], fill = process)) +
    ggplot2::geom_density(alpha = 0.35, color = NA) +
    ggplot2::labs(x = label, y = "Density", fill = NULL)
}

plot_prediction_grid <- function(grid, label = "Predictor value (z)") {
  ggplot2::ggplot(grid, ggplot2::aes(x = value, y = predicted, color = process)) +
    ggplot2::geom_line(linewidth = 1) +
    ggplot2::coord_cartesian(ylim = c(0, 1)) +
    ggplot2::labs(x = label, y = "Predicted correction probability", color = NULL)
}

plot_observed_predicted <- function(checks) {
  checks |>
    tidyr::pivot_longer(c(observed_rate, predicted_rate), names_to = "quantity", values_to = "rate") |>
    ggplot2::ggplot(ggplot2::aes(x = process, y = rate, fill = quantity)) +
    ggplot2::geom_col(position = "dodge", width = 0.7) +
    ggplot2::coord_cartesian(ylim = c(0, 1)) +
    ggplot2::labs(x = NULL, y = "Correction rate", fill = NULL)
}

plot_simulated_rates <- function(sim_rates, dat) {
  observed <- dat |>
    dplyr::group_by(process) |>
    dplyr::summarise(rate = mean(corrected), .groups = "drop")

  ggplot2::ggplot(sim_rates, ggplot2::aes(x = rate, fill = process)) +
    ggplot2::geom_histogram(bins = 30, alpha = 0.55, position = "identity") +
    ggplot2::geom_vline(data = observed, ggplot2::aes(xintercept = rate, color = process), linewidth = 1) +
    ggplot2::facet_wrap(~ process, scales = "free_y") +
    ggplot2::labs(x = "Simulated correction rate", y = "Simulation count", fill = NULL, color = NULL)
}
