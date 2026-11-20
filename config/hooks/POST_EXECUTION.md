# POST_EXECUTION Hook

Read `.ai/strikethroo/config/shared/drupal-contrib.md` before you run the
gates.

## Validation Gates

Before marking the blueprint as complete, verify:

- [ ] `ddev phpcs` passes for the whole module.
- [ ] `ddev phpstan` passes for the whole module.
- [ ] `ddev eslint` and `ddev stylelint` pass, if the plan changed JavaScript or CSS.
- [ ] The full module test suite passes in one run: `ddev phpunit`. This is the only run of Kernel, Functional, and FunctionalJavascript tests. Run it after the steps above, not in parallel with other work.
- [ ] Every new or changed configuration key has a schema entry, and `config/install` holds no site-specific values.
- [ ] Install and uninstall work: `ddev drush en <module> -y`, then `ddev drush pmu <module> -y`, then `ddev drush php:eval "print_r(\Drupal::configFactory()->listAll('<module>.'));"` prints an empty array.
- [ ] If the plan added update functions: with the module enabled, `ddev drush updb -y` runs them without errors.
- [ ] `.info.yml` and `composer.json` declare every module this code uses, and `core_version_requirement` matches the `drupal/core` constraint.
- [ ] All tasks in the plan have `status: "completed"` in their frontmatter.
- [ ] The README, `<module>.api.php` (for new hooks or alter hooks), and AGENTS.md are still correct.
- [ ] Execute the **Self Validation** steps defined in the plan document. If any step fails, treat it as a validation gate failure.

## Cleanup

Assess whether the plan left tech debt or dead code behind. Fix it.

Do not remove public API to clean up. Public API changes follow the
deprecation path in the shared rules. Code that is `@internal`, or that this
plan added, has no backwards compatibility obligation; remove dead code there.

## Failure Behavior

If any validation gate fails:

- **Document the failure** in the plan file with details about which gate failed
- **Provide actionable next steps** for resolving the failure in a new task for the plan, following `<root>/config/templates/TASK_TEMPLATE.md`
- **Execute the task** using the `st-execute-task` skill
- **Run all gates in this hook again** after the fix
