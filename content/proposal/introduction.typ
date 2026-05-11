#import "/utils/todo.typ": TODO


= Introduction
Over the recent years, digital learning platforms became important tools for organizing teaching, learning, and assessment in higher education. They can provide course material, structure learning activities/excercises and individually adapt to students needs and thereby improve learning outcomes @st-hilaireComparativeStudyLearning2021.

Artemis is an interactive learning platform developed at the Technical University of Munich. It supports automated and manual assessment workflows for different exercise types and provides immediate feedback in programming education. The platform is used to manage courses, exercises, exams, submissions, and grading processes. Its architecture is based on a Spring Boot server and an Angular client, which makes it possible to extend the system with additional assessment workflows @kruscheArTEMiSAutomaticAssessment2018. However, not all assessment tasks fit into the task types that are currently integrated into the platform. Many university courses also use oral presentations, which differ from conventional assessable submissions. These presentations help evaluate how well students can explain concepts, present project results, show design decisions, and communicate technical knowledge. Since these skills are important learning outcomes in many computer science related fields, presentation assessments should also be supported within Artemis.


