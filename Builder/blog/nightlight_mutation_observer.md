# Nightlight and MutationObserver
#### 5 Jan. 2018

Modern web pages use a disproportionately large share of system resources, so browser extensions should aim to add as little overhead as possible.

Nightlight currently works by walking through a web page's DOM tree after it has loaded. Modern web pages can use JavaScript to add new page elements after the page has loaded, to implement features like "infinite scrolling." In order to darken the newly loaded elements, we need to be notified when they are added, and it would be helpful if we didn't have to walk the entire DOM again to find the new elements. `MutationObserver` is designed for this. By specifying the `childList` and `subtree` options, `MutationObserver` will give us every subtree that gets added. This is a simple and efficient solution for most cases, except one that happens to be pretty common: video player progress bars.

![YouTube player time marker](/images/youtube_player_time_marker.png)

Every time the time marker moves, `MutationObserver` dutifully invokes our code on it. In other words, our code gets called repeatedly to do nothing: the marker has already been darkened at page load, so any additional work is redundant. But doing nothing isn't the same as a no-op, since we still have to call `getComputedStyle` (web developers should know that `getComputedStyle` isn't cheap). If the video is an hour long, Nightlight would be running hundreds of times doing nothing useful.

In version 0.1.6, there is an option to whitelist domains where Nightlight should use `MutationObserver`. However, it turns out a lot more sites dynamically modified the DOM than I thought, so version 0.1.7 changes the option to a blacklist.