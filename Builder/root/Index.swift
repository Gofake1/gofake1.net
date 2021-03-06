import Html

func index(_ script: String) -> Node {
  return baseHtml([
    baseHead(title: "Gofake1", styles: [.index]),
    body([onresize("onresize()")], [
      div([`class`("canvas-wrap")], [canvas([id("canvas")], [])]),
      div([`class`("center")], [
        h3(["Gofake1"]),
        p([a([href("/blog/")], ["Blog"])]),
        p([a([href("/projects/")], ["Projects"])]),
        p([a([href("/about.html")], ["About"])]),
        p([
          a([href("mailto:david@gofake1.net")], ["Email"]),
          " (", a([href("/files/gofake1_pub.asc")], ["pgp"]), ")"
        ])
      ]),
      element("script", [Attribute<Tag.Script>](), [.raw(script)])
    ])
  ])
}
