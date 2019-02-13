import Ccmark
import Foundation
import Html

func markdown(_ string: String) throws -> [Html.Node] {
  guard let root = cmark_parse_document(string, string.utf8.count, 0)
    else { throw NSError(domain: "Cmark", code: 1) }
  guard let iter = cmark_iter_new(root)
    else { throw NSError(domain: "Cmark", code: 2) }
  defer {
    cmark_iter_free(iter)
    cmark_node_free(root)
  }
  return markdown(iter)
}

private func markdown(_ iter: OpaquePointer) -> [Html.Node] {
  var children = [Html.Node]()
  while true {
    switch cmark_iter_next(iter) {
    case CMARK_EVENT_DONE:
      return children
    case CMARK_EVENT_ENTER:
      let node = cmark_iter_get_node(iter)!
      switch cmark_node_get_type(node) {
      case CMARK_NODE_HTML_BLOCK:
        children.append(.raw(String(cString: cmark_node_get_literal(node))))
      case CMARK_NODE_THEMATIC_BREAK:
        children.append(hr([]))
      case CMARK_NODE_CODE_BLOCK:
        children.append(pre([
          .text(String(cString: cmark_node_get_literal(node)))
        ]))
      case CMARK_NODE_TEXT:
        children.append(.text(String(cString: cmark_node_get_literal(node))))
      case CMARK_NODE_SOFTBREAK:
        children.append("\n")
      case CMARK_NODE_LINEBREAK:
        children.append(br)
      case CMARK_NODE_CODE:
        children.append(code([
          .text(String(cString: cmark_node_get_literal(node)))
        ]))
      case CMARK_NODE_HTML_INLINE:
        children.append(.raw(String(cString: cmark_node_get_literal(node))))
      default:
        // Recurse if node can have children
        children += markdown(iter)
      }
    case CMARK_EVENT_EXIT:
      return markdown(cmark_iter_get_node(iter)!, children)
    default:
      break
    }
  }
}

private func markdown(_ node: OpaquePointer, _ children: [Html.Node])
-> [Html.Node] {
  switch cmark_node_get_type(node) {
  case CMARK_NODE_DOCUMENT:
    return children
  case CMARK_NODE_BLOCK_QUOTE:
    return [blockquote(children)]
  case CMARK_NODE_LIST:
    return markdown(list: node, children)
  case CMARK_NODE_ITEM:
    return [element("li", children)]
  case CMARK_NODE_PARAGRAPH:
    return [p(children)]
  case CMARK_NODE_HEADING:
    return markdown(heading: node, children)
  case CMARK_NODE_EMPH:
    return [em(children)]
  case CMARK_NODE_STRONG:
    return [strong(children)]
  case CMARK_NODE_LINK:
    let url = String(cString: cmark_node_get_url(node))
    return [a([href(url)], children)]
  case CMARK_NODE_IMAGE:
    return [img(src: String(cString: cmark_node_get_url(node)),
                alt: children.compactMap(String.init).reduce("", +))]
  default:
    return [
      div([.text("FIXME: "+String(cString: cmark_node_get_type_string(node)))])
    ]
  }
}

private func markdown(list node: OpaquePointer, _ children: [Html.Node])
-> [Html.Node] {
  switch cmark_node_get_list_type(node) {
  case CMARK_BULLET_LIST:  return [element("ul", children)]
  case CMARK_ORDERED_LIST: return [element("ol", children)]
  default:
    fatalError()
  }
}

private func markdown(heading node: OpaquePointer, _ children: [Html.Node])
-> [Html.Node] {
  switch cmark_node_get_heading_level(node) {
  case 1: return [h1(children)]
  case 2: return [h2(children)]
  case 3: return [h3(children)]
  case 4: return [h4(children)]
  case 5: return [h5(children)]
  case 6: return [h6(children)]
  default:
    fatalError()
  }
}

private extension String {
  init?(htmlText node: Html.Node) {
    if case .text(let value) = node {
      self = value
    } else {
      return nil
    }
  }
}
