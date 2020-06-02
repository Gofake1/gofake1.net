typealias Artifact = (serialize: (String) throws -> Void, path: String)
typealias Blog = (title: String, markdown: String)
typealias BlogLi = (title: String, date: String, href: String)
typealias CSE40175 = (title: String, markdown: String)
typealias CSE40175Li = String
typealias FeedItem = (title: String, href: String, updated: String,
                      summary: String)
typealias ProjectLi = (name: String, subheading: String, href: String)

enum NavbarSelection {
  case none
  case blog
  case projects
}

enum Style {
  case about
  case base
  case blog
  case cse40175
  case cse40175Index
  case gallery
  case index
  case list
  case navbar
  case projects
}
