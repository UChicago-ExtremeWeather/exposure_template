# =============================================================================
# DATA ACCESS: Zenodo + arrow + local cache  (DEFAULT pattern, data >~1GB)
# Replace {exposure} throughout. Set URLs to your Zenodo data record (Step 4).
# Parquet must be sorted by year, then geography, before upload.
# =============================================================================

.zenodo_urls <- function() {
  c(
    zcta   = "https://zenodo.org/records/PLACEHOLDER/files/{exposure}_zcta.parquet",
    county = "https://zenodo.org/records/PLACEHOLDER/files/{exposure}_county.parquet"
  )
}

.cache_dir <- function() {
  d <- tools::R_user_dir("{exposure}exposure", which = "cache")
  if (!dir.exists(d)) dir.create(d, recursive = TRUE)
  d
}

.fetch_parquet <- function(geography = c("zcta", "county")) {
  geography <- match.arg(geography)
  url  <- .zenodo_urls()[[geography]]
  dest <- file.path(.cache_dir(), basename(url))
  if (!file.exists(dest)) {
    message("Downloading ", geography, " data from Zenodo (first use only)...")
    utils::download.file(url, dest, mode = "wb")
  }
  dest
}

#' Get ZCTA- or county-level exposure data
#'
#' Downloads (first call only) and caches the processed data from Zenodo, then
#' reads only the requested geography and years via arrow.
#'
#' @param geography One of "zcta" or "county".
#' @param geo_list Vector of codes or prefixes.
#' @param year_range Single year or range.
#' @return A data frame for the requested slice.
#' @export
#' @importFrom dplyr %>%
get_data <- function(geography = c("zcta", "county"), geo_list, year_range) {
  geography <- match.arg(geography)
  path    <- .fetch_parquet(geography)
  geo_col <- if (geography == "zcta") "ZCTA" else "county"
  years   <- if (length(year_range) == 1) year_range else
               seq(min(year_range), max(year_range))

  out <- arrow::open_dataset(path) %>%
    dplyr::filter(year %in% years) %>%
    dplyr::collect()

  keep <- purrr::map_lgl(as.character(out[[geo_col]]),
                         ~ any(startsWith(.x, as.character(geo_list))))
  keep[is.na(keep)] <- FALSE
  out[keep, ]
}

# ---------------------------------------------------------------------------
# TODO (student): add your summary / mapping functions below, following the
# same interface. Each should call get_data() and return a tidy result or a
# ggplot. Document every exported function with roxygen and @export.
# ---------------------------------------------------------------------------
