import Atom
import Foundation
import Html

func string(_ path: String) -> String {
  let path = World.srcUrl.appendingPathComponent(path).absoluteString
  guard let data = World.fileManager.contents(atPath: path)
    else { fatalError(path) }
  return String(data: data, encoding: .utf8)!
}

func style(_ styles: [Style]) -> Html.ChildOf<Html.Tag.Head> {
  return style(unsafe: styles.map({ styleValues[$0]! }).joined(separator: "\n"))
}

func serialize(html: Html.Node) -> (String) throws -> Void {
  return serialize(string: render([doctype, html]))
}

func serialize(feed: Atom.Node) -> (String) throws -> Void {
  return serialize(string: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                           + render(feed))
}

func serialize(copy srcPath: String) -> (String) throws -> Void {
  return {
    let src = World.srcUrl.appendingPathComponent(srcPath)
    let dst = World.dstUrl.appendingPathComponent($0)
    World.print(dst)
    let srcFile = URL(fileURLWithPath: src.absoluteString)
    let dstFile = URL(fileURLWithPath: dst.absoluteString)
    if World.fileManager.fileExists(atPath: dst.absoluteString) {
      try World.fileManager.removeItem(at: dstFile)
    }
    try World.fileManager.copyItem(at: srcFile, to: dstFile)
  }
}

private let styleValues: [Style] = [
  .about: string("css/about.css"),
  .base: string("css/base.css"),
  .blog: string("css/blog.css"),
  .cse40175: string("css/cse40175.css"),
  .cse40175Index: string("css/cse40175Index.css"),
  .gallery: string("css/gallery.css"),
  .index: string("css/index.css"),
  .list: string("css/list.css"),
  .navbar: string("css/navbar.css"),
  .projects: string("css/projects.css"),
]

private func serialize(string: String) -> (String) throws -> Void {
  return {
    let dst = World.dstUrl.appendingPathComponent($0)
    World.print(dst)
    // Don't write to file if equivalent file already exists
    if World.fileManager.fileExists(atPath: dst.absoluteString) {
      let data = World.fileManager.contents(atPath: dst.absoluteString)
        ?? Data()
      let existingStr = String(data: data, encoding: .utf8)
      if string == existingStr {
        return
      }
    }
    if !World.fileManager.createFile(atPath: dst.absoluteString,
                                     contents: string.data(using: .utf8)) {
      throw NSError(domain: NSPOSIXErrorDomain, code: Int(errno),
                    userInfo: ["path": dst.absoluteString])
    }
}
}
