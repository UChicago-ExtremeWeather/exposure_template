# About the `{exposure}exposure` package

<!-- TEMPLATE README. Replace every {exposure} and <FILL IN> placeholder.
     Delete these HTML comments before publishing. -->

<!-- One short paragraph: what this package does, what data it draws on
     (source + provider), the geographies (ZCTA / county) and the year range. -->
<FILL IN: overview paragraph>

# How to use the `{exposure}exposure` package

## Set-up

Install with:

```r
remotes::install_github("UChicago-ExtremeWeather/{exposure}exposure")
library({exposure}exposure)
```

<!-- Note on first-use download: the data is fetched from Zenodo and cached
     locally on the first get_data() call. Keep or adapt the sentence below. -->
The first call to `get_data()` downloads the processed data from Zenodo and
caches it locally; later calls read from the cache.

## Data

<!-- Describe the processed dataset: source, how it was processed (point to
     data-raw/process_data.R), the variables, and the Zenodo data record DOI. -->
<FILL IN: data description + link to Zenodo data record (DOI)>

| Variable | Type | Description |
|----------|------|-------------|
| <FILL IN> | | |

## Functions

<!-- For EACH exported function, add a subsection with: what it does, its
     arguments, a runnable example, and an output image where the output is a
     map/plot. Save images to figures/ and embed them as shown. -->

### Getting exposure data (`get_data`)

<FILL IN: description>

```r
get_data(geography = "zcta", geo_list = c(606), year_range = 2010:2015)
```

### <FILL IN: your mapping function, e.g. `map_exposure`>

<FILL IN: description + example>

```r
<FILL IN: example call>
```

<!-- Embed the resulting plot. Generate it, save to figures/, then: -->
![](figures/<FILL IN>.png)

<!-- Repeat a subsection per feature / per function as needed. -->

## Updating the package data

<FILL IN: how to refresh from the upstream source and re-publish a Zenodo
version + new GitHub release.>

## Citation

See `citation("{exposure}exposure")`. Cite **both** the code package and the
data record (DOIs in `inst/CITATION`).
