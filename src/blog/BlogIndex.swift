import Html

func blogIndex(_ posts: [BlogLi]) -> Html.Node {
  return baseHtml([
    baseHead(title: "Gofake1 - Blog", styles: [.list, .navbar], content: [
      link([
        href("feed.atom"),
        .init("type", "application/atom+xml"),
        rel(.alternate),
        title("Gofake1 - Blog")
      ])
    ]),
    body([
      navbar(selection: .blog),
      div([`class`("list")], [
        ul(posts.map {
          li([
            h3([a([href($0.href)], [.text($0.title)])]),
            p([.text($0.date)])
          ])
        })
      ])
    ])
  ])
}