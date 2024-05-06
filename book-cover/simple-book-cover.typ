#let title = align(center)[#text(fill: red, size: 5em, stroke: 1pt+black)[*A book's cover*]]
#let subtitle = align(center)[#text(fill: red, size: 3em, stroke: none)[_For creating Typst books_]]
#let author = align(right)[#text(fill: blue, size: 2.5em, stroke: none)[By *Tran Thu Le*] #h(4em)]
#let year = align(center)[#text(fill: blue, size: 1.5em, stroke: none)[_Vietnam 2023-2024_] #h(4em)]

#box(
  width: 100%,
  height: 100%,
  fill: gradient.linear(white, aqua, angle: 130deg),
  outset: 1em,
  radius: 1em,
  stroke: 2pt + gradient.linear(..color.map.viridis,) )[
  
  #v(25%)
  #title

  #v(-3em)
  #subtitle

  #v(3em)
  #author

  #v(1fr)

  #year
]
