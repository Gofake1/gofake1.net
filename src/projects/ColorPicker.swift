import Html

let colorPicker = baseHtml([
  baseHead(title: "Color Picker", styles: [.gallery, .navbar, .projects]),
  body([
    navbar(),
    div([`class`("project-entry")], [
      projectHeader(title: "Color Picker",
                    subtitle: "Color picker for macOS",
                    img: "/images/color_picker_icon.png"),
      galleryX(imgs, imgs),
      p([
        b(["Source code"]), " on ",
        a([href("https://github.com/Gofake1/Color-Picker")], ["GitHub"]), ".",
        br,
        b(["Install"]), " from the ",
        a([href("https://itunes.apple.com/us/app/color-picker-palette/id1238050457")], ["Mac App Store"]),
        ".",
        br,
        "Or download it ",
        a([href("https://github.com/Gofake1/Color-Picker/releases")], ["here"]),
        "."
      ]),
      p(["The macOS color panel has some annoying limitations:"]),
      ul([
        li(["Can only be accessed through an app that contains a color well"]),
        li(["Disappears when the app that displayed it is no longer key"]),
        li(["Can't organize your favorite colors"])
      ]),
      p([
        """
        Color Picker is meant to address those issues. It is a standalone \
        app, so it is easily accessible and always visible. Users can save \
        their favorite colors to "Palettes".
        """
      ]),
      h2(["Changelog"]),
      h4(["Version 1.1.1 - ", span([`class`("project-date")], ["17 Sep. 2018"])]),
      ul([
        li(["Dark mode support"])
      ]),
      h4(["Version 1.1 - ", span([`class`("project-date")], ["8 July 2017"])]),
      ul([
        li(["Palette window has contextual menus to edit and delete palettes"]),
        li(["Drag and drop colors from color picker and palette windows"]),
        li(["(Fix) Crash if clicked on a certain empty slot in a palette"])
      ]),
      h4(["Version 1.0.1 - ", span([`class`("project-date")], ["28 May 2017"])]),
      ul([
        li(["(Fix) Hex code input didn't set brightness slider"])
      ]),
      h4(["Version 1.0 - ", span([`class`("project-date")], ["24 May 2017"])])
    ])
  ])
])

private let imgs = (1...2).map { "/images/color_picker_\($0).jpg" }
