# PRE_PLAN Hook

Read `.ai/strikethroo/config/shared/drupal-contrib.md` before you continue.
If the kenkeep Drupal pack is installed, read the `contrib/`, `architecture/`,
`data-cache/`, and `security/` branch indexes.

## Look for an existing solution first

Before you design new code, search in this order and stop when you find a
solution that fits:

1. **Drupal core.** Core may already provide the API, plugin type, field
   type, or module.
2. **This module.** Reuse or extend existing services and plugins. Do not add
   a second implementation of the same behavior.
3. **Modules this module already depends on.** Read `.info.yml` and
   `composer.json`.
4. **Projects on drupal.org.** Check each candidate for: support for the core
   versions in `core_version_requirement`, security advisory coverage,
   maintenance status, and recent releases.

For each candidate, record in the plan whether you used it and why. A
candidate from step 4 adds a dependency, so ask the user before you plan it.
If the right fix belongs in another project, propose an upstream issue and a
patch instead of a copy in this module.

## Scope Control Guidelines

**Critical: Implement ONLY what is explicitly requested**

- **Minimal Viable Implementation**: Build exactly what the user asked for, nothing more
- **Question Everything Extra**: If not directly mentioned by the user, don't add it
- **Avoid Feature Creep**: Resist the urge to add "helpful" features or "nice-to-have" additions
- **YAGNI Principle**: _You Aren't Gonna Need It_ - don't build for hypothetical future needs

**Common Scope Creep Anti-Patterns to Avoid:**
1. Adding extra commands or features "for completeness"
2. Creating infrastructure for future features that weren't requested
3. Building abstractions or frameworks when simple solutions suffice
4. Adding configuration options not specifically mentioned
5. Implementing error handling beyond what's necessary for the core request
6. Creating documentation or help systems unless explicitly requested

**When in doubt, ask**: "Is this feature explicitly mentioned in the user's request?"

## Backwards compatibility

This module has users. Keep the public API compatible, as described in the
shared rules. If the work order needs a change to public API, plan the
deprecation path and state which release removes the old API. If the work
order asks for a breaking change, confirm that it targets a new major
release.

## Simplicity Principles

**Favor maintainability over cleverness**

- **Simple Solutions First**: Choose the most straightforward approach that meets requirements
- **Avoid Over-Engineering**: Don't create complex systems when simple ones work
- **Standard Patterns**: Use Drupal's established patterns (services, plugins, events, hooks) rather than inventing new ones
- **Minimal Dependencies**: Each dependency becomes a dependency of every site that installs this module
- **Clear Structure**: Follow the standard module layout (`src/`, `config/`, `templates/`, `tests/src/{Unit,Kernel,Functional,FunctionalJavascript}`)

**Remember**: A working simple solution is better than a complex "perfect" one.

## Test budget

Plan the test tier for each behavior with the table in the shared rules.
Design services so that most behavior is covered by Unit tests. Name every
Kernel, Functional, or FunctionalJavascript test in the plan with the reason
a Unit test cannot cover it.

## Critical Notes

- Never generate a partial or assumed plan without adequate context
- Prioritize accuracy over speed
- Use the plan template in .ai/strikethroo/config/templates/PLAN_TEMPLATE.md
- DO NOT create or list any tasks or phases during the plan creation. This will be done in a later step. Stick to writing the PRD (Project Requirements Document).
