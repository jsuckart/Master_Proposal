#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

// Stick figure for a UML actor
#let actor(name) = box(width: 1.6cm, align(center, stack(
  dir: ttb,
  spacing: 3pt,
  box(width: 0.9cm, height: 1.35cm, {
    place(dx: 0.3cm, dy: 0cm, circle(radius: 0.15cm, stroke: 0.6pt))
    place(line(start: (0.45cm, 0.3cm), end: (0.45cm, 0.85cm), stroke: 0.6pt))
    place(line(start: (0.1cm, 0.5cm), end: (0.8cm, 0.5cm), stroke: 0.6pt))
    place(line(start: (0.45cm, 0.85cm), end: (0.15cm, 1.3cm), stroke: 0.6pt))
    place(line(start: (0.45cm, 0.85cm), end: (0.75cm, 1.3cm), stroke: 0.6pt))
  }),
  name,
)))

// Fill for use cases whose requirements the system does not fulfill yet or only partially
#let open = luma(215)

#let uc(pos, label, name, fill: white) = node(
  pos, align(center, label), name: name,
  shape: fletcher.shapes.ellipse, stroke: 0.6pt, fill: fill,
  width: 3.8cm, height: 1cm, inset: 2pt,
)

#let extend(from, to) = edge(from, to, "-straight", stroke: (dash: "dashed", thickness: 0.6pt, paint: luma(110)),
  label: text(size: 7.5pt)[«extend»], label-side: center, label-fill: white)

#let use-case-diagram = {
  set text(font: "Source Sans Pro", size: 8.5pt)
  set par(leading: 0.45em, justify: false, first-line-indent: 0em)
  diagram(
    spacing: (0.7cm, 0.45cm),
    edge-stroke: 0.6pt + luma(110),
    {
      // Actors
      node((-0.9, 1.1), actor[Instructor], name: <instructor>, stroke: none)
      node((-0.9, 4.7), actor[Tutor], name: <tutor>, stroke: none)
      node((3.1, 3), actor[Student], name: <student>, stroke: none)

      // Configuration
      uc((0.6, 0), [Create Presentation Task], <create>)
      uc((2, 0.9), [Define Rubric], <rubric>)
      uc((0.6, 2.2), [Manage Presentation \ Tasks], <manage>)

      // Organization and assessment
      uc((0.6, 3.5), [Schedule Presentation], <schedule>)
      uc((0.6, 4.7), [Assess Presentation], <assess>)
      uc((2, 5.6), [Assess Team \ Presentation], <team>, fill: open)
      uc((0.6, 6.5), [Monitor Assessment \ Progress], <monitor>)

      // Students
      uc((2, 2.4), [Submit Presentation \ Material], <submit>, fill: open)
      uc((2, 3.6), [View Presentation \ Result], <view>, fill: open)

      // System boundary
      node(enclose: ((0.6, 0), (2, 6.5), <create>, <monitor>, <team>, <rubric>),
        inset: 14pt, stroke: 0.6pt, snap: false,
        align(top + center, move(dy: -12pt, strong[Presentation Assessment Feature])))

      // Associations
      edge(<instructor>, <create>)
      edge(<instructor>, <manage>)
      edge(<tutor>, <schedule>)
      edge(<tutor>, <assess>)
      edge(<tutor>, <monitor>)
      edge(<student>, <submit>)
      edge(<student>, <view>)

      // Instructor generalizes tutor
      edge(<instructor>, <tutor>, marks: (none, (inherit: "stealth", stealth: 0, angle: 30deg, size: 14, fill: white, stroke: 0.6pt)))

      // Extensions
      extend(<rubric>, <create>)
      extend(<team>, <assess>)
    },
  )
}
