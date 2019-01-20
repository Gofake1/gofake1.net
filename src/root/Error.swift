import Html

func error(_ code: Int, _ message: String) -> Html.Node {
  return baseHtml([
    baseHead(title: "Gofake1 - \(code)", styles: [.navbar]),
    body([
      navbar(),
      h1([style("text-align: center;")], [.text("\(code) - \(message)")])
    ])
  ])
}
