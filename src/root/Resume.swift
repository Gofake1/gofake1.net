import Html

func resume(_ resume: String) -> Html.Node {
  return html([
    baseHead(title: "Gofake1 - Résumé", styles: [.navbar, .resume]),
    body([
      navbar(),
      div([`class`("resume")], try! markdown(resume) + [
        hr([]),
        p([style("margin: revert")], [
          a([href("/projects/resume.pdf")], ["PDF"])
        ])
      ])
    ])
  ])
}
