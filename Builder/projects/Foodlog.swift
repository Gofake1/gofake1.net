import Html

let foodlog = baseHtml([
  baseHead(title: "Foodlog", styles: [.gallery, .navbar, .projects]),
  body([
    navbar(),
    div([`class`("project-entry")], [
      projectHeader(title: "Foodlog", subtitle: "Simple nutrition journal",
                    img: "/images/foodlog_icon.png"),
      galleryX(imgs, thumbs),
      appStore("https://itunes.apple.com/us/app/foodlog-health-app/id1260408472"),
      p([
        b(["Source code"]), " on ",
        a([href("https://github.com/Gofake1/Foodlog")], ["GitHub"]), "."
      ]),
      p([
        "If you're looking for nutrition facts, try out the USDA databases: ",
        a([href("https://ndb.nal.usda.gov/ndb/search/list")], ["one"]),
        ", ",
        a([href("https://reedir.arsnet.usda.gov/codesearchwebapp")], ["two"]),
        "."
      ]),
      h2([id("privacy")], ["Privacy"]),
      a([href("https://apple.com/privacy/approach-to-privacy/")],
        ["According to Apple"]),
      """
      , data synced to iCloud is encrypted and cannot be read by Apple or \
      third parties. Crashes and energy reports may be collected by Apple \
      if allowed by the user.
      """,
      h2(["Support"]),
      h4(["How do I input a fraction for the serving amount?"]),
      """
      Select the fraction option, and enter a "." for the separator. It \
      will be replaced with a "/" when you leave the text field.
      """,
      h4(["How do I edit foods and tags?"]),
      "Long press the food or tag in the search results list.",
      h4(["Why can't I input a percentage value for Vitamins A, D, or E?"]),
      """
      The iOS Health app expects values in grams, while the Daily Value \
      percentage for Vitamins A, D, and E are represented as International \
      Units. Converting from IU to grams is not straightforward, so \
      currently Foodlog only supports values in mcg.
      """,
      h4(["How do I contact the developer?"]),
      a([href("mailto:david@gofake1.net")], ["david@gofake1.net"]),
      ". I'm always open to feedback, feature requests, and bug reports.",
      h2(["Changelog"]),
      h4(["Version 1.0.1 - ", span([`class`("project-date")], ["4 Aug. 2018"])]),
      ul([
        li(["(Fix) Crash when changing food name while editing food entry"]),
        li(["(Fix) Unable to change food name while adding food"]),
        li(["(Fix) Crash when adding or editing food entry in certain situations"]),
        li(["(Fix) Incorrect conversion from SI to customary units"])
      ]),
      h4(["Version 1.0 - ", span([`class`("project-date")], ["10 July 2018"])]),
      ul([
        li(["Add food entries"]),
        li(["Tag food entries and foods"]),
        li(["Search by food or tag"]),
        li(["Works with Health app on iOS"]),
        li(["Syncs with iCloud"])
      ])
    ]),
    footer(["© 2018 David Wu. App Store is a registered trademark of Apple Inc."])
  ])
])

private let imgs = (1...5).map { "/images/foodlog_screen_\($0).png" }
private let thumbs = (1...5).map { "/images/foodlog_screen_thumb_\($0).png" }
