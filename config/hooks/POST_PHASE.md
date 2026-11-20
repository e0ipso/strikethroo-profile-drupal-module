# POST_PHASE Hook

## Phase Post-Execution

Before moving to the next phase:

- Run `ddev phpcs` and `ddev phpstan` on the files that this phase changed.
  Fix every error. Use `ddev phpcbf` for fixes that PHPCS can make.
- Run the Unit tests that this phase added or changed
  (`ddev phpunit --filter <TestClass>`). Do not run Kernel, Functional, or
  FunctionalJavascript tests here. POST_EXECUTION runs them once.
- Run `ddev drush cr` if the phase changed services, routes, plugins,
  hooks, or templates.
- Create a descriptive conventional commit for the phase (subject and body).

### Execution Monitoring

#### Progress Tracking

Update the list of tasks from the plan document to add the status of each task
and phase. Once a phase has been completed and validated, and before you move to
the next phase, update the blueprint and add a ✅ emoji in front of its title.
Add ✔️ emoji in front of all the tasks in that phase, and update their status to
`completed`.

#### Task Status Updates
Valid status transitions:
- `pending` → `in-progress` (when agent starts)
- `in-progress` → `completed` (successful execution)
- `in-progress` → `failed` (execution error)
- `failed` → `in-progress` (retry attempt)
