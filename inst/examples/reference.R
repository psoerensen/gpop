# Reference arithmetic only, not an exported method or HWE test.
# Four called diploid biallelic individuals; A is the counted allele.
counts <- c(AA = 2, AB = 2, BB = 0)
n_called <- sum(counts)
p_A <- unname((2 * counts['AA'] + counts['AB']) / (2 * n_called))
observed_heterozygosity <- unname(counts['AB'] / n_called)
# Random union of gametes at supplied p_A; no sampling assumptions are tested.
hwe_expected <- c(AA = p_A^2, AB = 2 * p_A * (1 - p_A), BB = (1 - p_A)^2)
reference <- list(counts = counts, n_called = n_called, p_A = p_A,
                  observed_heterozygosity = observed_heterozygosity,
                  hwe_expected = hwe_expected)
