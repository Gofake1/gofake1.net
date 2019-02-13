# Nightlight: Back to the Drawing Board
#### 9 Nov. 2018

I feel comfortable admitting that I'm a better programmer than I was two years ago, when I started working on Nightlight. A large part of that improvement is knowing where to look towards for inspiration. [Stylish](https://github.com/350d/Stylish) changes the appearances of web pages with CSS, which is a vastly superior approach to what I was using. I've also gotten more comfortable with modern JavaScript and HTML5. So there were technical reasons for me to revisit the code-base, but as any application developer knows, sometimes you end up neck-deep in a rewrite just because the platform owner makes you do it.

This year, Apple is sunsetting JavaScript extensions and the Extension Gallery in favor of native App Extensions and the Mac App Store. Surprisingly, this probably isn't the most annoying stunt Apple has pulled on Safari extension developers; a few years earlier, Apple required them to enroll in its Membership Program ($99/year) in order to continue publishing on the Gallery. Fortunately, this latest move has some upside for both users and developers.

Instead of each developer trying to imitate the native UI widgets, it's now possible for extensions to use NSView and friends. Moreover, native code opens up availability of Apple and third-party frameworks, as well as multiple threads. Distribution through the App Store provides access to analytics, ratings, and a faster review process; if you thought waiting a week for your app to be reviewed was too long, I'm here to tell you that version 0.1 of Nightlight took more than a month to be accepted to the Extension Gallery.

However, the native SafariServices API as it exists today is more limited than the JavaScript one it's replacing, which is why Nightlight lost a few features in the transition to an App Extension. One particularly annoying limitation is the inability to iterate through all tabs, so if the user set up a timer to darken automatically, only the tab the user is currently looking at will be darkened.

### Old and Busted

The original idea for Nightlight was simple: darken every element's background color and lighten its text color. While this would be trivial to implement if every page was static, today's web is dynamic. The DOM tree can be modified at any time by scripts, so we can no longer just darken everything at page load. My initial solution was to use MutationObserver to detect when new elements were added. This worked, but I thought we could do [better](https://gofake1.net/blog/nightlight_mutation_observer.html).

This approach also had deficiencies that I tried to fix by adding workarounds (blacklist, aggressive mode); when software reaches this stage, it's time to reevaluate.

The original implementation was also destructive: it overwrote the `style` attributes of elements without keeping the original values. CSS fixes this problem as well.

### Lessons Learned

The injected script has been rewritten using a functional style of JavaScript, which I think has resulted in more reusable code.

The auto-on/off feature has been reimplemented in native code using Timer from Foundation.

Lastly, the before/after colors in the popover are gone. I put this in initially to aid debugging, and later it became a pet feature. In the end I realized it had dubious utility, and it wasn't worth the time to make it work reliably.
