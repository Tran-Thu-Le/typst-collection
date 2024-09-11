#import "@preview/cetz:0.2.2": canvas, plot
#import "@preview/cetz:0.2.2"

// define pat before importing Cetz to utilize line() of Typst before using line() of Cetz
#let pat = pattern(size: (5pt, 5pt))[
  #place(line(start: (0%, 100%), end: (100%, 0%)))
]
// Now, we can import Cetz
#import cetz.draw: circle, rect, line, content, anchor, group

#let _get-node(length: 1, cell-length: (1fr, 2fr, 2fr, 2fr)) = {
  let n = cell-length.len()
  let total = cell-length.sum()
  let cell-fraction = cell-length.map(it => it/total)
  let current-sum = 0
  let nodes = (current-sum, )
  for i in range(n) {
    current-sum += cell-fraction.at(i) 
    nodes.push(current-sum*length - cell-fraction.at(i)*length/2)
    nodes.push(current-sum*length)
  }
  return nodes
}

#let grid(i, j) = "grid."+str(i)+str(j)

#let node(point, body: "", anchor: "center", padding: 0.1em, content-radius: 0.3, name: "", hiden-stroke: none) = {
  content(point, box(inset: 0.1em)[#body], anchor: anchor, name: "cir", padding: padding)
  circle("cir", radius: content-radius, name: name, stroke: hiden-stroke)
}

#let vvline(grid-node1, grid-node2, anchor: "center", separation: 1%) = {
  let (i1, j1) = grid-node1
  let (i2, j2) = grid-node2
  if i1>0 and i2>0 {
    let p1 = (grid(i1, j1), separation/2, grid(i1 -1, j1))
    let p2 = (grid(i2, j2), separation/2, grid(i2 -1, j2))
    line(p1, p2)
    let p1 = (grid(i1, j1), - separation/2, grid(i1 -1, j1))
    let p2 = (grid(i2, j2), - separation/2, grid(i2 -1, j2))
    line(p1, p2)
  } else {
    content((0, 0), "error")
  }
}

#let anchor-grid(
  table-width: 6,
  table-height: 3,
  cell-width: (0.6fr, 2fr, 2fr, 2fr),
  cell-height: (2fr, 1fr, 1fr),
  content-radius: 0.13,
  hiden-stroke: none,
  axis-tick-color: gray,
  stroke-style: black,
) = {
  import cetz.draw: circle, rect, line, content, anchor, group
  let x-pos = _get-node(length: table-width, cell-length: cell-width)
  let y-pos = _get-node(length: table-height, cell-length: cell-height)
  let n=x-pos.len() // {0, ...., 2 *num-cols}
  let m=y-pos.len() // {0, ...., 2 *num-rows}

  // ------- create anchors of grid
  group(name: "grid", {
    for i in range(n) {
      for j in range(m) {
        anchor(str(i)+str(j), (x-pos.at(i), y-pos.at(j)))
        if i==0 and j==0 {
          content((x-pos.at(i), y-pos.at(j)), text(fill: axis-tick-color, size: 10pt, $0$), anchor: "north-east", padding: 0.05)
        } else if i==0 {
          content((x-pos.at(i), y-pos.at(j)), text(fill: axis-tick-color, size: 10pt, $#j$), anchor: "east", padding: 0.05)
        } else if j==0 {
          content((x-pos.at(i), y-pos.at(j)), text(fill: axis-tick-color, size: 10pt, $#i$), anchor: "north", padding: 0.05)
        }
      }
    }
  })

  // ------- draw lines
  line("grid.20", "grid.2"+str(m -1))
  for k in range(m) {
    if calc.even(k) {
      line(grid(0, k), grid(n -1, k), stroke: stroke-style)
    }
  }
  for h in range(n) {
    if h in (0, 2, n - 1) {
      line(grid(h, 0), grid(h, m -1), stroke: stroke-style)
    } else if calc.even(h) {
      // line(grid(h, 0), grid(h, m -1), stroke: hiden-stroke)
    }
  }

}

// ------- EXAMPLE
#canvas({
  import cetz.draw: circle, rect, line, content, anchor, group
  anchor-grid(
    table-width: 16,
    table-height: 4,
    cell-width: (0.6fr, 2fr, 2fr, 2fr),
    cell-height: (3fr, 1fr, 1fr),
    axis-tick-color: gray,
    stroke-style: black,
  )

  node(grid(1, 5), body: $x$)
  node(grid(2, 5), body: $-oo$, anchor: "west")
  node(grid(4, 5), body: $-1$, anchor: "center")
  node(grid(6, 5), body: $1$, anchor: "center")
  node(grid(8, 5), body: $+oo$, anchor: "east")

  node(grid(1, 3), body: $y'$)
  node(grid(5, 3), body: $+$, anchor: "center")
  node(grid(6, 3), body: $0$, anchor: "center")
  node(grid(7, 3), body: $-$, anchor: "center")

  node(grid(1, 1), body: $y$, anchor: "center")
  node((grid(6, 0), 100%, grid(6,2)), body: $10$, name: "r2", anchor: "north-east", padding: 0.1)
  node(grid(4, 0), body: $-oo$, name: "r1", anchor: "south-west")
  node((grid(6, 0), 50%, grid(6,2)), body: $2$, name: "r3", anchor: "west", padding: 0.1)
  node(grid(8, 0), body: $-oo$, name: "r4", anchor: "south-east")

  rect(grid(2, 0), grid(4, 2), fill: pat, stroke: none)
  rect(grid(2, 2), grid(4, 4), fill: pat, stroke: none)
  vvline((6, 0), (6, 2), separation: 5%)
  line("r1", "r2", mark: (end: ">"))
  line("r3", "r4", mark: (end: ">"))


})
















