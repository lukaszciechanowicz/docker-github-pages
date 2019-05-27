# docker-github-pages
My Alpine based Docker image for [GitHub Pages](https://pages.github.com/) with [Jekyll](https://jekyllrb.com/).

## What is this all about?

It's the Docker image I use to run locally my GitHub Pages based [personal blog](http://lukaszciechanowicz.me/) while I'm developing it.
It refreshes changes automatically as I make them and let me test various plugins and settings.

It's just as simple as that:

```
$ docker run -t --rm -v "$PWD":/usr/src/app -p "3000:3000" lukaszciechanowicz/github-pages
```