#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#let line-color = luma(110)
// Fill for activities whose requirements the presentation assessment feature does not fulfill yet
#let open = luma(215)
#let w = 2.3cm
#let gap = 0.35cm
#let act(pos, body, name, fill: white, width: w) = node(pos, align(center, body), name: name,
  shape: rect, corner-radius: 6pt, stroke: 0.6pt, fill: fill, width: width, inset: 5pt)
#let diamond(pos, name) = node(pos, none, name: name, shape: fletcher.shapes.diamond,
  stroke: 0.6pt, fill: white, width: 0.42cm, height: 0.42cm, inset: 0pt)
#let start(pos, name) = node(pos, none, name: name, shape: circle, fill: black, radius: 4pt, stroke: none)
#let stop(pos, name) = node(pos, circle(radius: 3pt, fill: black, stroke: none), name: name,
  shape: circle, radius: 5.5pt, stroke: 0.6pt, inset: 0pt)
#let guard(t) = text(size: 7.5pt, t)
#let flow(..args) = edge(..args, "-|>")

#let activity-diagram = {
  set text(font: "Source Sans Pro", size: 8.5pt)
  set par(leading: 0.45em, justify: false, first-line-indent: 0em)
  diagram(
    spacing: (gap, 0.5cm),
    cell-size: (w, 0.4cm),
    edge-stroke: 0.6pt + line-color,
    mark-scale: 70%,
    {
      // Empty border columns, so that the lane borders at -0.5 and 5.5 lie in the middle of a gap
      node((-1, 0), none, stroke: none)
      node((6, 0), none, stroke: none)

      // Instructor (columns 0-2)
      start((1, 0), <s>)
      act((1, 1), [Enter details of \ presentation task], <details>)
      act((1, 2), [Select grading \ method], <method>)
      diamond((1, 3), <d1>)
      act((0, 4), [Define maximum \ points], <points>)
      act((2, 4), [Define rubric], <rubric>)
      diamond((1, 5), <m1>)

      // Tutor (column 3)
      act((3, 6), [Schedule \ presentation], <schedule>)
      act((3, 9), [Assess \ presentation], <assess>)
      diamond((3, 10), <d2>)

      // System (column 4)
      act((4, 11), [Calculate \ rubric score], <calc>)

      // Student (column 5)
      act((5, 7), [Submit presentation \ material], <submit>, fill: open)
      act((5, 8), [Deliver \ presentation], <deliver>)
      diamond((5, 12), <m2>)
      act((5, 13), [View result \ and feedback], <view>, fill: open)
      stop((5, 14), <e>)

      flow(<s>, <details>)
      flow(<details>, <method>)
      flow(<method>, <d1>)
      flow(<d1>, (0, 3), <points>, label: guard[\[score\]], label-pos: 0.3, label-side: right)
      flow(<d1>, (2, 3), <rubric>, label: guard[\[rubric\]], label-pos: 0.3, label-side: left)
      flow(<d1>, <m1>, label: guard[\[pass/fail\]], label-side: center, label-fill: white)
      flow(<points>, (0, 5), <m1>)
      flow(<rubric>, (2, 5), <m1>)
      flow(<m1>, (1, 6), <schedule>)
      flow(<schedule>, (3, 7), <submit>)
      flow(<submit>, <deliver>)
      flow(<deliver>, (3, 8), <assess>)
      flow(<assess>, <d2>)
      flow(<d2>, (4, 10), <calc>, label: guard[\[rubric\]], label-pos: 0.2, label-side: left)
      flow(<d2>, (3, 12), <m2>, label: guard[\[pass/fail, score\]], label-pos: 0.4, label-side: left)
      flow(<calc>, (5, 11), <m2>)
      flow(<m2>, <view>)
      flow(<view>, <e>)

      // Swimlanes
      let lane(a, b, title) = node(enclose: ((a - 0.5, -1.3), (b + 0.5, 14.6)), stroke: 0.6pt, snap: false,
        inset: 0pt, align(top + center, move(dy: 4pt, strong(title))))
      lane(0, 2, [Instructor])
      lane(3, 3, [Tutor])
      lane(4, 4, [System])
      lane(5, 5, [Student])
    },
  )
}
