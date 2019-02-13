// swift-tools-version:4.2
import PackageDescription

let package = Package(
  name: "gofake1.net",
  products: [
    .library(name: "Atom", targets: ["Atom"]),
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
    .target(name: "Builder", dependencies: ["Atom", "Html"], path: "Builder")
  ]
)
