# Static Site Generation with Swift
#### 18 Jan. 2019

One of the motivations for this website's existence was to test a homegrown static site generation framework. I wanted to feed Markdown and config files in, and get a website back out. I also wanted to write it in Swift, which seemed to strike a balance between being approachable and being flexible. Naturally, it's been three years since. Until the framework was written, I relied on copy and paste, which has proven expectedly error-prone. Having gotten around to it the last few weeks, generation of this site is finally automated.

There are several differences between what I have now and what I originally envisioned:
* Configuration in code, not markup languages
* Markup reuse in code, not template languages
* Monolithic executable instead of a separate framework

I was initially inspired, or perhaps led astray, by Jekyll. I thought I should use YAML to describe my website's structure. I started sketching out the schema that would be parsed into a data structure to be used by my code, and then I realized that I could skip the middleman and just write the structure in code. This would remove the dependency on parsing and validating YAML, at the cost of having to recompile after a configuration change. Since I control the source, that's a trade-off I can live with. The Swift compiler is also reasonably fast for small projects like this one.

Taking it a step further, templating is done in Swift as well, thanks to the excellent [pointfreeco/swift-html](https://github.com/pointfreeco/swift-html) library. Stephen Celis and Brandon Williams make a brilliant case for [ditching templates for code](https://www.pointfree.co/episodes/ep29-dsls-vs-templating-languages) that I won't rehash here. I can now build up pages with reusable HTML snippets, which lets me edit in one place and have the changes propagate automatically; no more copy and paste. This also makes it easy to inline CSS and JavaScript into the final HTML file, resulting in a minor latency win.

The drawback to doing markup in code is actually writing it: I prefer the syntax of Markdown, so adding a Markdown parser is a worthwhile trade-off.

Although other site generators like Jekyll are usable without requiring programming knowledge, I've come to believe that the flexibility offered by rolling your own solution will pay off in the long run. You won't be beholden to someone else's design, and static site generation is an easy enough problem to solve. If you can code, I encourage you to look into a more monolithic approach. Use helper code instead of frameworks. If you do, you'll get to use any folder hierarchy you want, avoid learning and working around template languages, and get the satisfaction of using software you designed and understand.

**Source code** on [GitHub](https://github.com/Gofake1/gofake1.net).