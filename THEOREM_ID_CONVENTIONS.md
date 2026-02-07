# Theorem ID Conventions

Use stable IDs in manuscript and Lean:

- Manuscript ID: `THM-<paper-slug>-<section>-<index>`
- Lean theorem comment immediately above declaration includes same ID.

Example:

```lean
/-- THM-consov-4-2: alignment monotonicity under fixed stakes. -/
theorem alignment_monotone ... := ...
```

All mappings are recorded in each paper module's `PaperMap.md`.
