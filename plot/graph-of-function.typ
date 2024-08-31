#import "@preview/cetz:0.2.2": canvas, plot
#import "@preview/cetz:0.2.2"
#canvas(length: 1cm, {
  import cetz.draw: *
  // content((2, 2), [Here], padding: .1)
  plot.plot(
    size: (7, 7),
    axis-style: "school-book",
    plot-style: (stroke: black),
    x-tick-step: 2, y-tick-step: 2,
    x-min: 1-5, x-max: 1+5,
    y-min: 1-5, y-max: 1+5,    
    x-grid: true, y-grid: true,
    {
      plot.add(
        style: (stroke: (paint: blue, thickness: 2pt)),
        label: $f(x) = (x-3)/(x-1)$,
        domain: (-10,0.9),
        samples: 100,        
        x => (x, (x -3)/(x - 1)),
        )
      plot.add(
        style: (stroke: (paint: blue, thickness: 2pt)),
        domain: (1.1, 10),
        samples: 100,        
        x => (x, (x -3)/(x - 1)),
        )
      plot.add(
        style: (stroke: (paint: red, dash: "dashed")),
        domain: (-10, 10),
        samples: 100,        
        x => (x, 1),
        )        
      plot.add(
        style: (stroke: (paint: red, dash: "dashed")),
        domain: (-10, 10),
        samples: 100,        
        x => (1, x),
        )
      plot.annotate({
        content((-2, 2), $f(x)$, padding: 0.5em)
      })
    })
})
