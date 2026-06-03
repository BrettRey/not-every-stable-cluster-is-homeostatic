spacer_urls <- list(
  raw = "https://raw.githubusercontent.com/goldengua/SPACER-CMCL/main/Dataset/SPACER_DATA.csv",
  comp_metrics = "https://raw.githubusercontent.com/goldengua/SPACER-CMCL/main/ExploratoryAnalysis/PEC_data_for_CompModel_wMetrics.csv",
  speaker_metrics = "https://raw.githubusercontent.com/goldengua/SPACER-CMCL/main/ExploratoryAnalysis/PEC_data_for_SpeakerModel_wMetrics.csv"
)

spacer_paths <- function(root = ".") {
  list(
    raw = file.path(root, "data", "raw", "SPACER_DATA.csv"),
    comp_metrics = file.path(root, "data", "raw", "PEC_data_for_CompModel_wMetrics.csv"),
    speaker_metrics = file.path(root, "data", "raw", "PEC_data_for_SpeakerModel_wMetrics.csv")
  )
}

download_if_missing <- function(url, path, refresh = FALSE) {
  dir.create(dirname(path), recursive = TRUE, showWarnings = FALSE)
  if (refresh || !file.exists(path)) {
    message("Downloading ", basename(path))
    utils::download.file(url, path, mode = "wb", quiet = TRUE)
  }
  invisible(path)
}

download_spacer <- function(root = ".", refresh = FALSE) {
  paths <- spacer_paths(root)
  purrr::walk2(spacer_urls, paths, download_if_missing, refresh = refresh)
  invisible(paths)
}

load_spacer_raw <- function(root = ".", refresh = FALSE) {
  paths <- download_spacer(root, refresh = refresh)
  readr::read_csv(paths$raw, show_col_types = FALSE)
}

load_spacer_metrics <- function(root = ".", refresh = FALSE) {
  paths <- download_spacer(root, refresh = refresh)
  list(
    comp = readr::read_csv(paths$comp_metrics, show_col_types = FALSE),
    speaker = readr::read_csv(paths$speaker_metrics, show_col_types = FALSE)
  )
}
