# Population genetics scope and proposed interfaces

All names below are proposals, not exported or implemented functions.

| Proposal | Scientific role | Assumptions to declare |
| --- | --- | --- |
| gpop_frequencies | Observed allele/genotype/haplotype frequencies | Ploidy, counted allele, called chromosomes, sample weighting, phase and missingness. Unphased dosage is not observed haplotype frequency. |
| gpop_hwe | Equilibrium expectations and later assessment | Expected diploid proportions at supplied p are a model. Testing needs a declared sampling model, unrelated sampling, rare-count and structure treatment. |
| gpop_diversity / gpop_inbreeding | Diversity, heterozygosity and inbreeding | Observed heterozygosity versus gene diversity, finite-sample corrections and reference frequencies; distinguish pedigree, genotype and IBD inbreeding. |
| gpop_ld | Linkage disequilibrium | Haplotype D/r-squared require phase or explicit inference; dosage correlation is not automatically haplotype LD. Reuse gmat contracts. |
| gpop_structure / gpop_differentiation | Structure and population differentiation | Named estimator, weighting, population/reference labels and uncertainty; PCA is descriptive, not historical inference. |
| gpop_history / gpop_effective_size | History, ancestral contributions and Ne | Temporal/LD/coalescent model and sampling, migration/selection assumptions. Census size is not Ne; ancestry is not a pedigree parent fraction. |
| gpop_expectation | Simple drift, migration, mutation, recombination and selection models | Deterministic expectation/recursion, life cycle, time units, dominance and population size. Stochastic biological realizations remain in gsim. |

Distinguish observed statistics, model expectations and estimators in every
future result, alongside allele orientation, denominators, reference definition,
units, assumptions and method version. Sampling uncertainty needs a declared
sampling/resampling model; an expectation has no automatic sampling SE.
No population analysis API is implemented in this foundation.
