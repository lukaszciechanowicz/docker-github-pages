FROM alpine:3.9.4
MAINTAINER Lukasz Ciechanowicz

ENV GITHUB_GEM_VERSION 198
ENV JSON_GEM_VERSION 2.2.0
ENV JEKYLL_GEMMVERSION 3.8.5

RUN apk --update add --virtual build_deps \
    ruby ruby-dev libc-dev linux-headers build-base \
    libatomic readline readline-dev libxml2 libxml2-dev \
    ncurses-terminfo-base ncurses-terminfo \
    libxslt libxslt-dev zlib-dev zlib yaml yaml-dev \
    libffi-dev git ruby-io-console ruby-irb ruby-json ruby-rake \
 && gem install --no-document jekyll jekyll-tagging redcarpet kramdown maruku rdiscount \ 
    RedCloth liquid pygments.rb sass safe_yaml jekyll-paginate \ 
    jekyll-sass-converter jekyll-sitemap jekyll-feed jekyll-redirect-from jekyll-github-metadata minitest \
 && gem install --no-document jekyll${JEKYLL_GEM_VERSION} \
 && gem install --no-document json:${JSON_GEM_VERSION} \ 
 && gem install --no-document github-pages:${GITHUB_GEM_VERSION} \
 && apk del build_deps \
 && apk add git \
 && mkdir -p /usr/src/app \
 && rm -rf /usr/lib/ruby/gems/*/cache/*.gem

EXPOSE 4000
WORKDIR /usr/src/app 

CMD /usr/bin/jekyll serve -d /_site --watch --force_polling -H 0.0.0.0 -P 4000
