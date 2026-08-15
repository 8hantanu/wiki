# Your Project Needs FUAR Docs!
**2026-03-14**

Most repos are over-documented and under-readable. README bloats into a manual. CONTRIBUTING duplicates what AGENTS already covers. CHANGELOG restates what `git log` already says.

FUAR is a philosophy for cutting that down to exactly four files (or categories), no more, no fewer.

## Why FUAR

The name is the philosophy. *Fewer* files, done right. Every file earns its place or it doesn't exist.

No one needs to read everything. README points you to exactly what you need and nothing more. FEATURES bridges both worlds: the only file everyone reads, but only for what's already shipped.

## The Four Files

```
F  FEATURES  → what exists
U  USER      → how to use it
A  AGENTS    → how it's built
R  README    → what the whole thing is about
```

**README** is brief by design: a tight description of the project and signposts to the other three. No depth lives here.

**USER** is for humans. End-to-end usage, nothing else.

**AGENTS** is for developers and AI agents. Structure, conventions, contributing, license. How to navigate and extend the codebase.

**FEATURES** is the single source of truth for what exists. For users it's *can it do X?* For developers it's *what's the interface?* Same file, different lenses. It reflects current state, not history.

## The Rules

1. **Keep it simple.** If a doc needs a doc to explain it, it's already too complex.
2. **One file, one job.** No file bleeds into another's responsibility.
3. **Apply DRY to documentation.** If the same information would appear in two files, one of them shouldn't exist.
4. **No file that can be derived from another source.** Git diff covers history. Code covers implementation. Don't restate either.

The four files are a starting point, not a ceiling. Larger projects may need more, but always within the same four categories.
