// swift-tools-version:4.2
import PackageDescription

let package = Package(
  name: "gofake1.net",
  products: [
    .library(name: "Atom", targets: ["Atom"]),
    .library(name: "HtmlCmarkSupport", targets: ["HtmlCmarkSupport"]),
    .executable(name: "Builder", targets: ["Builder"])
  ],
  dependencies: [
    .package(url: "https://github.com/objcio/Ccmark.git",
             .branch("master")),
    .package(url: "https://github.com/pointfreeco/swift-html.git",
             .revision("a494cde"))
  ],
  targets: [
    .target(name: "Atom", path: "Atom"),
    .target(name: "Builder",
            dependencies: ["Atom", "Html", "HtmlCmarkSupport"],
            path: "Builder"),
    .target(name: "HtmlCmarkSupport", dependencies: ["Html"],
            path: "HtmlCmarkSupport")
  ]
)
