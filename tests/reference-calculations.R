# Verify installed arithmetic against independent rational constants.
example_file <- system.file("examples", "reference.R", package = "gpop",
                            mustWork = TRUE)
env <- new.env(parent = baseenv())
sys.source(example_file, envir = env)
stopifnot(identical(env$reference$n_called, 4),
          identical(env$reference$p_A, 3/4),
          identical(env$reference$observed_heterozygosity, 1/2),
          isTRUE(all.equal(unname(env$reference$hwe_expected), c(9, 6, 1)/16)))
