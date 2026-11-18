#import "/utils/todo.typ": TODO
#import "/utils/fr_qa_c.typ": FR, QA, C

= Requirements
#TODO[
  This chapter follows the Requirements Analysis Document Template in @bruegge:2010:ObjectorientedSoftwareEngineering. Important: Make sure that the whole chapter is independent of the chosen technology and development platform. The idea is that you illustrate concepts, taxonomies and relationships of the application domain independent of the solution domain! Cite @bruegge:2010:ObjectorientedSoftwareEngineering several times in this chapter.
]

This chapter specifies the requirements of the presentation assessment system from the perspective of the application domain. It follows the requirements analysis approach by Bruegge and Dutoit and describes the system independently of implementation technologies @bruegge:2010:ObjectorientedSoftwareEngineering. The chapter first outlines the purpose, scope, and objectives of the system. It then specifies functional requirements, quality attributes, and constraints, and finally refines them through scenarios, a use case model, an analysis object model, a dynamic model, and user interface mockups.

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

=== Quality Attributes
#TODO[
  List and describe all quality attributes of your system. All your quality attributes should fall into the URPS categories mentioned in @bruegge:2010:ObjectorientedSoftwareEngineering. Also mention requirements that you were not able to realize.

  You can use the QA macro to create a new quality attribute:
  #QA("Category")[Short Description]
  #QA("Category")[Short Description]
  #QA("Category")[Short Description]
]

=== Constraints

#TODO[
  List and describe all pseudo requirements of your system. Also mention requirements that you were not able to realize.

  You can use the C macro to create a new constraint:
  #C("Category")[Short Description]
  #C("Category")[Short Description]
  #C("Category")[Short Description]
]

== System Models
#TODO[
  This section includes important system models for the requirements.
]

=== Scenarios
#TODO[
  If you do not distinguish between visionary and demo scenarios, you can remove the two subsubsections below and list all scenarios here.

  *Visionary Scenarios*
  Describe 1-2 visionary scenario here, i.e. a scenario that would perfectly solve your problem, even if it might not be realizable. Use free text description.

  *Demo Scenarios*
  Describe 1-2 demo scenario here, i.e. a scenario that you can implement and demonstrate until the end of your thesis. Use free text description.
]

=== Use Case Model
#TODO[
  This subsection should contain a UML Use Case Diagram including roles and their use cases. You can use colors to indicate priorities. Think about splitting the diagram into multiple ones if you have more than 10 use cases. *Important:* Make sure to describe the most important use cases using the use case table template (./tex/use-case-table.tex). Also describe the rationale of the use case model, i.e. why you modeled it like you show it in the diagram.

]

=== Analysis Object Model
#TODO[
  This subsection should contain a UML Class Diagram showing the most important objects, attributes, methods and relations of your application domain including taxonomies using specification inheritance (see @bruegge:2010:ObjectorientedSoftwareEngineering). Do not insert objects, attributes or methods of the solution domain. *Important:* Make sure to describe the analysis object model thoroughly in the text so that readers are able to understand the diagram. Also write about the rationale how and why you modeled the concepts like this.

]

=== Dynamic Model
#TODO[
  This subsection should contain dynamic UML diagrams. These can be a UML state diagrams, UML communication diagrams or UML activity diagrams.*Important:* Make sure to describe the diagram and its rationale in the text. *Do not use UML sequence diagrams.*
]

=== User Interface
#TODO[
  Show mockups of the user interface of the software you develop and their connections / transitions. You can also create a storyboard. *Important:* Describe the mockups and their rationale in the text.
]
