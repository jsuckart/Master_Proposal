#import "/utils/todo.typ": TODO
#import "/utils/fr_qa_c.typ": FR, QA, C

= Requirements
#TODO[
  This chapter follows the Requirements Analysis Document Template in @bruegge:2010:ObjectorientedSoftwareEngineering. Important: Make sure that the whole chapter is independent of the chosen technology and development platform. The idea is that you illustrate concepts, taxonomies and relationships of the application domain independent of the solution domain! Cite @bruegge:2010:ObjectorientedSoftwareEngineering several times in this chapter.

]

This chapter specifies the requirements of the proposed presentation assessment system from the perspective of the application domain. Following the requirements analysis approach by Brügge and Dutoit @bruegge:2010:ObjectorientedSoftwareEngineering, the chapter describes the system independently of implementation technologies and distinguishes functional requirements, quality attributes, and constraints. The subsequent system models refine these requirements by describing user interactions, domain concepts, and system behavior.

== Overview
#TODO[
  Provide a short overview about the purpose, scope, objectives and success criteria of the system that you like to develop.
]
Presentation assessments represent performance-based assessment activities in which students demonstrate competencies through an oral presentation. In the context of this thesis, this process comprises the configuration of a presentation, the definition of assessment criteria, the assessment of a presentation itself, and the communication of the resulting scores and feedback to students. The proposed system aims to support this complete assessment process within a digital learning environment.

The system addresses three main objectives. First, instructors can configure presentation assessments for different assessment contexts and define the criteria used for grading. Second, instructors and tutors can conduct structured assessments based on these predefined criteria and provide corresponding feedback. Third, the system makes the resulting scores and feedback accessible within the existing course and assessment context. The system supports both individual students and teams as participants in presentation assessments. The scope focuses on the assessment and evaluation process itself rather than giving the presentation.

== Requirements
#TODO[
  If you leave out the section “Existing system”, you can rename this section into “Requirements”.
]
 == Requirements
The proposed system introduces presentation assessments as a distinct assessment concept for performance that students demonstrate during presentations. A presentation assessment defines the conditions under which a presentation is evaluated and provides a common basis for its configuration, assessment, and resulting feedback. It can exist independently at course level or complement an existing exercise when a presentation forms part of a broader assessment activity.

Instructors define the assessment structure before the presentation takes place. This structure consists of assessment criteria that specify the aspects of the presentation to be evaluated and the points available for each criterion. During the assessment, instructors or tutors evaluate the presentation according to this predefined structure and record criterion-specific scores and feedback. The individual evaluations form the presentation result, which makes both the achieved score and the corresponding feedback available to the assessed students.

This concept separates the presentation assessment itself from its particular context. The same assessment process can therefore support presentations with different purposes while maintaining a common structure for configuration, assessment, and results. The following functional requirements specify the capabilities required to support this process. The subsequent quality attributes and constraints define the properties and boundaries that apply to these capabilities.
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