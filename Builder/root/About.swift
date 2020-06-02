import Html

let about = baseHtml([
  baseHead(title: "Gofake1 - About", styles: [.about, .navbar]),
  body([
    navbar(),
    div([`class`("about")], [
      h3(["About"]),
      p([
        "I'm David Wu, iOS/macOS/web developer in Atlanta.", br, "Contact me at ",
        a([href("mailto:david@gofake1.net")], ["david@gofake1.net"]), "."
      ]),
      h4(["Education"]),
      p(["Computer Science, B.S, University of Notre Dame"]),
      h4(["Projects"]),
      p(["I designed and implemented:"]),
      ul([
        li([a([href("/projects/nightlight.html")], ["Nightlight"])]),
        li([a([href("/projects/lifx_remote.html")], ["Remote Control for LIFX"])]),
        li([a([href("/projects/foodlog.html")], ["Foodlog"])])
      ]),
      p(["See more on ", a([href("https://github.com/Gofake1")], ["GitHub"]), "."]),
      hr,
      p([style("margin: revert")], ["Résumé available on request."])
    ])
  ])
])
