import Foundation

func blog(_ items: [FeedItem]) -> Node {
  let lastDate = items.map({ df.date(from: $0.2)! }).sorted().last!
  return feed([
    title("Gofake1 - Blog"),
    author([name("David"), email("david@gofake1.net")]),
    link([rel("self"), href("https://gofake1.net/blog/feed.atom")]),
    id("https://gofake1.net/blog"),
    updated(df.string(from: lastDate))
  ] + entries(items))
}

/*
func cse40175(_ items: [FeedItem]) -> Node {
  let lastDate = items.compactMap({ df.date(from: $0.2) }).sorted().last!
  return feed([
    title("Gofake1 - CSE40175"),
    subtitle("Ethical and Professional Issues"),
    author([name("David Wu"), email("david@gofake1.net")]),
    link([rel("self"), href("https://gofake1.net/cse40175/feed.atom")]),
    id("https://gofake1.net/cse40175"),
    updated(df.string(from: lastDate))
  ] + entries(items))
}
*/

private let df: DateFormatter = {
  let df = DateFormatter()
  df.locale = Locale(identifier: "en_US_POSIX")
  df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
  df.timeZone = TimeZone(secondsFromGMT: 0)
  return df
}()

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
