# =============================================================================
# data-raw/process_data.R  (NOT shipped to users; in .Rbuildignore)
#
# Student: write the code that turns RAW source data into the PROCESSED Parquet
# files you upload to Zenodo. See Step 3 in STUDENT_CHECKLIST.md.
#
#   1. Load raw source data.
#   2. Clean / derive your exposure variables.
#   3. Assign to ZCTA and county.
#   4. SORT by year, then geography (required for fast slice reads).
#   5. Write one Parquet per spatial level with arrow::write_parquet().
# =============================================================================

library(dplyr)
library(arrow)

# 1. raw <- ...                                   # TODO: load raw source
# 2. processed <- raw %>% ...                     # TODO: clean / derive
# 3. ... assign geographies ...                   # TODO: ZCTA + county

# 4-5. sort then write
# zcta_out <- processed %>% arrange(year, ZCTA)
# county_out <- processed %>% arrange(year, county)
# arrow::write_parquet(zcta_out,   "{exposure}_zcta.parquet")
# arrow::write_parquet(county_out, "{exposure}_county.parquet")
