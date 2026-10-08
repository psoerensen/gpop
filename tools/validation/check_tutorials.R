# Run or source from the package root. No installation or large-data tests.
local({
  package <- read.dcf("DESCRIPTION")[1, "Package"]
  examples <- c("allele_frequencies", "hwe_expectations")
  loaded <- list()
  for (name in examples) {
    path <- file.path("inst/examples", paste0(name, ".R"))
    text <- paste(readLines(path, warn = FALSE), collapse = "\n")
    code <- trimws(strsplit(text, "# Plotting helper", fixed = TRUE)[[1]][1])
    slug <- gsub("_", "-", name, fixed = TRUE)
    tutorial <- paste(readLines(file.path("docs/tutorials", paste0(slug, ".md")),
                                warn = FALSE), collapse = "\n")
    # (?s) makes the match span multiple lines.
    first_code <- regmatches(tutorial, regexec("(?s)```r\n(.*?)\n```", tutorial, perl = TRUE))[[1]]
    stopifnot(length(first_code) == 2L, identical(trimws(first_code[2]), code))
    environment <- new.env(parent = baseenv())
    sys.source(path, envir = environment)
    loaded[[name]] <- environment
  }
  close_to <- function(actual, expected) {
    stopifnot(isTRUE(all.equal(unname(actual), unname(expected), tolerance = 1e-12)))
  }
  frequencies <- loaded[["allele_frequencies"]]
  close_to(frequencies$counts, c(2L, 2L, 1L))
  stopifnot(frequencies$n_called == 5L, frequencies$n_missing == 1L)
  close_to(c(frequencies$p_A, frequencies$p_B, frequencies$H_observed), c(3/5, 2/5, 2/5))
  close_to(frequencies$p_B_recounted, 2/5)
  close_to(frequencies$genotype_frequencies, c(2/5, 2/5, 1/5))
  hwe <- loaded[["hwe_expectations"]]
  close_to(hwe$expected, c(9/25, 12/25, 4/25))
  close_to(hwe$expected_counts, c(9/5, 12/5, 4/5))
  close_to(hwe$curves[1, ], c(0, 0, 1))
  close_to(hwe$curves[51, ], c(1/4, 1/2, 1/4))
  close_to(hwe$curves[101, ], c(1, 0, 0))
  close_to(rowSums(hwe$curves), rep(1, 101))
  cat(package, ": two teaching examples and their displayed code verified\n", sep = "")
})
