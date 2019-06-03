import Html

let nightlight = baseHtml([
  baseHead(title: "Nightlight", styles: [.gallery, .navbar, .projects]),
  body([
    navbar(),
    div([`class`("project-entry")], [
      projectHeader(title: "Nightlight",
                    subtitle: "Safari extension for dealing with bright webpages",
                    img: "/images/nightlight_icon.png"),
      galleryX([
        "/images/nightlight_hero.jpg",
        "/images/nightlight_settings.jpg"], [
        "/images/nightlight_hero_thumb.jpg",
        "/images/nightlight_settings_thumb.jpg"
      ]),
      p([
        b(["Source code"]), " on ",
        a([href("https://github.com/Gofake1/Nightligh")], ["GitHub"]),
        ".", br,
        b(["Install"]), " from the ",
        a([href("https://itunes.apple.com/us/app/nightlight-for-safari/id1429386865")], ["Mac App Store"]),
        ".", br,
        "Or download it ",
        a([href("https://github.com/Gofake1/Nightlight/releases")], ["here"]),
        ".", br,
        span([id("bookmarklet")], [
          b(["Mobile"]), " users can save the ",
          a([href("/files/nightlight_bookmarklet.txt")], ["bookmarklet"]), "."
        ])
      ]),
      p([
        "Enable Nightlight by checking the box in Safari ",
        .raw("&rsaquo;"), " Preferences ", .raw("&rsaquo;"), " Extensions ."
      ]),
      p(["Bug reports and feedback are welcome via email."]),
      h2([id("privacy")], ["Privacy"]),
      p(["Crashes and energy reports may be collected by Apple if allowed by the user."]),
      h2([id("changelog")], ["Changelog"]),
      h4(["Version 1.3 - ", span([`class`("project-date")], ["2 Jun. 2019"])]),
      ul([
        li(["Don't darken iframes"]),
        li(["Lighten selection color instead of darken (WIP)"]),
        li(["Improved border colors"]),
        li(["(Fix) Custom and Sunrise timers worked inconsistently"])
      ]),
      h4(["Version 1.2.1 - ", span([`class`("project-date")], ["27 Oct. 2018"])]),
      ul([
        li(["Added File menu item to empty cache"]),
        li(["(Fix) Some background images weren't displayed; you may need to empty the cache."])
      ]),
      h4(["Version 1.2 - ", span([`class`("project-date")], ["18 Oct. 2018"])]),
      ul([
        li(["New mode: Match System Appearance (requires macOS 10.14)"]),
        li(["Added button to refresh enabled status"]),
        li(["Added label explaining how to enable Nightlight"]),
        li(["Handle inline bgcolor attributes"]),
        li(["Handle font color attributes"]),
        li(["Handle background-image gradients"]),
        li(["(Fix) Style sheets with multiple media types weren't processed"]),
        li(["(Fix) Background colors were sometimes darkened too much and became black"]),
        li(["(Fix) Imported cross-origin style sheets weren't processed"]),
        li(["(Fix) Processed style sheets could be processed again, resulting in even darker colors"])
      ]),
      h4(["Version 1.1 - ", span([`class`("project-date")], ["7 Oct. 2018"])]),
      ul([
        li(["Handle cross-origin style sheets"]),
        li(["Handle inline style attributes"]),
        li(["Handle SVG fill attributes"]),
        li(["Handle dynamically loaded styles and nodes"]),
        li(["No longer darken or invert images"])
      ]),
      h4(["Version 1.0.2 - ", span([`class`("project-date")], ["25 Sep. 2018"])]),
      ul([
        li(["Darken page before it finishes loading"]),
        li(["(Fix) Embedded frames were not being darkened in v1.0.1"])
      ]),
      h4(["Version 1.0.1 - ", span([`class`("project-date")], ["24 Sep. 2018"])]),
      ul([
        li(["Dark mode support"]),
        li(["Set background color to black for canvas elements"]),
        li(["Invert color for SVG elements"])
      ]),
      h4(["Version 1.0 - ", span([`class`("project-date")], ["7 Sep. 2018"])]),
      ul([
        li(["Now a native Safari App Extension"]),
        li(["Redesigned popover"]),
        li(["Better darkening process"]),
        li([
          "Removed features:",
          ul([
            li(["Aggressive mode"]),
            li(["Blacklist"]),
            li(["Hotkeys"])
          ])
        ])
      ]),
      h4(["Version 0.1.7 - ", span([`class`("project-date")], ["Cancelled"])]),
      ul([
        li([
          """
          The "live-updating" default behavior introduced in 0.1.6 was a \
          poor decision in hindsight. Version 0.1.7 inverts the "observe" \
          list into the "don't observe" list; use this list for video sites.
          """
        ])
      ]),
      h4(["Version 0.1.6 - ", span([`class`("project-date")], ["14 Nov. 2017"])]),
      ul([
        li([
          "Change default behavior regarding ",
          a([href("/blog/nightlight_mutation_observer.html")], ["live updating"]),
          """
          . In practical terms, you should be able to use Nightlight on \
          pages with video players without excessive CPU usage, but sites \
          that dynamically add content (e.g. "infinite scrolling") won't \
          have the new content darkened unless you add those sites to the \
          "Observe" list.
          """
        ]),
        li([
          "Override text and border colors marked as ",
          code(["!important"])
        ]),
        li(["New hotkey option (", .raw("&#x21E7;&#x2318;F)")]),
        li(["Allow whitespace in option lists for separating entries"])
      ]),
      h4(["Version 0.1.5 - ", span([`class`("project-date")], ["11 July 2017"])]),
      ul([
        li([
          "Match ", code(["<div>"]), " and ", code(["<span>"]),
          " border color with text color"
        ]),
        li([
          "Aggressive Mode now removes ", code(["<div>"]), " and ",
          code(["<span>"]), " borders"
        ]),
        li(["More hotkey options (", .raw("&#x2303;N and &#x2303;O"), ")"]),
        li(["New bookmarklet"]),
        li(["(Fix) Regression in v0.1.4 broke blacklist and aggressive list"])
      ]),
      h4(["Version 0.1.4 - ", span([`class`("project-date")], ["2 June 2017"])]),
      ul([
        li(["Ignore specific tabs"]),
        li(["Aggressive Mode"]),
        li(["(Fix) Crash if Aggressive list or Blacklist are empty"])
      ]),
      h4(["Version 0.1.3 - ", span([`class`("project-date")], ["31 May 2017"])]),
      ul([
        li(["Toggle Nightlight on/off using hotkey (", .raw("&#x2325;N or &#x2325;O"), ")"])
      ]),
      h4(["Version 0.1.2 - ", span([`class`("project-date")], ["11 May 2017"])]),
      ul([
        li(["Override colors marked as ", code(["!important"])])
      ]),
      h4(["Version 0.1.1 - ", span([`class`("project-date")], ["6 Oct. 2016"])]),
      h4(["Version 0.1 - ", span([`class`("project-date")], ["23 Sep. 2016"])])
    ])
  ])
])
