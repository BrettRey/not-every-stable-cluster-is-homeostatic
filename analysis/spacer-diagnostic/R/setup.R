required_packages <- c(
  "dplyr", "ggplot2", "knitr", "lme4", "purrr", "readr", "scales",
  "stringr", "tibble", "tidyr"
)

missing_packages <- required_packages[!vapply(required_packages, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing_packages) > 0) {
  stop(
    "Missing required R packages: ",
    paste(missing_packages, collapse = ", "),
    ". Install them before rendering this workflow.",
    call. = FALSE
  )
}

source("R/load_spacer.R")
source("R/derive_variables.R")
source("R/fake_data.R")
source("R/fit_models.R")
source("R/plot_diagnostics.R")
source("R/ladder_table.R")

ggplot2::theme_set(ggplot2::theme_minimal(base_size = 12))
