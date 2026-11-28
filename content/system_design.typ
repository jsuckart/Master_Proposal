#import "/utils/todo.typ": TODO

= Architecture <architecture>
This chapter describes how the presentation assessment feature maps the concepts of the application domain from Chapter 4 to the solution domain. It follows the system design approach by Bruegge and Dutoit @bruegge:2010:ObjectorientedSoftwareEngineering. The chapter first gives an overview of the architecture and derives the design goals from the quality attributes and constraints. It then describes the subsystem decomposition, the persistent data management, the access control, the global software control, and the boundary conditions.

== Overview
Artemis follows a client-server architecture: an Angular web client runs in the browser and communicates through a REST interface with a Spring Boot application server, which stores its data in a relational database. The presentation assessment feature extends this architecture without adding subsystems, hardware, or software components of its own. It extends the existing server, client, and database, so this chapter omits a separate hardware/software mapping.

On the server, the feature belongs to the assessment module of Artemis, which also contains the existing functionality for results and feedback. On the client, a separate presentation module provides the user interface within the course management. Two settings control the availability of the feature: administrators activate it for the whole Artemis instance, and each course enables it separately.

== Design Goals
The design goals follow the quality attributes and constraints of Chapter 4 @bruegge:2010:ObjectorientedSoftwareEngineering. Their order reflects their priority. The thesis targets an intuitive presentation assessment workflow, so the goals that shape the interaction of instructors and tutors with the feature come first: consistency with Artemis and guided input. Consistent results and access control follow, because results document the performance of students and must remain correct and protected. Response time and extensibility come last: the feature needs to work in large courses, but the design of the workflow should not depend on future grading methods.

*DG1: Stay consistent with Artemis.* The feature reuses the user interface components, layouts, and terminology of Artemis, so that instructors and tutors who know the platform need no additional training. Its views follow existing patterns of the course management, such as tables with filters and dialogs for creating and editing entries.

*DG2: Guide and validate every input.* The client guides instructors step by step through the configuration of a presentation task, shows only the fields that the selected grading method requires, and validates inputs immediately. The server repeats every validation, such as the sum of the criterion weights or the maximum points, because requests can also reach the server without the client.

*DG3: Keep results consistent.* Results never contradict the configuration of their presentation task. The grading method stays fixed after creation, the maximum points cannot fall below an existing result, and once an assessor has assessed a presentation with the rubric, instructors can change only the texts and weights of the rubric. If the weights change, the server recalculates all rubric scores. Each presentation task also carries a version number, which every change to the presentation task or its presentations increments. The server rejects a change if another change has modified the presentation task while the server validated it. This goal takes priority over flexibility, because instructors cannot restructure a rubric in use.

*DG4: Restrict actions to roles.* Every endpoint of the server checks the course role of the user before it executes an action. Section 5.5 describes the permissions of each role.

*DG5: Respond quickly in large courses.* The server filters, sorts, and pages the overview of all presentations and calculates its statistics in a separate query, so the client never loads all presentations of a course at once. This moves query logic to the server, but it limits the transferred data to at most 100 rows per page, regardless of the course size.

*DG6: Share one workflow across grading methods.* All grading methods use the same steps for configuration, scheduling, assessment, and monitoring. Each grading method stores its result in a field of its own instead of a generic result model. A further grading method requires changes in several layers, from the database to the display of the result.

Overall, the design favors a predictable workflow over flexibility. Instructors and tutors meet familiar patterns and immediate validation, and results remain consistent with their configuration, even if a presentation task changes. The price of this prioritization is a fixed rubric structure after the first assessment and additional effort for future grading methods.

== Subsystem Decomposition
@subsystem-decomposition shows how the presentation assessment feature decomposes into subsystems, following the approach of Bruegge and Dutoit @bruegge:2010:ObjectorientedSoftwareEngineering.

#figure(
  image("/figures/subsystem_decomposition.svg", width: 100%),
  caption: [Subsystem decomposition of the presentation assessment feature],
) <subsystem-decomposition>

All three client subsystems use the Presentation API of the server. Presentation Overview shows the presentation tasks of a course, the overview of all presentations with its statistics, and the result of each presentation. Task Configuration guides instructors step by step through creating and editing a presentation task, including the definition of a rubric. Scheduling and Assessment combines the scheduling of a presentation and its assessment in one dialog and offers one rating per criterion for a rubric.

Presentation Management provides the Presentation API. It creates, changes, and deletes presentation tasks and presentations, validates every request, and checks the version of the presentation task before it stores a change. For all tasks that concern the rubric, it uses Rubric Management through the Rubric Handling interface. Rubric Management validates the criteria and weights of a rubric, restricts changes to texts and weights once an assessor has assessed a presentation with the rubric, and calculates the score of a rubric assessment from the weighted rating levels. If the weights change, it recalculates the scores of all assessed presentations. The figure omits one direct use of Rubric Management by the client: the overview and the assessment dialog load the rubric of a presentation task directly from it to display the criteria and rating levels.

Presentation Management uses three existing subsystems of Artemis. Course Management provides the settings of a course, which the feature extends with the setting that enables presentation assessments. Exercise Management finds the exercises of a course that a presentation task can link to, and User Management finds the students of a course who can deliver a presentation. Both new server subsystems store their data in the relational database of Artemis.

== Persistent Data Management
The presentation assessment feature keeps all of its data in the relational database that Artemis already uses. @persistent-data shows the entities that the feature adds or changes, together with the existing entities they reference. Artemis maps each entity to a table, and database migrations create and change these tables. PresentationAssessment stores a presentation task and PresentationAssessmentInstance a presentation, and three further entities store the criteria, rating levels, and ratings of a rubric.

#figure(
  image("/figures/persistent_data_management.svg", width: 100%),
  caption: [Persistent entities of the presentation assessment feature],
) <persistent-data>

Each presentation stores its result in the attribute of its grading method: passed for pass/fail, resultPoints for the score method, and rubricScore for a rubric. The other two attributes remain empty.

The rubric of a presentation task consists of three entities in separate tables instead of a single column with a structured document. Separate tables allow the database to enforce the structure of a rubric: unique indexes keep the positions of criteria and rating levels distinct and allow at most one rating per criterion and presentation. The position preserves the order that the instructor defines. The grading method and the rating scale are enumerations, which the database stores as text in a column of the presentation task and the criterion. The number of rating levels follows from the scale and is not stored.

The version of a presentation task detects concurrent changes, as DG3 describes. A further unique index ensures that each student has at most one presentation per presentation task. The references to the assessor and to the person who last changed the result are optional.

The database removes dependent data itself through its foreign keys, and the compositions in @persistent-data mark these dependencies. Deleting a course deletes its presentation tasks, deleting a presentation task deletes its presentations and its rubric, and deleting a presentation deletes its ratings. The server therefore deletes only the presentation task or the presentation itself and leaves the dependent rows to the database. Deleting an exercise removes only the link, so that the presentation task remains in the course as a standalone presentation task.

== Access Control
#TODO[
  Optional section describing the access control and security issues based on the quality attributes and constraints. It also de- scribes the implementation of the access matrix based on capabilities or access control lists, the selection of authentication mechanisms and the use of en- cryption algorithms.
]

== Global Software Control
#TODO[
  Optional section describing the control flow of the system, in particular, whether a monolithic, event-driven control flow or concurrent processes have been selected, how requests are initiated and specific synchronization issues
]

== Boundary Conditions
#TODO[
  Optional section describing the use cases how to start up the separate components of the system, how to shut them down, and what to do if a component or the system fails.
]
