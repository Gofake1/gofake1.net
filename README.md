# Site generator for gofake1.net

These are the source codes that are involved in creating my website's HTML documents, as well as other text-based artifacts. Images and other binary files are not included in source control, though that doesn't prevent this project from building.

This project produces a Swift tool (Builder), which takes these arguments:
```
Builder path/to/src path/to/dst --verbose
```

* `/path/to/src` should point to the project "Builder" directory.
* `--verbose` is optional