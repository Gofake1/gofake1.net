import Html

let resume = baseHtml([
  baseHead(title: "Gofake1 - Résumé", styles: [.navbar, .resume]),
  body([
    navbar(),
    div([`class`("resume")], [
      h3(["Résumé"]),
      p([
        "iOS/macOS developer.", br, "Contact me at ",
        a([href("mailto:david@gofake1.net")], ["david@gofake1.net"]), "."
      ]),
      h4(["Education"]),
      p(["Computer Science, B.S, University of Notre Dame"]),
      h4(["Experience"]),
      p(["I designed and implemented:"]),
      ul([
        li([a([href("/projects/nightlight.html")], ["Nightlight"])]),
        li([a([href("/projects/lifx_remote.html")], ["Remote Control for LIFX"])]),
        li([a([href("/projects/foodlog.html")], ["Foodlog"])])
      ]),
      hr([]),
      p([style("margin: revert")], [
        a([href("/files/resume.pdf")], ["PDF"])
      ])
    ])
  ])
])
