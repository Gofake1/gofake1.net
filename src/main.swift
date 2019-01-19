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
    // "cse40175",
    "files",
    "images",
    "projects"
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
      "swift_static_sitegen",
      "2019-??-??T??:00:00Z", "Lessons learned from automating this website")
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
    Artifact(serialize(feed: feed), "blog/feed.atom")
  ] + posts.map { Artifact(serialize(html: $0), $1) }
}

/*
func cse40175() -> [Artifact] {
  let info = [
    ("Introduction", 0, "2016-01-12T04:24:00Z", ""),
    ("Ethics", 1, "2016-01-19T04:14:00Z", ""),
    ("Hackers", 2, "2016-01-19T15:55:00Z", ""),
    ("Job Loyalty", 3, "2016-01-26T07:46:00Z", ""),
    ("Code of Ethics Critique", 4, "2016-01-29T05:01:00Z", ""),
    ("Code of Ethics", 5, "2016-01-29T05:01:00Z", ""),
    ("Burnout", 6, "2016-02-02T05:11:00Z", ""),
    ("Code of Conduct", 7, "2016-02-09T05:37:00Z", ""),
    ("Whistleblowing at Boeing", 8, "2016-02-16T15:08:00Z", ""),
    ("Job Interview Process Critique", 9, "2016-02-18T02:47:00Z", ""),
    ("Job Interview Process", 10, "2016-02-18T02:47:00Z", ""),
    ("Government Backdoors", 11, "2016-02-23T05:04:00Z", ""),
    ("Online Advertising", 12, "2016-03-01T14:56:00Z", ""),
    ("Open Source", 13, "", ""),
    ("Reverse Engineering", 14, "2016-03-22T14:43:00Z", ""),
    ("Privacy + Cloud Computing = GitLab", 15, "2016-03-23T07:39:00Z", ""),
    ("GitLab Critique", 16, "2016-03-24T05:21:00Z", ""),
    ("H1-B", 17, "2016-03-29T06:34:00Z", ""),
    ("Online Censorship", 18, "2016-04-12T05:57:00Z", ""),
    ("AI Podcast", 19, "2016-04-15T01:11:00Z", ""),
    ("Computer Science For All", 20, "2016-04-19T06:36:00Z", ""),
    ("Notre Dame CS", 21, "2016-05-05T19:28:00Z", "")
  ]
  let index = cse40175Index(info.map { $0.0 })
  let feed = cse40175(info.map {
    FeedItem($0.0, "https://gofake1.net/cse40175/\($0.1).html", $0.2, $0.3)
  })
  let markdowns = [
    0, 1, 2, 3, 4, 6, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18, 20
  ].lazy.map {
    (cse40175(CSE40175(info[$0].0, string("cse40175/\($0).md"))),
      "cse40175/\($0).html")
  }
  let raws = [5, 10, 19, 21].lazy.map { "cse40175/\($0).html" }
  return [
    Artifact(serialize(html: index), "cse40175/index.html"),
    Artifact(serialize(feed: feed), "cse40175/feed.atom")
  ] + markdowns.map { Artifact(serialize(html: $0), $1) }
    + raws.map { Artifact(serialize(copy: $0), $0) }
}
*/

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
    ProjectLi("minisweeper", "Minesweeper for macOS", "minisweeper.html"),
    ProjectLi("Remote Control for LIFX",
              "Control LIFX Lightbulbs from your Mac", "lifx_remote.html"),
    ProjectLi("Color Picker", "Color picker for macOS", "color_picker.html"),
    ProjectLi("ExternalDisplayAutoBrightnessAgent",
              "Sync builtin Mac display brightness with external displays",
              "https://github.com/Gofake1/ExternalDisplayAutoBrightnessAgent"),
    ProjectLi("Foodlog", "Simple nutrition journal", "foodlog.html")
  ])
  return [
    Artifact(serialize(html: index), "projects/index.html"),
    Artifact(serialize(html: colorPicker), "projects/color_picker.html"),
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
    Artifact(serialize(copy: "root/.htaccess"), ".htaccess"),
    Artifact(serialize(html: error404), "404.html"),
    Artifact(serialize(html: resume(string("root/resume.md"))), "resume.html")
  ]
}

try setupSubdirectories()
try [blog, /*cse40175,*/ files, projects, root].flatMap { $0() }
  .forEach { try $0.serialize($0.path) }
