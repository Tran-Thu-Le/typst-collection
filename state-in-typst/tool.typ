#let __param = state("param", 0)

#let init(param: 0) = {
  __param.update(param)
}

#let sentence = context{[The current value of parameter is #__param.get()]}