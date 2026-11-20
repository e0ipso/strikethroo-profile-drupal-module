---
id: [PLAN-ID]
summary: "[Brief one-line description of what this plan accomplishes]"
created: [YYYY-MM-DD]
---

# Plan: [Descriptive Plan Title]

## Original Work Order
[The unmodified user input that was used to generate this plan, as a quote]

## Plan Clarifications [only add it if clarifications were necessary]
[Clarification questions and answers in table format]

## Executive Summary

[Provide a 2-3 paragraph overview of the plan. Include:
- What the plan accomplishes
- Why this approach was chosen
- Key benefits and outcomes expected]

## Context

### Current State vs Target State
[Create a table that compares the current state with the target state in the different aspects of the implementation. Include a column on why the change is necessary.]

Example:

| Current State            | Target State | Why?                      |
|--------------------------| ------------ |---------------------------|
| Users have to click twice | Users can click once | We want to improve the UX |
| The button is small | The button is bigger | Fix site design           |
| ... | ... | ...                       |

### Background
[Any additional context, requirements, constraints, any solutions that we tried that didn't work, or relevant history that informs the implementation approach.]

## Existing Solutions Considered
[Search core, this module, the modules it already depends on, and drupal.org, in that order. One row per candidate.]

| Candidate | Where | Decision | Why |
|-----------|-------|----------|-----|
| ... | core / this module / dependency / drupal.org | used / rejected / upstream patch | ... |

## Architectural Approach
[Provide an overview of the implementation strategy, key architectural decisions, and technical approach. Break down into major components or phases using ### subheadings. Add a mermaid diagram summary.]

### [Component/Stage 1 Name]
**Objective**: [What this component accomplishes and why it's important]

[Detailed & concise explanation of implementation approach, key technical decisions, specifications, and rationale for design choices.]

### [Component/Stage 2 Name]
**Objective**: [What this component accomplishes and why it's important]

[Detailed & concise explanation of implementation approach, key technical decisions, specifications, and rationale for design choices.]

### [Additional Components as Needed]
[Continue with additional technical components or phases following the same pattern]

## Public API and Backwards Compatibility
[Public API that this plan adds, changes, or deprecates: services and interfaces, plugin types, hooks, events, configuration keys, routes, permissions. For each deprecation, give the replacement and the release that removes the old API. Write "None" if the plan touches only `@internal` code.]

## Configuration, Schema, and Update Path
[New or changed configuration keys, with their location (`config/install` or `config/optional`), schema entry, and default. Update functions that sites with the module already installed need: `hook_update_N()` for schema, `hook_post_update_NAME()` for data and configuration.]

## Test Plan
[One row per test. Use the lightest tier that proves the behavior. For every tier above Unit, say why a Unit test is not enough.]

| Behavior | Tier | Why this tier |
|----------|------|---------------|
| ... | Unit / Kernel / Functional / FunctionalJavascript | ... |

## Risk Considerations and Mitigation Strategies

<details>
<summary>Technical Risks</summary>
- **[Specific Technical Risk]**: [Description of the technical challenge or limitation]
    - **Mitigation**: [Specific strategy to address this technical risk]
</details>

<details>
<summary>Implementation Risks</summary>
- **[Specific Implementation Risk]**: [Description of implementation-related challenge]
    - **Mitigation**: [Specific strategy to address this implementation risk]
</details>

[Additional Risk Categories as Needed: continue with other risk categories such as Integration Risks, Quality Risks, Resource Risks, etc.]

## Success Criteria

### Primary Success Criteria
1. [Measurable outcome 1]
2. [Measurable outcome 2]
3. [Measurable outcome 3]

## Self Validation

[Describe the concrete steps an LLM should execute after all tasks are completed to verify the implementation works correctly. These must be actionable verification procedures that inspect the real system — not just running pre-existing tests.

Examples of good validation steps:
- Run `ddev drush en <module> -y` and confirm that the module installs without errors
- Run `ddev drush config:get <module>.settings` and confirm the default values
- Run `ddev drush php:eval` to call the new service and print its result
- Run `ddev drush updb -y` and confirm that the new update functions ran
- Run `ddev drush pmu <module> -y` and confirm that no `<module>.*` configuration remains
- For UI work only: use Playwright CLI to open the page and take a screenshot

Avoid vague statements like "verify it works" or "ensure quality". Each step must be a specific, executable action.]

## Documentation

[Required documentation updates to existing documentation, either human-focused documentation like README.md or AI-facing documentation like AGENTS.md and related configuration files.]

## Resource Requirements

### Development Skills
[Required technical expertise and specialized knowledge areas needed for successful implementation]

### Technical Infrastructure
[Tools, libraries, frameworks, and systems needed for development and deployment]

### [Additional Resource Categories as Needed]
[Other resources such as external dependencies, research access, third-party services, etc.]

## Integration Strategy
[Optional section - how this work integrates with existing systems]

## Notes
[Optional section - any additional considerations, constraints, or important context]
