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

The Master’s thesis starts on 25. May 2026 and ends on 25. October 2026. The implementation is planned in six iterations of approximately four weeks each.

== Iteration 1, Weeks 1-4: Creating the Basic Presentation Model
The first iteration focuses on creating the basic structure for presentation assessments in Artemis. This includes defining the main presentation-related entities and their relationships, as well as adding the required database functionality for storing presentation configurations. Instructors should also be able to create and view simple presentation configurations through an initial user interface.
Related objective: 4.1

== Iteration 2, Weeks 5-8: Support Exercise-Linked Presentations
In the second iteration, presentations will be extended so that they can also be connected to existing exercises. The implementation should integrate into the current exercise administration views in Artemis while still supporting standalone presentations. The goal is to keep both approaches consistent within one shared concept.
Related objective: 4.1 and 4.3

== Iteration 3, Weeks 9–12: Adding Configurable Assessment Criteria
The third iteration focuses on presentation grading criteria. Instructors should be able to define assessment criteria and assign points to them. These criteria will then become part of the grading workflow to support structured and transparent assessments.
Related objective: 4.2

== Iteration 4, Weeks 13-16: Assess Presentations
During this iteration, the actual grading workflow will be implemented for instructors and tutors. The system should support assessing both individual students and teams based on the configured criteria. Assessment results should also be stored and accessible within Artemis.
Related objectives: 4.3 and 4.4

== Iteration 5,0 Weeks 17–20: Integrate Results into Grading + Puffer
The fifth iteration focuses on integrating presentation results into the existing grading and result views of Artemis. Presentation grades should appear in the expected course and exercise contexts. I expect this to not take up the entire four weeks, so the remaining time can be used to continue work on the final iteration or to complete tasks that were postponed during earlier phases of the project.
Related objective: 4.4

== Iteration 6, Weeks 21-24: Stabilize the Feature
The final iteration focuses on improving the stability, usability, and maintainability of the implemented feature.
Related objective: 4.1-4.4