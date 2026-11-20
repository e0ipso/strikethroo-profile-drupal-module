# TASK_EXECUTION_ROUTING Hook

Runs during task generation, after every task file for the plan exists and
before the execution blueprint is generated.

## Classification contract

- Execution profiles are defined in the `execution_routing` section of
  `.ai/strikethroo/config/config.yaml`. Their descriptions are the
  routing contract: match each newly generated task against them using the
  full task content already in your context — `skills`, `complexity_score`,
  objective, acceptance criteria, technical requirements, and integration
  surface. Do not reread task files to reconstruct information you already
  have.
- Classify every generated task exactly once, using only configured profile
  names. Never guess or invent a model, harness, or profile name.
- The task-to-profile mapping file is temporary. The selected profile name is
  durable task metadata, persisted by the routing helper as exactly one
  `execution_profile` field. Concrete execution targets are selected later at
  task dispatch and are never persisted during generation.
- Any routing failure aborts task generation before blueprint generation.
  Never continue with partially routed tasks.

## Project-specific guidance

- Use the most capable profile for tasks that touch access control,
  permissions, update functions, entity or field storage definitions, cache
  metadata in render output, or public API (including deprecations).
- Use the documentation profile only for prose and package metadata: README,
  `hook_help()` text, `.api.php` docblocks, and `.info.yml` or `composer.json`
  edits that add no dependency.
- Configuration YAML with schema changes is implementation work, not
  documentation. Kernel tests check the schema strictly.
