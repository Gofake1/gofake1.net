import Html

let minisweeper = html([
  baseHead(title: "minisweeper", styles: [.navbar, .projects]),
  body([
    navbar(),
    div([`class`("project-entry")], [
      projectHeader(title: "minisweeper", subtitle: "Minesweeper for macOS",
                    img: "/images/minisweeper_icon.png"),
      a([href("/images/minisweeper.jpg")], [
        img([src("/images/minisweeper.jpg")])
      ]),
      p([
        b(["Source code"]), " on ",
        a([href("https://github.com/Gofake1/minisweeper")], ["GitHub"]),
        ".", br,
        b(["Install"]), " from the ",
        a([href("https://itunes.apple.com/us/app/minisweeper/id1247207062")], ["Mac App Store"]),
        ".", br,
        "Or download it ",
        a([href("https://github.com/Gofake1/minisweeper/releases")], ["here"]),
        "."
      ]),
      h2(["Changelog"]),
      h4(["Version 1.0.2 - ", span([`class`("project-date")], ["17 Sep. 2018"])]),
      ul([
        li(["Dark mode support"])
      ]),
      h4(["Version 1.0.1 - ", span([`class`("project-date")], ["7 Jan. 2018"])]),
      ul([
        li(["(Fix) Values for rows and columns were switched when saved in game options"])
      ]),
      h4(["Version 1.0 - ", span([`class`("project-date")], ["8 July 2017"])])
    ])
  ])
])
