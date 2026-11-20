# PRE_TASK_EXECUTION Hook

Read `.ai/strikethroo/config/shared/drupal-contrib.md` before you write code.
If the kenkeep Drupal pack is installed, read `quality/index.md` and the
branch index that matches the task's `skills` (for example `architecture/`,
`data-cache/`, `security/`, `presentation/`, `processing/`, `tooling/`).

## Test-Driven Development by tier

Tasks in a phase run at the same time. Run Unit tests only.

**Unit tests: RED → GREEN → REFACTOR**

1. **RED**: Write one failing Unit test and run only that test
   (`ddev phpunit --filter <TestClass>`). Confirm that it fails for the
   expected reason.
2. **GREEN**: Write the minimal code that makes it pass.
3. **REFACTOR**: Clean up with the test green. Run it again.

**Kernel, Functional, and FunctionalJavascript tests**

Write the test with the code. Check the syntax with `php -l <file>`. Do not
run it in this task. In the task's completion notes, list each test file you
did not run. POST_EXECUTION runs them.

Write tests only where the test philosophy and the plan's Test Plan call for
them. If the task needs no test, state why and implement it directly.

## Before you mark the task complete

- Run `ddev phpcs` and `ddev phpstan` on the files you changed only.
- Check that new configuration keys have schema entries.
- Check that new classes use constructor injection and do not call
  `\Drupal::`.
- Check that you did not change public API without the deprecation the plan
  describes.
