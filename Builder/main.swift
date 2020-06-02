import Foundation

struct World {
  static let srcUrl = URL(string: CommandLine.arguments[1])!
  static let dstUrl = URL(string: CommandLine.arguments[2])!
  static let fileManager = FileManager.default
  static let print = CommandLine.arguments[3...].contains("--verbose")
    ? { Swift.print($0) }
    : { _ in }
}

func setupSubdirectories() throws {
  try [
    "blog",
    "files",
    "images",
    "projects",
  ].forEach {
    let path = World.dstUrl.appendingPathComponent($0).absoluteString
    if !World.fileManager.fileExists(atPath: path) {
      try World.fileManager.createDirectory(atPath: path,
                                            withIntermediateDirectories: true)
    }
  }
}

func blog() -> [Artifact] {
  let info = [
    ("Nightlight and MutationObserver", "5 Jan. 2018",
      "nightlight_mutation_observer", "2018-01-05T04:00:00Z",
      """
      Modern web pages use a disproportionately large share of system \
      resources, so browser extensions should aim to add as little overhead \
      as possible.
      """),
    ("Foodlog 1.0", "10 July 2018", "foodlog_1", "2018-07-10T06:00:00Z",
      "Thoughts on my first iOS app."),
    ("Nightlight: Back to the Drawing Board", "9 Nov. 2018",
      "nightlight_back_to_the_drawing_board", "2018-11-09T23:00:00Z",
      "Rewriting Nightlight."),
    ("Remote Control for LIFX: Now Open Source", "12 Nov. 2018",
      "lifx_remote_open_source", "2018-11-13T01:00:00Z",
      "Source code available on GitHub."),
    ("Static Site Generation with Swift", "18 Jan. 2019",
      "swift_static_sitegen", "2019-01-19T02:00:00Z",
      "Lessons learned from automating this website."),
  ]
  let index = blogIndex(info.map { BlogLi($0.0, $0.1, $0.2+".html") })
  let feed = blog(info.map {
    FeedItem($0.0, "https://gofake1.net/blog/"+$0.2+".html", $0.3, $0.4)
  })
  let posts = info.lazy.map {
    (blog(Blog($0.0, string("blog/"+$0.2+".md"))), "blog/"+$0.2+".html")
  }
  return [
    Artifact(serialize(html: index), "blog/index.html"),
    Artifact(serialize(feed: feed), "blog/feed.atom"),
  ] + posts.map { Artifact(serialize(html: $0), $1) }
}

func files() -> [Artifact] {
  return [
    Artifact(serialize(copy: "projects/subtube.html"), "files/subtube.html.txt")
  ]
}

func projects() -> [Artifact] {
  let index = projectsIndex([
    ProjectLi("SubTube", "YouTube subscriptions for the paranoid",
              "subtube.html"),
    ProjectLi("Snapclone", "CSE 40424 - Human Computer Interaction Project",
              "snapclone.html"),
    ProjectLi("Nightlight", "Safari extension for darkening webpages",
              "nightlight.html"),
    ProjectLi("Remote Control for LIFX",
              "Control LIFX Lightbulbs from your Mac", "lifx_remote.html"),
    ProjectLi("minisweeper", "Minesweeper for macOS", "minisweeper.html"),
    ProjectLi("Color Picker", "Color picker for macOS", "color_picker.html"),
    ProjectLi("ExternalDisplayAutoBrightnessAgent",
              "Sync builtin Mac display brightness with external displays",
              "https://github.com/Gofake1/ExternalDisplayAutoBrightnessAgent"),
    ProjectLi("Foodlog", "Simple nutrition journal", "foodlog.html"),
    ProjectLi("gofake1.net", "Generator for this website",
              "https://github.com/Gofake1/gofake1.net"),
    ProjectLi("egret", "Web mail client", "egret.html")
  ])
  return [
    Artifact(serialize(html: index), "projects/index.html"),
    Artifact(serialize(html: colorPicker), "projects/color_picker.html"),
    Artifact(serialize(html: egret), "projects/egret.html"),
    Artifact(serialize(html: foodlog), "projects/foodlog.html"),
    Artifact(serialize(html: lifxRemote), "projects/lifx_remote.html"),
    Artifact(serialize(html: minisweeper), "projects/minisweeper.html"),
    Artifact(serialize(html: nightlight), "projects/nightlight.html"),
    Artifact(serialize(html: snapclone), "projects/snapclone.html"),
    Artifact(serialize(copy: "projects/subtube.html"), "projects/subtube.html")
  ]
}

func root() -> [Artifact] {
  return [
    Artifact(serialize(html: index(string("js/falling.js"))), "index.html"),
    Artifact(serialize(html: error(403, "Forbidden")), "403.html"),
    Artifact(serialize(html: error(404, "Not Found")), "404.html"),
    Artifact(serialize(html: about), "about.html"),
  ]
}

try setupSubdirectories()
try [blog, files, projects, root].flatMap { $0() }
  .forEach { try $0.serialize($0.path) }
