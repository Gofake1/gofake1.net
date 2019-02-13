# Foodlog 1.0
#### 10 July 2018

I got the idea for this app after realizing I had lost around twenty pounds since graduating from college. The only time I've been close to normal weight was during college, when I dabbled in food logging with MyFitnessPal. There were several reasons I stopped using it:

* It was (is) feature-bloated, which is especially poor form for a health app.
* The crowdsourced database is infuriating when it doesn't have what you're looking for, and irksome when the names don't follow a consistent style.
* The iOS Health app didn't exist back then, and MyFitnessPal didn't present the data in a nice graph view.
* My eating habits are erratic, so I prefer a plain chronological list.
* I don't trust non-tech companies with securing data.
* I don't trust companies to not abuse data.

I looked around for apps that focused on doing one thing well (logging food) and conformed to the iOS aesthetic; obviously I didn't find one. I developed Foodlog according to these core values:

* Limited, well-defined scope:
    - Two types of data: foods and food entries.
    - Database that you curate.
    - Leave data visualization to the Health app.
    - Simple UI.
    - Sync.
* Try to be ethical:
    - Open source.
    - Data privacy.
    - Business model: paid Mac app for advanced users.

I've been using it for a while and haven't run into any more bugs, so here's [version 1.0](https://itunes.apple.com/us/app/foodlog-health-app/id1260408472).

### Thoughts on Development

This was my longest project yet, taking six months on and off to get from idea to version 1.0. I have experience making Mac apps, so iOS development came pretty easily.

Some thoughts on frameworks:

* UIKit - pleasant to work with: it only made me regret my profession once.
* HealthKit - the job it's responsible for is well-defined, so the most annoying thing was designing around user authorization.
* CloudKit - there are a lot of edge cases, some of which I haven't implemented yet. Up to date sample code is hard to come by.
* Realm - I don't have much experience with Core Data, so I can't really compare the two. It works great for table view data sources. I would recommend its use as your app's caching layer. As an aside, I went through a lot more iterations of the schema than I expected.

I think the code is pretty well-architect-ed, so take that as a challenge, reader.

The only thing I'm not too happy about is the logo (it's supposed to be a cross section of a bell pepper). If anyone with an above-mediocre talent for graphic design wants to take a stab at it, I would appreciate it.

For the curious: App Store Review took three days to get to my app.

### In Conclusion

I don't know how many people are looking for an app like this, but I've found that if you make it, they will come (or at least a few will). I'm interested to see how the iOS market compares with macOS.