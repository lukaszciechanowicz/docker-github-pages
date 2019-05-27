FROM alpine:3.9.4
MAINTAINER Lukasz Ciechanowicz

ENV GITHUB_GEM_VERSION 198
ENV JSON_GEM_VERSION 2.2.0
ENV JEKYLL_GEMMVERSION 3.8.5

RUN apk add libc-dev linux-headers build-base libffi-dev git \
    libatomic readline readline-dev libxml2 libxml2-dev \
    ncurses-terminfo-base ncurses-terminfo \
    libxslt libxslt-dev zlib-dev zlib yaml yaml-dev \
    ruby ruby-dev ruby-io-console ruby-irb ruby-json ruby-rake 

RUN gem install --no-document jekyll${JEKYLL_GEM_VERSION} \
    && gem install --no-document json:${JSON_GEM_VERSION} \ 
    && gem install --no-document github-pages:${GITHUB_GEM_VERSION}

RUN gem install --no-document redcarpet kramdown maruku rdiscount \ 
    RedCloth liquid pygments.rb sass safe_yaml bigdecimal minitest \ 
    webrick etc
     
RUN gem install --no-document jekyll-paginate jekyll-tagging jekyll-sass-converter \
    jekyll-sitemap jekyll-feed jekyll-redirect-from jekyll-github-metadata

RUN mkdir -p /usr/src/app && rm -rf /usr/lib/ruby/gems/*/cache/*.gem

EXPOSE 4000
WORKDIR /usr/src/app 

CMD /usr/bin/jekyll serve -d /_site --watch --force_polling -H 0.0.0.0 -P 4000