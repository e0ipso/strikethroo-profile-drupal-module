# Drupal Contrib Module Rules

This repository contains one Drupal contrib module. It is not a Drupal site.
Other sites install this module, so its public API, its default configuration,
and its dependencies affect every site that uses it.

## Knowledge pack

If `.ai/kenkeep/nodes/drupal/` exists, it is the reference for Drupal APIs.
Read the branch `index.md` files named by the hook that sent you here, then
open only the leaves that apply to the work. Always read `contrib/` first:
its nodes replace site habits such as config sync and deployment checklists.

A node that recommends a contrib module (for example JSON-RPC, JSON:API, or
Paragraphs) tells you how to integrate with that module only when this module
already depends on it. Never add a dependency because a node recommends it.

If the pack is not installed, use the rules in this file only.

## Commands

Find how to run tools before you run them:

1. If `.ddev/config.yaml` exists and `ddev describe` succeeds, use the
   ddev-drupal-contrib commands: `ddev phpunit`, `ddev phpcs`,
   `ddev phpcbf`, `ddev phpstan`, `ddev eslint`, `ddev stylelint`, and
   `ddev drush`.
2. Otherwise, ask the user how to run PHPUnit, PHPCS, PHPStan, and Drush for
   this module. Do not guess paths, and do not install a Drupal site in the
   repository.

Never commit the generated site files (`web/`, `vendor/`,
`composer.contrib.json`).

## Test tiers

Choose the lightest tier that proves the behavior:

| Tier | Base class | Use it when | Cost |
| --- | --- | --- | --- |
| Unit | `UnitTestCase` | Logic in a service or value object with mocked collaborators | Low |
| Kernel | `KernelTestBase` | The behavior needs the database, entities, config schema, or the container | High |
| Functional | `BrowserTestBase` | The plan names HTTP-level behavior: routes, forms, access over HTTP | Very high |
| FunctionalJavascript / Nightwatch | `WebDriverTestBase` | The plan names JavaScript behavior | Highest |

- "Integration test" in Strikethroo prompts means a Kernel test in this
  repository. A Kernel test needs a reason that a Unit test cannot cover.
- Put logic in services with constructor injection so a Unit test can cover
  it. Hooks, controllers, forms, and plugins stay thin and call the service.
- Write Functional or FunctionalJavascript tests only when the plan names
  them.

### When tests run

- **Inside a phase:** run Unit tests only, and only the test files of your
  task: `ddev phpunit --filter <TestClass>`. Tasks in a phase run at the same
  time, and Kernel and Functional runs compete for CPU and the test
  database.
- **Inside a phase, Kernel and higher tiers:** write the test, check that it
  parses (`php -l`), and do not run it. Say so in the task's completion
  notes.
- **After all phases (POST_EXECUTION):** run every tier once, scoped to the
  module.

Never run the full Drupal core test suite.

## Architecture (SOLID in Drupal terms)

- **Single responsibility:** a hook implementation, controller, form, or
  plugin translates between Drupal and a service. Business logic lives in the
  service.
- **Open/closed:** extend through plugins, events, tagged services, and alter
  hooks. Do not branch on `moduleExists()` to add behavior for another module.
- **Liskov:** a plugin or service honors the full interface contract of its
  type. Do not throw or return types that the interface does not allow.
- **Interface segregation:** depend on the narrowest interface that works,
  for example `EntityTypeManagerInterface`, never the container. Give each
  public service its own interface.
- **Dependency inversion:** use constructor injection with promoted
  `readonly` properties, autowiring, and `#[Autowire]` where needed. Use
  `\Drupal::` only where the container is not available (procedural code in
  `.module` or `.install` files).
- Prefer OOP hooks (`#[Hook]` in `src/Hook/`) and attribute-based plugins
  when `core_version_requirement` allows them.
- Mark classes that are not public API `@internal` and `final`. A smaller
  public API means fewer backwards-compatibility obligations.

## Code and configuration

- Default configuration goes in `config/install`. Configuration that needs
  another module goes in `config/optional`. Values must suit any site:
  no site names, URLs, credentials, or environment values.
- Every configuration key has an entry in `config/schema/*.schema.yml`.
  Kernel tests check the schema strictly.
- Code reads settings from configuration. Do not hardcode values that a site
  could need to change.
- Runtime values that are not configuration go in State or the key-value
  store, not in configuration.
- A change to stored configuration or schema for sites that already have the
  module needs an update: `hook_update_N()` for schema,
  `hook_post_update_NAME()` for data and configuration.

## Backwards compatibility

The public API is everything that is not `@internal`: services and their
interfaces, plugin types, hooks, events, configuration keys, routes, and
permissions.

- Follow semver. Do not remove or change public API in a minor or patch
  release.
- To replace public API, keep the old one, mark it `@deprecated` with
  `@trigger_error()`, and link a change record. Remove it in the next major
  release.
- Code that is `@internal`, or that this plan adds, has no backwards
  compatibility obligation.

## Dependencies

- A dependency on another module goes in `.info.yml` as `project:module` and
  in `composer.json` as `drupal/<project>`. Keep `core_version_requirement`
  and the `drupal/core` constraint in `composer.json` the same.
- A new dependency always goes through the clarification gate. Explain what
  it gives and what it costs every site that installs this module.
- Never edit core, another contrib project, or `vendor/` in place. Fix the
  upstream project with an issue and a patch.
