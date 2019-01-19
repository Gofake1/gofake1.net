import Html

let error404 = html([
  baseHead(title: "Gofake1 - 404", styles: [.navbar]),
  body([navbar(), h1([style("text-align: center")], ["404 - Not Found"])])
])
