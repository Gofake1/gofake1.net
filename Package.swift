// swift-tools-version:4.2
import PackageDescription

let package = Package(
  name: "gofake1.net",
  products: [
    .executable(name: "Builder", targets: ["Builder"])
  ],
  dependencies: [
    .package(url: "https://github.com/chriseidhof/Ccmark.git",
             .branch("master")),
    .package(url: "https://github.com/pointfreeco/swift-html.git",
             .revision("a494cde"))
  ],
  targets: [
    .target(name: "Builder", dependencies: ["Html"], path: "src")
  ]
)
