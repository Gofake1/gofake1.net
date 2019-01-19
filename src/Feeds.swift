func blog(_ items: [FeedItem]) -> Node {
  return feed([
    title("Gofake1 - Blog"),
    author([name("David"), email("david@gofake1.net")]),
    link([rel("self"), href("https://gofake1.net/blog/feed.atom")]),
    id("https://gofake1.net/blog"),
    updated("FIXME")
  ] + entries(items))
}

/*
func cse40175(_ items: [FeedItem]) -> Node {
  return feed([
    title("Gofake1 - CSE40175"),
    subtitle("Ethical and Professional Issues"),
    author([name("David Wu"), email("david@gofake1.net")]),
    link([rel("self"), href("https://gofake1.net/cse40175/feed.atom")]),
    id("https://gofake1.net/cse40175"),
    updated("FIXME")
  ] + entries(items))
}
*/

private func entries(_ items: [FeedItem]) -> [Node] {
  return items.map {
    entry([
      title($0.title),
      link([rel("alternate"), type("text/html"), href($0.href)]),
      id($0.href),
      updated($0.updated),
      summary($0.summary)
    ]).rawValue
  }
}
