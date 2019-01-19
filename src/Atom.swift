enum Node {
  indirect case element(String, [(String, String)], [Node])
  case text(String)
}

func render(_ node: Node) -> String {
  var rendered = ""
  render(node, into: &rendered)
  return rendered
}

func render(_ nodes: [Node]) -> String {
  return nodes.reduce(into: "") { $0.append(render($1)) }
}

func render<T>(_ children: [ChildOf<T>]) -> String {
  return children.map(render).joined()
}

func render<T>(_ child: ChildOf<T>) -> String {
  return render(child.rawValue)
}

private func render(_ node: Node, into output: inout String) {
  switch node {
  case .element("link", let attrs, _):
    output.append("<link")
    render(attrs, into: &output)
    output.append("/>")
  case .element(let tag, let attrs, let children):
    output.append("<\(tag)")
    render(attrs, into: &output)
    output.append(">")
    output.append("\(render(children))</\(tag)>")
  case .text(let string):
    output.append(string)
  }
}

private func render(_ attrs: [(String, String)], into output: inout String) {
  for (key, value) in attrs {
    output.append(" \(key)=\"\(value)\"")
  }
}

struct ChildOf<T> {
  let rawValue: Node

  init(_ node: Node) {
    rawValue = node
  }
}

enum Tag {
  enum Author {}
  enum Email {}
  enum Entry {}
  enum Feed {}
  enum Id {}
  enum Link {}
  enum Name {}
  enum Title {}
  enum Subtitle {}
  enum Summary {}
  enum Updated {}
}

func element<T>(_ name: StaticString, _ attrs: [Attribute<T>],
                _ children: [Node]) -> Node {
  return .element(String(describing: name), attrs.map { ($0.key, $0.value )},
                  children)
}

func element(_ name: StaticString, _ children: [Node]) -> Node {
  return .element(String(describing: name), [], children)
}

func author(_ children: [ChildOf<Tag.Author>]) -> Node {
  return element("author", children.map { $0.rawValue })
}

func email(_ value: String) -> ChildOf<Tag.Author> {
  return .init(element("email", [.text(value)]))
}

func entry(_ children: [Node]) -> ChildOf<Tag.Feed> {
  return .init(element("entry", children))
}

func feed(_ children: [Node]) -> Node {
  return element("feed",
                 [Attribute<Tag.Feed>("xmlns", "http://www.w3.org/2005/Atom")],
                 children)
}

func id(_ value: String) -> Node {
  return element("id", [.text(value)])
}

func link(_ attrs: [Attribute<Tag.Link>]) -> Node {
  return element("link", attrs, [])
}

func name(_ value: String) -> ChildOf<Tag.Author> {
  return .init(element("name", [.text(value)]))
}

func title(_ value: String) -> Node {
  return element("title", [.text(value)])
}

func subtitle(_ value: String) -> Node {
  return element("subtitle", [.text(value)])
}

func summary(_ value: String) -> Node {
  return element("summary", [.text(value)])
}

func updated(_ value: String) -> Node {
  return element("updated", [.text(value)])
}

struct Attribute<Element> {
  let key: String
  let value: String

  init(_ key: String, _ value: String) {
    self.key = key
    self.value = value
  }
}

func href(_ value: String) -> Attribute<Tag.Link> {
  return .init("href", value)
}

func rel(_ value: String) -> Attribute<Tag.Link> {
  return .init("rel", value)
}

func type(_ value: String) -> Attribute<Tag.Link> {
  return .init("type", value)
}
