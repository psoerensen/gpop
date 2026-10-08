# One diploid biallelic locus; dosage counts copies of allele A.
dosage <- c(2L, 1L, NA_integer_, 0L, 1L, 2L)
called <- dosage[!is.na(dosage)]
stopifnot(length(called) > 0L, all(called %in% 0:2))

counts <- c(AA = sum(called == 2L),
            AB = sum(called == 1L), BB = sum(called == 0L))
n_called <- length(called)
n_missing <- sum(is.na(dosage))
genotype_frequencies <- counts / n_called
p_A <- sum(called) / (2 * n_called)
p_B <- 1 - p_A
H_observed <- unname(genotype_frequencies["AB"])

# Reverse the counted allele without changing the individuals.
dosage_B <- 2L - dosage
p_B_recounted <- sum(dosage_B, na.rm = TRUE) / (2 * n_called)
reference <- list(counts = counts, n_called = n_called,
                  n_missing = n_missing, p_A = p_A, p_B = p_B,
                  genotype_frequencies = genotype_frequencies,
                  H_observed = H_observed, p_B_recounted = p_B_recounted)

# Plotting helper for this teaching script, not an exported package API.
plot_tutorial <- function() {
  graphics::barplot(counts, col = c("#247BA0", "#70A288", "#D8A47F"),
    ylim = c(0, 3), ylab = "Called individuals", xlab = "Genotype",
    main = "Count genotypes before counting alleles")
  graphics::mtext("Five called individuals; one missing call excluded", side = 3)
}
