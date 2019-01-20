import Html

func projectsIndex(_ projects: [ProjectLi]) -> Html.Node {
  return baseHtml([
    baseHead(title: "Gofake1 - Projects", styles: [.list, .navbar]),
    body([
      navbar(selection: .projects),
      div([`class`("list")], [
        ul(projects.map {
          li([
            h3([a([href($0.href)], [.text($0.name)])]),
            p([.text($0.subheading)])
          ])
        })
      ])
    ])
  ])
}
