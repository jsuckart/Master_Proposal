#import "/utils/todo.typ": TODO

= Schedule
#TODO[ // Remove this block
  *Thesis Schedule*
  - When will the thesis Start
  - Create a rough plan for your thesis (separate the time in iterations with a length of 2-4 weeks)
  - Each iteration should contain several smaller work items - Again keep it high-level and make to keep your plan realistic
  - Make sure the work-items are measurable and deliverable, they should describe features that are vertically integrated
  - Do not include thesis writing or presentation tasks
]

#show heading.where(level: 2): set heading(numbering: none)

The Master’s thesis starts on 29. June 2026 and ends on 29. December 2026. The schedule divides the implementation into six iterations of approximately four weeks each.

== Iteration 1, Weeks 1–4: Minimal Course-Level Presentation Assessment
- Implement a first end-to-end workflow for creating a simple course-level presentation assessment
- Add the required backend, database, and user interface functionality for this minimal version
- Validate the workflow with a basic instructor scenario
Related objective: 4.1

== Iteration 2, Weeks 5–8: Extend Presentation Contexts
- Extend the first version to support exercise-linked presentation assessments
- Keep course-level and exercise-linked presentations within one consistent workflow
- Refine the initial data model and user interface based on the first iteration
Related objective: 4.1

== Iteration 3, Weeks 9–12: Add Basic Grading Criteria
- Add configurable grading criteria to the existing presentation assessment workflow
- Allow instructors to define criteria and assign point values
- Validate whether the criteria configuration works for standalone and exercise-linked presentations
Related objectives: 4.1 and 4.2

== Iteration 4, Weeks 13–16: Add Assessment and Feedback 
- Extend the workflow so instructors and tutors can assess presentations using the configured criteria
- Support grading for individual students and teams
- Review and refine the configuration workflow based on the assessment use case
Related objective: 4.2

== Iteration 5, Weeks 17–20: Integrate Results and Refine Existing Workflows
- Integrate presentation results into existing Artemis grading and result views
- Check whether instructors, tutors, and students can access grades and feedback through existing workflows
- Use findings from the integration step to refine earlier configuration and assessment workflows
Related objective: 4.3

== Iteration 6, Weeks 21–24: Stabilization, Testing, and Final Validation
- Improve usability, error handling, and maintainability across all implemented workflows
- Complete automated backend and frontend tests for the main scenarios
- Validate the full feature with course-level, exercise-linked, and hybrid presentation scenarios
Related objectives: 4.1–4.3