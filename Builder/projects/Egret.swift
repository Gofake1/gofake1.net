import Html

let egret = baseHtml([
  baseHead(title: "egret", styles: [.navbar, .projects]),
  body([
    navbar(),
    div([`class`("project-entry")], [
      h1([style("margin-bottom: 10px;")], ["egret"]),
      h3([style("margin-top: 0;")], ["Web mail client"]),
      aImg("/images/egret.jpg"),
      p([
        b(["Source code"]), " on ",
        a([href("https://github.com/Gofake1/egret")], ["GitHub"]), "."
      ])
    ])
  ])
])