# Strikethroo profile: Drupal contrib module

A [Strikethroo](https://strikethroo.canpicasoft.com/) profile for a repository
that contains one Drupal contrib module.

```sh
npx strikethroo init --harnesses claude --profile <this-repo>
npx kenkeep pack import e0ipso/kenkeep-pack-drupal   # recommended, 2.1.1 or later
```

Pack 2.1.1 is the first release whose branch summaries survive the import.
The hooks still work without the pack: they fall back to the rules in
`config/shared/drupal-contrib.md`.

A profile can replace hooks and `config.yaml`, and the agent runs what they
say with its own permissions. Read the files before you import them.

## What it changes

| File | Change |
| --- | --- |
| `config/shared/drupal-contrib.md` | New. The rules every hook refers to: test tiers and when each runs, SOLID in Drupal terms, code vs. configuration, backwards compatibility, dependencies, ddev commands, kenkeep pack use. |
| `hooks/PRE_PLAN.md` | Search core, the module, its dependencies, and drupal.org before designing. Backwards compatibility is the default. Plan the test tier of each behavior. |
| `hooks/POST_PLAN.md` | Requires the new plan sections and ddev/Drush Self Validation. |
| `hooks/PRE_TASK_EXECUTION.md` | TDD with Unit tests. Kernel and higher tiers are written but not run inside a phase. |
| `hooks/POST_PHASE.md` | PHPCS and PHPStan on changed files, phase Unit tests only. |
| `hooks/POST_EXECUTION.md` | One scoped run of every test tier, install/uninstall cycle, update functions, dependency declarations. |
| `hooks/CODE_REVIEW.md` | Adds Drupal defects (access checks, cache metadata, escaping, schema, undeclared dependencies, BC breaks). |
| `hooks/TASK_EXECUTION_ROUTING.md` | Drupal routing guidance. |
| `templates/PLAN_TEMPLATE.md` | New sections: Existing Solutions Considered; Public API and Backwards Compatibility; Configuration, Schema, and Update Path; Test Plan. |
| `config.yaml` | Drupal descriptions for the three routing profiles. Harness arguments and models are the Strikethroo defaults; adjust them for your machine. |

The other hooks and templates come from the Strikethroo defaults.

## Requirements

The hooks use the [ddev-drupal-contrib](https://github.com/ddev/ddev-drupal-contrib)
commands. Without ddev, the agent asks you how to run PHPUnit, PHPCS,
PHPStan, and Drush.
