#import "/utils/todo.typ": TODO
#import "/utils/fr_qa_c.typ": FR, QA, C
#import "/figures/use_case_diagram.typ": use-case-diagram
#import "/figures/analysis_object_model.typ": analysis-object-model

= Requirements
#TODO[
  This chapter follows the Requirements Analysis Document Template in @bruegge:2010:ObjectorientedSoftwareEngineering. Important: Make sure that the whole chapter is independent of the chosen technology and development platform. The idea is that you illustrate concepts, taxonomies and relationships of the application domain independent of the solution domain! Cite @bruegge:2010:ObjectorientedSoftwareEngineering several times in this chapter.
]

This chapter specifies the requirements of the presentation assessment feature from the perspective of the application domain. It follows the requirements analysis approach by Bruegge and Dutoit and describes the system independently of implementation technologies @bruegge:2010:ObjectorientedSoftwareEngineering. The chapter first outlines the purpose, scope, and objectives of the system. It then specifies functional requirements, quality attributes, and constraints, and finally refines them through scenarios, a use case model, an analysis object model, a dynamic model, and user interface mockups.

== Overview
#TODO[
  Provide a short overview about the purpose, scope, objectives and success criteria of the system that you like to develop.
]
Presentations allow students to demonstrate different competencies. Courses that include presentations require instructors to schedule them, define how they assess them, record the results, and communicate the results to the students. The proposed system supports this complete process within the learning platform that the course already uses. Instructors and tutors organize, assess, and document presentations in one place, and students receive their results and feedback in the same environment as their other course activities.

The system addresses three main objectives. First, instructors configure presentation tasks for different contexts: a presentation task either stands alone within a course or complements an exercise. Each presentation task uses one grading method, which determines how assessors express the result. Second, tutors and instructors assess presentations according to this configuration and provide written feedback. Third, the system makes results and feedback available to the students and connects them to the existing grading of the course.

The scope covers the assessment process from the configuration of a presentation task to the communication of its result. The system supports presentations in person or online, and instructors can schedule the presentation of each student individually. Several students who present together receive individual results, which assessors can align or differentiate.

== Requirements
#TODO[
  If you leave out the section “Existing system”, you can rename this section into “Requirements”.
]
A presentation task is the central concept of the system. It defines how instructors and tutors of a course assess one kind of presentation, for example the final presentation of a project. Each presentation task belongs to a course and optionally refers to an exercise whose content the students present. A presentation is the delivery of a presentation task by one student at a specific date, in person or online, and an assessment evaluates this presentation according to the presentation task. Separating the presentation task from the individual presentations allows instructors to define the assessment once and apply it to every student who presents.

The grading method of a presentation task determines the form of the result. Pass/fail states whether a student met the requirements, a score awards points up to a defined maximum, and a rubric rates the presentation against weighted criteria on a predefined rating scale. Instructors choose the method that matches the purpose of the presentation task. Assessors then record the result in the form of this method together with written feedback. The following subsections specify the functional requirements, including those the system does not fulfill yet, the quality attributes according to the URPS categories @bruegge:2010:ObjectorientedSoftwareEngineering, and the constraints of the system.

=== Functional Requirements
#TODO[
  List and describe all functional requirements of your system. Also mention requirements that you were not able to realize. The short title should be in the form “verb objective”

  You can use the FR macro to create a new functional requirement:
  #FR("Short Title")[Short Description]
  #FR("Short Title")[Short Description]
  #FR("Short Title")[Short Description]
]

The functional requirements describe the interactions between the system and its actors: instructors, tutors, and students. FR1–FR9 cover the configuration of presentation tasks and the organization of presentations, FR10–FR14 cover the assessment, and FR15–FR16 cover the communication and integration of results. @open-goals reports which requirements the system does not fulfill yet.

#FR("Create Presentation Task")[An instructor can create a presentation task within a course and specify its title and an optional description.]
#FR("Link Presentation Task to Exercise")[An instructor can link a presentation task to an exercise of the same course. Without a link, the presentation task stands alone within the course.]
#FR("Select Grading Method")[An instructor can select one grading method for each presentation task: pass/fail, score, or rubric. The grading method remains fixed after the creation of the presentation task.]
#FR("Define Maximum Score")[An instructor can define the maximum number of points for a presentation task with the score method.]
#FR("Define Rubric")[An instructor can define the rubric of a presentation task with the rubric method. A rubric consists of weighted criteria, each with a name, an optional description, and a rating scale with optional level descriptions. The weights of all criteria sum up to 100 %.]
#FR("Adapt Rubric")[An instructor can adapt the rubric of a presentation task. Before the first assessment, the instructor can replace the complete rubric. Afterwards, the instructor can change only the texts and weights of the criteria, and the system recalculates the results of all assessed presentations.]
#FR("Manage Presentation Tasks")[An instructor can edit and delete presentation tasks and remove presentations from a presentation task.]
#FR("Schedule Presentation")[An instructor or tutor can schedule the presentation of a student for a presentation task and specify date, time, language, and whether the presentation takes place in person or online, together with the location or the meeting link.]
#FR("Submit Presentation Material")[A student can submit material for a presentation, such as slides, and assessors can access this material during the assessment.]
#FR("Assess Presentation")[An assessor can record the result of a presentation in the form of the grading method: a pass/fail decision, a number of points up to the maximum, or one rating level per criterion with an optional comment. The assessor can add a general remark as written feedback.]
#FR("Calculate Rubric Score")[The system calculates the score of a rubric assessment from the weighted rating levels and shows a preview of the score during the assessment.]
#FR("Assess Team Presentations")[An instructor or tutor can schedule one presentation for a team of students, and an assessor can assess this presentation as a whole with one shared result for all team members.]
#FR("Record Assessor")[The system records the assessor of each assessed presentation.]
#FR("Monitor Assessment Progress")[Instructors and tutors can view all presentations of a presentation task as well as a course-wide overview with the status and result of each presentation, and they can search and filter these presentations.]
#FR("View Presentation Result")[A student can view the result and the feedback of their presentations within the course.]
#FR("Integrate Results into Grading")[The result of a presentation can contribute to the overall score of the course.]

