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
This thesis develops a generic presentation assessment feature for Artemis. The feature supports workflows that instructors currently manage outside the platform, such as organizing presentations, defining grading criteria, and documenting assessment results. It also introduces new interactions between students, tutors, and instructors during the assessment process. Figure 1 shows the planned workflow and the involved user roles.
#figure(
  image("Use Case Diagram.svg", width: 50%),
  caption: [Use case diagram showing the interactions between students, tutors, and instructors with the presentation assessment feature.]
) The following three objectives structure this thesis:
+ Design Configurable Presentation Assessments in Artemis
+ Implement Structured Presentation Grading and Feedback Workflows
+ Integrate Presentation Results into Existing Artemis Grading Processes

== Design Presentation Assessments in Artemis
The first objective focuses on enabling instructors to configure presentation tasks within Artemis. 
Instructors will be able to create presentation assessments, define grading criteria, configure grading settings, and connect presentations to courses or exercises. 
The implementation will also support different presentation contexts, including standalone presentations, 
exercise-linked presentations, and hybrid assessment scenarios.

The configuration workflow will support both individual and team-based presentations. 
Figure 2 illustrates the proposed high-level class model for the presentation assessment concept. 
The design will remain flexible and extensible so that future assessment formats can reuse parts of the implementation.

#figure(
  image("Class Diagram.svg", width: 110%),
  caption: [Class diagram showing the core entities and relationships of the presentation assessment model.],
  placement: auto,
)


== Implement Grading and Feedback Workflows
The second objective focuses on the presentation assessment workflow. Instructors and tutors will be able to assess presentations 
directly within Artemis by using the previously defined grading criteria. The workflow will support entering scores and written feedback for 
individual criteria and automatically calculate the resulting assessment. This allows presentation assessments to follow a structured 
process that students can comprehend. This aligns with the idea that effective feedback depends on clear goals, transparent success criteria, 
and information about the gap between current and desired performance @PowerFeedbackJohn.

The implementation will integrate into the existing course and exercise administration interfaces of Artemis. 
The expected outcome of this objective is a structured assessment workflow that covers the complete grading process from opening an assessment to 
submitting the final result. Long-term storage and display of assessment results are not part of this objective as this falls within the scope of Objective 4.3.

== Integrate Results into the Grading Processes
The third objective focuses on integrating presentation assessment results into the existing Artemis grading and result system. 
If a presentation is linked to an exercise, the result should appear alongside or contribute to the corresponding exercise. If a presentation is standalone, the result should still remain accessible through an appropriate course-level view. Reusing established Artemis workflows and interfaces promotes consistency and contributes to a familiar user experience, which can positively influence the effective use of educational technology @vlachogianniPerceivedUsabilityEvaluation2023.

This objective covers the storage, and retrieval of presentation assessment results through the same interfaces that already handle existing exercises or data. The implementation integrates presentation assessments into existing Artemis grading functionality. Presentation assessments become a regular part of the grading infrastructure, and users can access grades and feedback without relying on separate tools or interfaces.
