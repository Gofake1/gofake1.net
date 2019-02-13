import Html
import HtmlCmarkSupport

func blog(_ post: Blog) -> Node {
  return baseHtml([
    baseHead(title: post.title, styles: [.blog, .navbar]),
    body([
      navbar(),
      div([`class`("blog-entry")], try! markdown(post.markdown))
    ])
  ])
}