=== Quality Attributes
#TODO[
  List and describe all quality attributes of your system. All your quality attributes should fall into the URPS categories mentioned in @bruegge:2010:ObjectorientedSoftwareEngineering. Also mention requirements that you were not able to realize.

  You can use the QA macro to create a new quality attribute:
  #QA("Category")[Short Description]
  #QA("Category")[Short Description]
  #QA("Category")[Short Description]
]

The quality attributes describe how well the system fulfills its functional requirements. They follow the URPS categories by Bruegge and Dutoit: usability, reliability, performance, and supportability @bruegge:2010:ObjectorientedSoftwareEngineering. The usability attributes carry the highest priority, as the system targets an intuitive assessment workflow for instructors and tutors.

#QA("Usability")[The system follows the interaction patterns, layouts, and terminology of the learning platform, so that instructors and tutors can use it without additional training.]
#QA("Usability")[The system guides instructors step by step through the configuration of a presentation task and asks only for the information that the selected grading method requires.]
#QA("Usability")[The system validates inputs immediately and explains invalid entries, for example criterion weights that do not sum up to 100 % or points above the maximum.]
#QA("Reliability")[The system rejects changes that rely on an outdated state, so that concurrent changes to a presentation task and its assessments never produce inconsistent results, such as a score calculated with outdated weights.]
#QA("Reliability")[The system restricts every action to the roles that need it: instructors configure presentation tasks, tutors assess presentations, and students view only their own results.]
#QA("Performance")[The system remains responsive in courses with more than 2,000 students.]
#QA("Supportability")[The system allows adding further grading methods, such as custom rating scales, without changing the configuration and assessment workflow.]

=== Constraints

#TODO[
  List and describe all pseudo requirements of your system. Also mention requirements that you were not able to realize.

  You can use the C macro to create a new constraint:
  #C("Category")[Short Description]
  #C("Category")[Short Description]
  #C("Category")[Short Description]
]

The constraints describe conditions that the environment of the system and the scope of the thesis imposes on its realization.

#C("Implementation")[The system extends Artemis and reuses its course structure, user roles, and user interface components.]
#C("Implementation")[The realization follows the development guidelines of Artemis, including its guidelines for inclusive language and terminology.]
#C("Interface")[The system provides all texts in English and German.]
#C("Legal")[The system processes personal data according to the principle of data economy, includes presentation data in the export of personal data, and removes it together with the account of a user.]
#C("Operations")[Instructors can enable the system per course, and its introduction preserves all existing data of Artemis.]

== System Models
#TODO[
  This section includes important system models for the requirements.
]

This section refines the requirements through models of the application domain @bruegge:2010:ObjectorientedSoftwareEngineering. Scenarios illustrate the use of the system from the perspective of individual actors, and the use case model generalizes them. The analysis object model describes the concepts of the application domain and their relationships, and the dynamic model describes the lifecycle of a presentation. User interface mockups finally show how instructors and tutors interact with the system.

=== Scenarios
#TODO[
  If you do not distinguish between visionary and demo scenarios, you can remove the two subsubsections below and list all scenarios here.

  *Visionary Scenarios*
  Describe 1-2 visionary scenario here, i.e. a scenario that would perfectly solve your problem, even if it might not be realizable. Use free text description.

  *Demo Scenarios*
  Describe 1-2 demo scenario here, i.e. a scenario that you can implement and demonstrate until the end of your thesis. Use free text description.
]

A scenario describes a concrete use of the system by individual actors from their point of view @bruegge:2010:ObjectorientedSoftwareEngineering. This subsection describes one visionary scenario, which covers the complete process including the requirements that the system does not fulfill yet, and one demo scenario, which covers the requirements that the system fulfills.


#block[*Visionary Scenario*]

An instructor of a project course creates a presentation task for the final presentations, links it to the project exercise, and defines a rubric with weighted criteria. The result counts 20 % toward the overall course score. Tutors schedule one presentation per team, and the students upload their slides. During a presentation, a tutor views the slides, rates each criterion, and sees the score immediately. All team members receive the shared result, and the tutor adjusts it for one student. Each student then views the result and the feedback in the course. The result appears in the student’s overall course score.

