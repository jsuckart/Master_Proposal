#import "/utils/todo.typ": TODO

= Objective
#TODO[ // Remove this block
  *Proposal Objective*
  - Define the main goals of your thesis clearly and concisely.
  - Start with a short overview where you enumerate the goals as bullet points, using action-oriented phrasing (e.g., 1., 2., 3., ...).
  - Avoid the gerund form for verbs (e.g., "Developing Feature XYZ") and noun phrases (e.g., "Feature XYZ Development"). Instead, use action-oriented language such as "Develop Feature XYZ", similar to how you would formulate use cases in UML use case diagrams.
  - Ensure your goals are concrete and specific, avoiding generic statements. Clearly state what you aim to achieve.
  - Expand on each goal in a dedicated subsection. Repeat the corresponding enumerated bullet point number to maintain consistency and provide at least two paragraphs explaining the goal. Focus on being precise and specific in your descriptions.
]
This thesis develops a generic presentation tracking and grading feature for Artemis. In Figure 1 you can see how the actors will be interacting with the new assessment type. 
#figure(
  image("Use Case Diagram.png", width: 50%),
  caption: [Use-Case-Diagramm für Presentation Assessments]
) The work is structured around four high-level objectives:
+ Model Presentation Assessment
+ Configure Presentation Criteria
+ Implement Presentation Workflows
+ Integrate Presentation Grading

== Model Presentations
The first objective is to introduce presentations as a generic assessment concept within Artemis. The model should be flexible enough to represent presentations that are linked to exercises, exist independently of exercises, or are part of hybrid assessment scenarios. In addition, it should support both individual and team-based settings where needed.
This objective focuses on defining the core concept and its relationships. The overall design should remain extensible to allow future assessment formats to build upon and reuse parts of the concept.

== Configure Presentation Criteria
The second objective is to enable instructors to define grading criteria for presentations. These criteria should specify which aspects are assessed and how points are awarded. Typical examples include content quality, presentation structure, technical accuracy, time management, and ability to answer questions afterwards. Since presentations can serve different educational purposes depending on the course, the criteria need to be fully configurable.

The feature should also promote transparent assessment by making the grading criteria visible during the evaluation process. This aligns with the idea that effective feedback depends on clear goals, transparent success criteria, and information about the gap between current and desired performance @PowerFeedbackJohn. Therefore, the criteria mechanism should not only support point allocation but also provide instructors and tutors with a shared and consistent assessment framework.

== Implement Presentation Workflows
The third objective is to implement workflows that allow instructors to create and manage presentations within Artemis. These workflows should integrate into the existing course and exercise administration views so that instructors can handle the entire process directly in the platform, without the need for external tools.
The interface should follow the existing design and interaction patterns of Artemis. Thereby it should provide a familiar user experience, because perceived usability  plays an important role in the effective use of educational technology and learning outcomes @vlachogianniPerceivedUsabilityEvaluation2023.

== Integrate Presentation Grading
The fourth objective is to integrate presentation results into existing Artemis grading workflows. Presentation grades should be stored consistently and made available where instructors expect assessment results. The integration should avoid duplicating grading logic and should respect existing Artemis concepts for courses, exercises, participants, teams, and results.
This objective also includes validation and testing of the implemented feature. The feature should demonstrate that instructors can complete the full workflow from configuration to grading. The final implementation should be technically robust, reusable, and extensible for later improvements.