import Html

let snapclone = baseHtml([
  baseHead(title: "Snapclone", styles: [.navbar, .projects]),
  body([
    navbar(),
    div([`class`("project-entry")], [
      h1([style("margin-bottom: 10px;")], ["Snapclone"]),
      h3([style("margin-top: 0;")], ["Human Computer Interaction (CSE 40424)"]),
      a([href("/images/snapchat.png")], [
        img([src("/images/snapchat.png"), style("max-height: 80vh;")])
      ]),
      p([
        b(["Source code"]), " on ",
        a([href("https://github.com/Gofake1/Snapclone")], ["GitHub"]), "."
      ]),
      h4(["Why"]),
      """
      We thought the Snapchat app could use a more efficient design. In \
      particular, we wanted to improve the workflow for reviewing snaps and \
      messages. We developed this UI prototype for our final project.
      """,
      h4(["What"]),
      "I was inspired by ",
      a([href("https://itunes.apple.com/us/app/eliss/id306950009")], ["Eliss"]),
      """
      , a game that involves merging bubbles; Snapchat is a fun app, so I \
      thought bubbles were more appropriate than a table view. There is also \
      an added benefit of better information density.
      """,
      p([
        """
        We thought the seperate screens for snaps and stories was redundant. \
        The bubble-for-each-friend metaphor allows snaps and stories to be \
        collected in the same place.
        """
      ]),
      h4(["Well?"]),
      """
      We received a positive response from the public (college students). \
      They liked the colorful design and the functional benefit of a single \
      screen for snaps and stories, despite the learning curve.
      """
    ])
  ])
])
