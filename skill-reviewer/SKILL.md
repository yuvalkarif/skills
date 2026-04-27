---
name: skill-reviewer
description: Review and improve Agent Skills and local skill folders, especially `SKILL.md`, for trigger quality, wording efficiency, structure, progressive disclosure, grammar, and execution reliability. Use when creating, editing, auditing, tightening, critiquing, or refactoring a skill, or when working on skill descriptions, `SKILL.md`, bundled `references/`, `scripts/`, or trigger behavior.
---

# Skill Reviewer

Review existing skills and suggest the smallest changes that materially improve trigger quality, clarity, token efficiency, grammar, and execution reliability. Preserve the author's voice and structure unless the current structure is actively hurting performance.

## Review Workflow

1. Read `SKILL.md` first.
2. Read `scripts/`, `references/`, or `assets/` only if `SKILL.md` points to them or the structure appears mismatched.
3. Identify the skill shape before recommending changes:
   - compact operator skill
   - workflow playbook
   - reference-heavy skill
4. Optimize the current shape instead of forcing every skill into the same template.

## What To Optimize

### Trigger quality

Check the frontmatter `description` first. It should say:

- what the skill does
- when to use it
- concrete trigger phrases, file types, domains, or contexts
- clear scope boundaries

Improve undertriggering before adding body detail.

### Token efficiency

Prefer deleting or compressing text the model already knows. Cut:

- generic explanations
- repeated instructions
- obvious background
- duplicate examples

If a sentence does not change behavior, remove it.

### Wording strength

Prefer concrete imperative wording:

- `Use pdfplumber for text extraction`
- not `You may want to consider using pdfplumber`

Use hard constraints only where fragility, safety, or consistency requires them. Avoid `MUST` and `NEVER` inflation.

### Grammar and phrasing

Apply minimal grammar corrections when they improve clarity, especially for non-native English authors. Keep the original tone and intent. Do not rewrite natural but slightly non-native phrasing unless it creates friction, ambiguity, or awkward triggering.

### Structure

Keep `SKILL.md` lean:

- put the core workflow in the body
- move rare, variant-specific, or bulky detail to `references/`
- prefer one level of references from `SKILL.md`
- prefer defaults over menus
- add examples only when they improve execution
- add scripts only for deterministic or repetitive work

### Practicality

A good skill teaches a reusable procedure, not a one-off answer. Look for:

- clear default tools or approach
- gotchas the model would otherwise miss
- validation loop when failures are costly
- output template when format matters

## Editing Rules

- Prefer the smallest diff that fixes the problem.
- Rewrite lines, headings, or order before adding new sections.
- Do not expand a short effective skill just to make it look more complete.
- Preserve the author's tone unless it weakens triggering or execution.
- If the skill is already strong, say so and suggest no changes or only 1-2 micro-edits.

## Suggested Output

When reviewing a skill, use this structure:

### Verdict

One short paragraph on whether the skill is already effective or needs tightening.

### Highest-Value Edits

- 1-5 changes in descending impact
- tie each change to triggering, brevity, structure, grammar, or reliability

### Minimal Rewrite

Provide only the smallest replacement snippets needed, for example:

```md
description: Review and improve skills for trigger quality and brevity. Use when editing `SKILL.md` files or tightening skill wording.

## Review Workflow
1. Read `SKILL.md`
2. Fix trigger wording before body detail
```

Only provide a full rewritten `SKILL.md` if the current one is structurally broken or the user asks for it.

## Common Fixes

- turn vague descriptions into trigger-rich descriptions
- replace menus of options with a default plus escape hatch
- collapse repeated guidance into a short checklist
- move rare details into `references/`
- replace abstract advice with one concrete procedure or example
- remove scaffold boilerplate and placeholder sections
- make small grammar corrections that improve clarity without flattening the author's voice
- add `do not trigger` guidance only when overlap with nearby skills is likely

## Anti-Patterns

- rewriting for tone alone
- adding theory the model already knows
- forcing long sections onto tiny skills
- overusing examples when one is enough
- over-correcting non-native English when meaning is already clear
- adding scripts or references without a clear execution benefit

## If Asked To Improve The Skill

Apply the proposed changes directly. Keep filenames stable, remove unused scaffold files, and validate the resulting skill after editing.
