# Roadmap and teaching references

1. **Diploid biallelic summaries and HWE expectations.** Called genotype counts,
   allele frequency, observed heterozygosity and model proportions as separate
   outputs. No test or inferred phase initially. Verify AA=2, AB=2, BB=0 gives
   p(A)=3/4, Ho=1/2 and expected proportions 9/16, 6/16, 1/16. Cover missing,
   all-missing, monomorphic, invalid dosage, groups and allele reversal.
2. **Sampling-aware diversity and assessment.** Choose a named correction and
   exact-test contract; enumerate tiny genotype tables as an independent oracle.
3. **Differentiation and bounded LD.** Agree estimators/weighting/uncertainty,
   then add public genomic-resource adapters and two-population/two-locus checks.
4. **Population expectations before history inference.** Add hand-solvable
   migration/mutation/selection recursions with conservation/limiting cases.
   Optional gsim known-truth comparisons; Ne/history need a separate design.

Teaching references: allele reversal; missing-call denominators; Wahlund mixture;
phase ambiguity; drift expectation versus a realization. The initial installed
example contains only one-locus arithmetic, not a roadmap implementation.
Each milestone needs a reviewed contract, independent small oracle and a scoped
qualification record. No calibration or large-population claims are established.
