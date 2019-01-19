import Html

let lifxRemote = html([
  baseHead(title: "Remote Control for LIFX", styles: [.navbar, .projects]),
  body([
    navbar(),
    div([`class`("project-entry")], [
      div([style("border-style: solid; border-color: gray; border-width: 2px; padding: 1em;")],
          ["This project is unmaintained"]),
      projectHeader(title: "Remote Control for LIFX",
                    subtitle: "Control LIFX Lightbulbs from your Mac",
                    img: "/images/lifx_remote_icon.png"),
      a([href("/images/lifx_remote_hero.jpg")], [
        img([src("/images/lifx_remote_hero.jpg")])
      ]),
      macAppStore("https://itunes.apple.com/us/app/remote-control-for-lifx/id1182646052"),
      p([
        b(["Source code"]), " on ",
        a([href("https://github.com/Gofake1/Remote-Control-for-LIFX")], ["GitHub"]),
        "."
      ]),
      p([
        "Remote Control for LIFX is a handy way of controlling your LIFX lightbulbs.",
        br,
        "It is designed to blend in with the rest of the status bar."
      ]),
      h2(["Support"]),
      h4(["How do I use Remote Control for LIFX?"]),
      """
      Remote Control for LIFX will automatically find all lightbulbs on \
      your local network when it is launched. You can also manually \
      rediscover lightbulbs in Preferences.
      """,
      img([src("/images/lifx_remote_help.png")]),
      p([
        """
        Remote Control for LIFX puts a menu item in your Mac status menu. \
        Your lightbulbs will appear in that status menu. From there you can \
        quickly change bulb brightness by dragging the slider, and power by \
        clicking the power button. To change the color or view bulb details, \
        click the bulb's name to access the HUD.
        """
      ]),
      h4(["Why aren't my lightbulbs discoverable?"]),
      "There are a few requirements that need to be met for Remote Control to work:",
      ul([
        li(["Remote Control requires port 56700 on your Mac"]),
        li(["LIFX bulbs require an IPv4 address, and need to be on the same network as your Mac"]),
        li(["LIFX Original 1000 bulbs must be on firmware version 2 or higher"]),
        li(["Your router must allow UDP broadcast"])
      ]),
      "There are some limitations:",
      ul([
        li(["Infrared control is not supported"]),
        li(["MultiZone lights (e.g. LIFX Z) are not supported"])
      ]),
      h4(["How do I contact the developer?"]),
      "Open an issue on ",
      a([href("https://github.com/Gofake1/Remote-Control-for-LIFX")], ["GitHub"]),
      ".",
      h2(["Changelog"]),
      h4(["Version 1.5.1 - ", span([`class`("project-date")], ["29 Oct. 2017"])]),
      ul([
        li(["(Fix) Crash when opening Preferences on macOS 10.11"])
      ]),
      h4(["Version 1.5 - ", span([`class`("project-date")], ["26 Oct. 2017"])]),
      ul([
        li([
          "Key bindings",
          img([src("/images/lifx_remote_key_bindings.png")])
        ])
      ]),
      h4(["Version 1.4 - ", span([`class`("project-date")], ["21 July 2017"])]),
      ul([
        li([
          "Improved Menu UI",
          img([src("/images/lifx_remote_1-3_to_1-4.png")])
        ])
      ]),
      h4(["Version 1.3.1 - ", span([`class`("project-date")], ["18 May 2017"])]),
      ul([
        li(["HUD color wheel supports dragging"])
      ]),
      h4(["Version 1.3 - ", span([`class`("project-date")], ["5 Feb. 2017"])]),
      ul([
        li(["Adjust color temperature in the HUD"]),
        li(["Choose which groups and devices to show in the menu"]),
        li(["Display LIFX bulb IP address"]),
        li(["Acknowledge third-party libraries"])
      ]),
      h4(["Version 1.2 - ", span([`class`("project-date")], ["28 Jan. 2017"])]),
      ul([
        li(["Create 'Groups' of LIFX bulbs"]),
        li(["New Preferences window"]),
        li(["Refined HUD window"]),
        li(["HUD windows now open from the top left instead of top right"]),
        li(["Persist state across launches"]),
        li(["Disable highlighting on mouseover in menu"])
      ]),
      h4(["Version 1.1 - ", span([`class`("project-date")], ["11 Dec. 2016"])]),
      ul([
        li(["More reactive interface"]),
        li(["HUD color wheel is now a wheel"]),
        li(["HUD Wifi status is more intuitive"]),
        li(["Click the LIFX bulb's name to access its HUD"]),
        li(["Click the color indicator in a menu item to turn the LIFX bulb on/off"])
      ]),
      h4(["Version 1.0 - ", span([`class`("project-date")], ["3 Dec. 2016"])]),
      ul([
        li(["Discover LIFX bulbs automatically"]),
        li(["Manually discover bulbs in Preferences"]),
        li(["Change a bulb's brightness from its menu item"]),
        li(["Change a bulb's color from its HUD"])
      ])
    ]),
    footer([
      """
      © 2016-2018 David Wu. Mac App Store is a registered trademark of Apple, \
      Inc. LIFX is a registered trademark of LiFi Labs, Inc.
      """
    ])
  ])
])
