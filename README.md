# Strikethroo profile: Drupal contrib module

A [Strikethroo](https://strikethroo.canpicasoft.com/) profile for a repository
that contains one Drupal contrib module.

```sh
npx strikethroo init --harnesses claude --profile <this-repo>
npx kenkeep pack import e0ipso/kenkeep-pack-drupal   # recommended, 2.2.0 or later
```

For optimal results use this in combination with [kenkeep-pack-drupal](https://www.github.com/e0ipso/kenkeep-pack-drupal).

## What it changes

| File | Change |
| --- | --- |
| `shared/drupal-contrib.md` | New. Shared rules: commands, test tiers, architecture, configuration, backwards compatibility, dependencies, kenkeep pack. |
| `hooks/PRE_PLAN.md` | Search for existing solutions first; plan BC and test tiers. |
| `hooks/POST_PLAN.md` | Requires the new plan sections and ddev Self Validation. |
| `hooks/PRE_TASK_EXECUTION.md` | Unit TDD; higher tiers written by one final-phase task, not run. |
| `hooks/POST_PHASE.md` | PHPCS, PHPStan, and Unit tests on the phase's changes. |
| `hooks/POST_EXECUTION.md` | One scoped run of all tiers, install/uninstall, updates, dependencies. |
| `hooks/CODE_REVIEW.md` | Adds Drupal defects. |
| `hooks/TASK_EXECUTION_ROUTING.md` | Drupal routing guidance. |
| `templates/PLAN_TEMPLATE.md` | New sections for existing solutions, public API, configuration, and tests. |
| `config.yaml` | Drupal routing profile descriptions. Adjust harnesses and models for your machine. |

Other hooks and templates are the Strikethroo defaults.
