# docker-github-pages
My Alpine based Docker image for [GitHub Pages](https://pages.github.com/) with [Jekyll](https://jekyllrb.com/).

![Demo using Jekyll and GitHub Page on Docker](examples/example01.gif?raw=true "example01")

## What is this all about?

It's a Docker image that I use to run locally my GitHub Pages based [personal blog](http://lukaszciechanowicz.me/) while I'm developing it.
It refreshes changes automatically as I make them and let me review the site, help troubleshoot failed Jekyll builds and test various plugins and settings.

It's just as simple as that:

```
$ docker run -t --rm -v "$PWD":/usr/src/app -p "4000:4000" lukaszciechanowicz/github-pages:latest
```