#block[*Demo Scenario*]

An instructor creates a presentation task, links it to an exercise, and defines a rubric with three weighted criteria. A tutor schedules the presentation of a student, in person and in English. During the presentation, the tutor selects one rating level per criterion and sees a preview of the score. The tutor then adds feedback and saves the assessment, and the system records the tutor as the assessor. After the first assessments, the instructor shifts weight from one criterion to another, and the system recalculates all scores. Finally, the instructor filters the overview for unassessed presentations.

=== Use Case Model
#TODO[
  This subsection should contain a UML Use Case Diagram including roles and their use cases. You can use colors to indicate priorities. Think about splitting the diagram into multiple ones if you have more than 10 use cases. *Important:* Make sure to describe the most important use cases using the use case table template (./tex/use-case-table.tex). Also describe the rationale of the use case model, i.e. why you modeled it like you show it in the diagram.

]

@use-case-diagram shows the use case model of the system. It contains three actors: instructors configure presentation tasks, tutors organize and assess presentations, and students deliver presentations and receive their results. Instructors can perform all use cases of tutors, which the model expresses as a generalization of the actor tutor. Grey use cases correspond to requirements that the system does not fulfill yet or fulfills only partially.

#figure(
  use-case-diagram,
  caption: [Use case model of the presentation assessment feature],
) <use-case-diagram>

The use cases of the instructor cover the configuration. Create Presentation Task comprises the details, the link to an exercise, the grading method, and the maximum score for the score method (FR1–FR4). Define Rubric extends this use case if the instructor selects the rubric method (FR5). Manage Presentation Tasks covers all changes after the creation, including the adaptation of the rubric (FR6, FR7).

The use cases of the tutor follow the course of a presentation. Schedule Presentation creates the presentation of a student with its date, language, and format without entering the result yet (FR8). Assess Presentation records the result in the form of the grading method together with written feedback, and the system calculates the rubric score and records the assessor (FR10, FR11, FR13). Assess Team Presentation extends this use case to presentations of several students (FR12). Monitor Assessment Progress provides an overview of all presentations with their status and result (FR14).

Students submit material for their presentations, such as slides, and view the result and feedback of their presentations within the course (FR9, FR15).


=== Analysis Object Model
#TODO[
  This subsection should contain a UML Class Diagram showing the most important objects, attributes, methods and relations of your application domain including taxonomies using specification inheritance (see @bruegge:2010:ObjectorientedSoftwareEngineering). Do not insert objects, attributes or methods of the solution domain. *Important:* Make sure to describe the analysis object model thoroughly in the text so that readers are able to understand the diagram. Also write about the rationale how and why you modeled the concepts like this.

]

@analysis-object-model shows the analysis object model of the presentation assessment feature. It describes the concepts of the application domain, their attributes, and the operations that the use cases require @bruegge:2010:ObjectorientedSoftwareEngineering. Course, exercise, and user are existing concepts of the learning platform, and the model shows only the attributes and operations that the presentation assessment feature adds to them.

#figure(
  analysis-object-model,
  caption: [Analysis object model of the presentation assessment feature],
) <analysis-object-model>

A presentation task belongs to one course and optionally refers to one exercise. Its grading method is pass/fail, score, or rubric, and the maximum number of points applies only to the score method. For the rubric method, the presentation task holds a set of criteria, each with a name, a description, a weight, and a rating scale. The scale determines the number of rating levels of a criterion, currently three or five, and each rating level can carry a description.

A presentation is the delivery of a presentation task by one student. It holds the date, the language, the mode, and either the location or the meeting link. Depending on the grading method, the result is a pass/fail decision, a number of points, or a rubric score, and the remark holds the written feedback. For a rubric, the presentation holds one rating per criterion, which selects a rating level and can carry a comment. Each presentation refers to the user who assessed it and, if another user changed the result afterwards, to this user as well.

The operations correspond to the use cases of @use-case-diagram. The operation update() changes a presentation task, including its rubric: before the first assessment, an instructor can replace the rubric completely, and afterwards only the texts and weights of its criteria. After a change of the weights, recalculateScores() updates the rubric scores of all assessed presentations. The operation grade() records the ratings of a presentation and uses calculateScore() to derive the rubric score from the weights of the criteria and the selected rating levels. The operation getStatistics() of the course provides the overview of all presentations and their assessment status. In the implementation, services instead of the domain objects provide these operations, as @architecture describes.

=== Dynamic Model
#TODO[
  This subsection should contain dynamic UML diagrams. These can be a UML state diagrams, UML communication diagrams or UML activity diagrams.*Important:* Make sure to describe the diagram and its rationale in the text. *Do not use UML sequence diagrams.*
]

=== User Interface
#TODO[
  Show mockups of the user interface of the software you develop and their connections / transitions. You can also create a storyboard. *Important:* Describe the mockups and their rationale in the text.
]
