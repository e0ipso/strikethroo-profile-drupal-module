# POST_PLAN Hook

Check the plan against `.ai/strikethroo/config/shared/drupal-contrib.md`.

Make sure the plan has these sections, with content specific to this work
order:

- **Existing Solutions Considered**: core, this module, current
  dependencies, and drupal.org, with a decision for each candidate.
- **Public API and Backwards Compatibility**: what public API the plan adds,
  changes, or deprecates. Write "None" if the plan touches only `@internal`
  code.
- **Configuration, Schema, and Update Path**: new or changed configuration
  keys, their schema, and the update functions that existing sites need.
- **Test Plan**: the tier of each test and, for every tier above Unit, why a
  Unit test is not enough.
- **Self Validation**: steps that run on the ddev-drupal-contrib site, for
  example `ddev drush en <module> -y`, `ddev drush config:get <name>`,
  `ddev drush php:eval`, `ddev drush updb -y`, and `ddev drush pmu <module> -y`.
  Use a browser check only for UI work.

Also answer: _Does this plan need to update the README, `<module>.api.php`,
`hook_help()`, or AGENTS.md?_
