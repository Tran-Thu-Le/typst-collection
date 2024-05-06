//-----------------------------------------------
//    Parameters 
//-----------------------------------------------

// #let (background-color, text-color) = (black, white)
#let (background-color, text-color) = (white, aqua)
#let number-of-pages = 10
#let footer_left = [Author's name]
#let footer_right = "Page " + counter(page).display("1/1",both: true)
// #footer_right = #text(fill: black)[#footer_right]



//-----------------------------------------------
//    Code for generating empty documents with lines
//-----------------------------------------------
#let footer =  context [
  #footer_left
  #h(1fr)
  #footer_right
]
#set page(
  "a4",
  flipped: true,
  fill: background-color,
  footer: footer,
)
#set text(text-color)

#for i in range(26*number-of-pages) {
  if calc.rem(i, 2)==0 {
    line(length: 100%, stroke: 0.5pt+ text-color)
  } else {
    [\ ]
  }
  if calc.rem(i, 26)==0 and i>0{
    pagebreak()
  }
}



