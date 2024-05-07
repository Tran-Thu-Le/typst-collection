#let title = align(center)[#text(fill: red, size: 5em, stroke: 1pt+white)[*A book's cover*]]
#let subtitle = align(center)[#text(fill: white, size: 3em, stroke: none)[_For creating Typst books_]]
#let author = align(right)[#text(fill: white, size: 2.5em, stroke: none)[By *Tran Thu Le*] #h(4em)]
#let year = align(center)[#text(fill: black, size: 1.5em, stroke: none)[_Vietnam 2023-2024_] #h(4em)]

// #let background-color = gradient.linear(..color.map.viridis, angle: 60deg).sharp(9)
// #let background-color = gradient.linear(green, white, angle: 60deg).sharp(9)
// #let background-color = gradient.radial(aqua, white).repeat(10)

#let a-cover(
  title: [*Simple Book's Cover*],
  subtitle: [A Subtitle],
  author: [Tran Thu Le],
  year: [Vietnam 2024],
  image-link: "../book-cover/imgs/euclide.png",
  color-background: gradient.linear(..color.map.viridis, angle: 60deg).sharp(9),
)= {
  box(
    width: 100%,
    height: 100%,
    // fill: gradient.linear(white, blue.lighten(20%), angle: 130deg),
    fill: color-background,
    outset: 1em,
    radius: 1em,
    stroke: 2pt + blue
    )[
    
    #v(20%)
    #align(center)[#title]

    // #v(-3em)
    #align(center)[#subtitle]

    #v(3em)
    #align(right)[#author #h(5em)]

    #align(center)[#image(image-link, width: 70%)]

    #v(1fr)

    #align(center)[#year]
  ]
}

#a-cover(
  title: text(fill: red, size: 5em, stroke: 1pt+white)[*A book's cover*],
  subtitle: text(fill: white, size: 3em, stroke: none)[_For creating Typst books_],
  author:  align(right)[#text(fill: white, size: 2.5em, stroke: none)[By *Tran Thu Le*] #h(4em)],
  year: text(fill: black, size: 1.5em, stroke: none)[_Vietnam 2024_],
  color-background: gradient.linear(..color.map.viridis, angle: 60deg).sharp(9),
)

#a-cover(
  title: text(fill: red, size: 5em, stroke: 1pt+white)[*A book's cover*],
  subtitle: text(fill: black, size: 3em, stroke: none)[_For creating Typst books_],
  author:  align(right)[#text(fill: blue, size: 2.5em, stroke: none)[By *Tran Thu Le*] #h(4em)],
  year: text(fill: black, size: 1.5em, stroke: none)[_Vietnam 2024_],
  image-link: "../book-cover/imgs/newton.png",
  color-background: gradient.linear(green.lighten(30%), white, angle: 60deg).sharp(7),
)

#a-cover(
  title: text(fill: red, size: 5em, stroke: 1pt+white)[*A book's cover*],
  subtitle: text(fill: black, size: 3em, stroke: none)[_For creating Typst books_],
  author:  align(right)[#text(fill: blue, size: 2.5em, stroke: none)[By *Tran Thu Le*] #h(4em)],
  year: text(fill: black, size: 1.5em, stroke: none)[_Vietnam 2024_],
  image-link: "../book-cover/imgs/archimedes.png",
  color-background: gradient.conic(..color.map.rainbow, center: (-10%, 30%),).sharp(13, smoothness: 30%))
)




