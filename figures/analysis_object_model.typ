#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#let line-color = luma(110)

// UML class with name, attribute, and method compartments (empty compartments stay visible)
#let cls(pos, name, label, attrs: (), methods: ()) = node(
  pos, name: label, shape: rect, stroke: 0.6pt, fill: white, inset: 0pt,
  table(
    columns: 1,
    inset: (x: 4pt, y: 3pt),
    stroke: (x, y) => if y > 0 { (top: 0.6pt) },
    align: (x, y) => if y == 0 { center } else { left },
    strong(name),
    box(height: if attrs.len() == 0 { 4pt } else { auto }, attrs.join(linebreak())),
    box(height: if methods.len() == 0 { 4pt } else { auto }, methods.join(linebreak())),
  ),
)

#let small(t) = text(size: 7pt, t)

// Association with optional multiplicities at both ends and an optional role name
#let assoc(a, b, ma: none, mb: none, role: none, pa: 0.08, pb: 0.92, ..args) = {
  edge(a, b, stroke: 0.6pt + line-color, ..args)
  if ma != none { edge(a, b, stroke: none, label: small(ma), label-pos: pa, label-side: left, ..args) }
  if mb != none { edge(a, b, stroke: none, label: small(mb), label-pos: pb, label-side: left, ..args) }
  if role != none { edge(a, b, stroke: none, label: small(role), label-pos: 0.5, label-side: left, ..args) }
}

#let analysis-object-model = {
  set text(font: "Source Sans Pro", size: 8.5pt)
  set par(leading: 0.4em, justify: false, first-line-indent: 0em)
  diagram(
    spacing: (1.0cm, 1.0cm),
    {
      cls((-0.6, 1), [Course], <course>, methods: ([getStatistics()],))
      cls((1, 0), [Exercise], <exercise>)

      cls((1, 1), [Presentation Task], <task>,
        attrs: ([title], [description], [gradingMethod], [maxPoints]),
        methods: ([update()], [recalculateScores()]))
      cls((3, 1), [Criterion], <criterion>, attrs: ([name], [description], [weight], [scale]))
      cls((4.6, 1), [Rating Level], <level>, attrs: ([description],))

      cls((-0.9, 2.3), [User], <user>)
      cls((1, 2.3), [Presentation], <presentation>,
        attrs: ([presentationDate], [language], [mode], [location], [meetingLink],
          [passed], [resultPoints], [rubricScore], [remark]),
        methods: ([grade(ratings)], [calculateScore()]))
      cls((3, 2.3), [Rating], <rating>, attrs: ([comment],))

      assoc(<course>, <task>, mb: [\*])
      assoc(<exercise>, <task>, ma: [0..1], mb: [\*], pa: 0.25)
      assoc(<task>, <criterion>, mb: [\*])
      assoc(<criterion>, <level>, mb: [\*])
      assoc(<task>, <presentation>, mb: [\*])
      assoc(<presentation>, <rating>, mb: [\*])
      assoc(<rating>, <criterion>, ma: [\*])
      assoc(<rating>, <level>, ma: [\*], corner: left)

      assoc(<presentation>, <user>, ma: [\*], role: [student], shift: -14pt)
      assoc(<presentation>, <user>, ma: [\*], mb: [0..1], role: [assessor], pb: 0.86)
      assoc(<presentation>, <user>, ma: [\*], mb: [0..1], role: [gradedBy], shift: 14pt, pb: 0.86)
    },
  )
}
