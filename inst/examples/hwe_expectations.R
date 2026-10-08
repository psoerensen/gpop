# Observed counts from five called diploid individuals.
counts <- c(AA = 2L, AB = 2L, BB = 1L)
n_called <- sum(counts)
p_A <- unname((2 * counts["AA"] + counts["AB"]) / (2 * n_called))
q_B <- 1 - p_A

observed <- counts / n_called
expected <- c(AA = p_A^2, AB = 2 * p_A * q_B, BB = q_B^2)
expected_counts <- n_called * expected
H_observed <- unname(observed["AB"])
H_expected <- unname(expected["AB"])

p_grid <- seq(0, 1, length.out = 101L)
curves <- cbind(AA = p_grid^2, AB = 2 * p_grid * (1 - p_grid),
                BB = (1 - p_grid)^2)
reference <- list(p_A = p_A, observed = observed, expected = expected,
                  expected_counts = expected_counts,
                  H_observed = H_observed, H_expected = H_expected,
                  p_grid = p_grid, curves = curves)

# Plotting helper for this teaching script, not an exported package API.
plot_tutorial <- function() {
  old <- graphics::par(mfrow = c(1, 2), mar = c(4.5, 4.5, 3.5, 1))
  on.exit(graphics::par(old))
  colors <- c("#247BA0", "#70A288", "#D8A47F")
  graphics::matplot(p_grid, curves, type = "l", lty = 1, lwd = 2,
    col = colors, xlab = "Frequency of allele A", ylab = "Expected proportion",
    main = "Random union of gametes")
  graphics::legend("top", colnames(curves), col = colors, lty = 1,
    lwd = 2, bty = "n", cex = 0.85)
  graphics::barplot(rbind(Observed = observed, Expected = expected),
    beside = TRUE, col = c("#247BA0", "#D8A47F"), ylim = c(0, 0.7),
    ylab = "Genotype proportion", main = "Sample and model at p(A) = 0.6")
  graphics::legend("topright", c("Observed", "Expected"),
    fill = c("#247BA0", "#D8A47F"), bty = "n", cex = 0.85)
}
