#import "/utils/todo.typ": TODO

= Introduction
Over recent years, digital learning platforms have become important tools for supporting teaching, learning, and assessment in higher education. They provide access to learning materials, structure learning activities, and can support student engagement and learning processes @bond:2020:MappingResearchStudent.

The research group for Applied Education Technologies at the Technical University of Munich develops Artemis, an interactive learning platform. Artemis supports automated and manual assessment workflows for different exercise types and provides immediate feedback in programming education. Instructors use it to manage courses, exercises, exams, submissions, and grading processes @krusche:2018:ArTEMiSAutomaticAssessment.

== Problem
Many university courses include oral presentations as part of their coursework or exams. Presentations differ from conventional submissions: a student delivers them live at a scheduled date, and the assessment takes place during or right after the delivery. Artemis provides no dedicated support for presentations in its assessment workflow. Instructors therefore use spreadsheets, personal notes, or other external tools to organize presentations and document assessment results. These disconnected workflows separate presentation-related information from the course environment.

Instructors define assessment criteria manually, document the results, and transfer them into the course grades themselves. This increases the organizational effort and reduces transparency for students. Students have limited insight into the assessment and rely on direct communication with instructors to receive their results and feedback.

== Motivation
Assessment quality depends on transparency, alignment, and meaningful feedback. Constructive alignment emphasizes that assessment should reflect the intended learning outcomes of a course @biggs:1996:EnhancingTeachingConstructive. If oral communication, argumentation, or the presentation of technical work are intended learning outcomes, the platform should support them explicitly rather than forcing instructors into disconnected manual processes.

Well-defined and transparent assessment criteria support both the quality of assessments and the understanding of students about what instructors expect from them @jorredestjorre:2020:SharingAchievementDigital. Analytic rubrics, which divide an assessment into criteria and rating levels, help students grasp learning objectives and recognize areas that need improvement. They also contribute to more consistent and reliable grading by making complex aspects of performance easier to assess @panadero:2023:EffectsRubricsAcademic. Previous research has shown that rubric-based formative assessment can support learning processes and improve the quality of feedback students receive @nadolski:2021:RubricFormatsFormative.

For Artemis, the presentation assessment feature extends the existing assessment model and supports teaching scenarios beyond the existing exercise types. In the long term, a generic concept for presentation assessment could provide a basis for future assessment formats, such as other live, oral, or performance-based assessments.

== Objectives
This thesis develops a presentation assessment feature for Artemis and evaluates it in practice. The feature covers the workflow that instructors currently manage outside the platform, from the configuration of a presentation task to the communication of its result. Four objectives structure the thesis:

+ Design Configurable Presentation Tasks
+ Implement a Structured Assessment Workflow
+ Integrate Presentation Results into Artemis
+ Evaluate the Presentation Assessment Workflow

*Objective 1* enables instructors to configure presentation tasks within Artemis. A presentation task either stands alone within a course or is linked to an exercise. Each presentation task uses one of three grading methods: pass/fail, score, or rubric. A rubric consists of weighted criteria, each with a scale of rating levels. Instructors and tutors schedule the presentation of each student individually, online or in person.

*Objective 2* provides the assessment workflow. Assessors record the result of a presentation according to its grading method and add written feedback. For a rubric, the assessor selects one rating level per criterion, and the system calculates the score from the weighted rating levels. This structure makes the assessment comprehensible for students and follows the idea that effective feedback depends on clear goals, transparent criteria, and information about the gap between current and desired performance @hattie:2007:PowerFeedback. Instructors and tutors monitor the progress of all assessments in an overview of the course.

*Objective 3* connects the results to the existing environment of Artemis. Students view the result and the feedback of their presentations within the course, and the results contribute to the grading of the course. Reusing established Artemis workflows and interfaces keeps the feature consistent with the rest of the platform, so that users can transfer what they already know from other parts of Artemis @polson:1986:TestCommonElements. The perceived usability of educational technology matters, because a user-friendly interface lets students and teachers focus on the learning content instead of the system @vlachogianni:2023:PerceivedUsabilityEvaluation.

*Objective 4* evaluates the presentation assessment workflow in a case study, in which tutors use the feature to assess presentations in a university course. A questionnaire and semi-structured interviews address three research questions:

- *RQ1:* How do tutors perceive the usability of the presentation assessment workflow in Artemis when assessing presentations in a course?
- *RQ2:* How do tutors perceive the usefulness of the presentation assessment workflow and its integration into Artemis compared with their previous assessment practices?
- *RQ3:* Which usability issues, workflow limitations, and opportunities for improvement do tutors encounter when using the presentation assessment workflow in practice?

== Outline
The thesis consists of seven chapters. Chapter 2 introduces the background of the thesis: Artemis, the assessment of oral presentations, rubrics and grading methods, and the concepts of usability and perceived usefulness. Chapter 3 discusses related work on rubric-based assessment in learning management systems, tools and studies on presentation assessment, and existing assessment workflows in Artemis. Chapter 4 specifies the requirements of the presentation assessment feature and models its application domain. Chapter 5 describes the architecture of the feature, from its design goals to the subsystem decomposition and the persistent data management. Chapter 6 presents the case study with tutors and answers the research questions. Chapter 7 summarizes the status of the objectives, draws conclusions, and outlines future work.
