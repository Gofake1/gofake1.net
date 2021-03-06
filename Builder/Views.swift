import Html

func aImg(_ src: String) -> Node {
  return a([href(src)], [img([Html.src(src)])])
}

func appStore(_ url: String) -> Node {
  return div([style("margin-top: 1em; text-align: center;")], [
    a([href(url)], [img([src("/images/app_store_badge.svg")])])
  ])
}

func baseHead(title: String, styles: [Style],
              content: [ChildOf<Tag.Head>] = [])
-> ChildOf<Tag.Html> {
  return head(title: title, content: [
    link([
      rel(.init(rawValue: "mask-icon")), href("/images/safari-pinned-tab.svg"),
      .init("color", "#383838")
    ]),
    meta(contentType: .html),
    meta(name: "viewport", content: "width=device-width, initial-scale=1"),
    style([.base] + styles)
  ] + content)
}

func baseHtml(_ content: [ChildOf<Tag.Html>]) -> Node {
  return html([lang(.en)], content)
}

func footer(_ content: [Node]) -> Node {
  return div([style("font-size: 12px; text-align: center;")], content)
}

func galleryX(_ imgs: [String], _ thumbs: [String]) -> Node {
  return div([`class`("gallery-x")], zip(imgs, thumbs).map {
    div([`class`("gallery-item")], [a([href($0)], [img([src($1)])])])
  })
}

func macAppStore(_ url: String) -> Node {
  return div([style("margin-top: 1em; text-align: center;")], [
    a([href(url)], [img([src("/images/mac_app_store_badge.svg")])])
  ])
}

func navbar(selection: NavbarSelection = .none) -> Node {
  let selected: (NavbarSelection) -> [Attribute<Tag.A>] = {
    selection == $0 ? [`class`("selected")] : []
  }
  return div([`class`("navbar")], [
    h3([`class`("logo")], [
      a([href("/")], ["Gofake1"])
    ]),
    ul([
      li([a(selected(.blog) + [href("/blog/")], ["Blog"])]),
      li([a(selected(.projects) + [href("/projects/")], ["Projects"])]),
      li([
        a([href("mailto:david@gofake1.net")], ["Email"]),
        " (", a([href("/files/gofake1_pub.asc")], ["pgp"]), ")"
      ])
    ])
  ])
}

func projectHeader(title: String, subtitle: String, img: String) -> Node {
  return div([`class`("project-header")], [
    div([`class`("project-text-wrapper")], [
      h1([.text(title)]),
      h3([.text(subtitle)])
    ]),
    div([`class`("project-appicon-wrapper")], [
      Html.img([`class`("project-appicon"), src(img)])
    ])
  ])
}
