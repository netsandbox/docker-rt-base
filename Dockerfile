FROM debian:stretch-slim

LABEL maintainer="Christian Loos <cloos@netsandbox.de>"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apache2 \
    cpanminus \
    curl \
    gcc \
    gnupg \
    vim \
    # RT core dependencies
    libapache2-mod-fcgid \
    libapache-session-perl \
    libbusiness-hours-perl \
    libc-dev \
    libcgi-emulate-psgi-perl \
    libcgi-psgi-perl \
    libconvert-color-perl \
    libcrypt-eksblowfish-perl \
    libcrypt-ssleay-perl \
    libcss-minifier-xs-perl \
    libcss-squish-perl \
    libdata-guid-perl \
    libdata-ical-perl \
    libdata-page-pageset-perl \
    libdata-page-perl \
    libdate-extract-perl \
    libdate-manip-perl \
    libdatetime-format-natural-perl \
    libdbd-sqlite3-perl \
    libdbix-searchbuilder-perl \
    libdevel-globaldestruction-perl \
    libemail-address-list-perl \
    libemail-address-perl \
    libencode-perl \
    libfcgi-perl \
    libfcgi-procmanager-perl \
    libfile-sharedir-install-perl \
    libfile-sharedir-perl \
    libgd-graph-perl \
    libgraphviz-perl \
    libhtml-formattext-withlinks-andtables-perl \
    libhtml-formattext-withlinks-perl \
    libhtml-mason-perl  \
    libhtml-mason-psgihandler-perl \
    libhtml-quoted-perl \
    libhtml-rewriteattributes-perl \
    libhtml-scrubber-perl  \
    libipc-run3-perl \
    libipc-signal-perl \
    libjavascript-minifier-xs-perl \
    libjson-perl \
    liblocale-maketext-fuzzy-perl \
    liblocale-maketext-lexicon-perl \
    liblog-dispatch-perl \
    libmailtools-perl \
    libmime-tools-perl \
    libmime-types-perl \
    libmodule-refresh-perl \
    libmodule-signature-perl \
    libmodule-versions-report-perl \
    libnet-cidr-perl \
    libnet-ip-perl \
    libplack-perl \
    libregexp-common-net-cidr-perl \
    libregexp-common-perl \
    libregexp-ipv6-perl \
    librole-basic-perl \
    libscope-upper-perl \
    libserver-starter-perl \
    libsymbol-global-name-perl \
    libterm-readkey-perl  \
    libtext-password-pronounceable-perl \
    libtext-quoted-perl \
    libtext-template-perl \
    libtext-wikiformat-perl  \
    libtext-wrapper-perl \
    libtime-modules-perl \
    libtree-simple-perl  \
    libuniversal-require-perl \
    libxml-rss-perl \
    make \
    perl-doc \
    starlet \
    w3m \
    # RT developer dependencies
    libemail-abstract-perl \
    libfile-which-perl \
    liblocale-po-perl \
    liblog-dispatch-perl-perl \
    libmojolicious-perl \
    libperlio-eol-perl \
    libplack-middleware-test-stashwarnings-perl \
    libset-tiny-perl \
    libstring-shellquote-perl \
    libtest-deep-perl \
    libtest-email-perl \
    libtest-expect-perl \
    libtest-longstring-perl \
    libtest-mocktime-perl \
    libtest-nowarnings-perl \
    libtest-pod-perl \
    libtest-warn-perl \
    libtest-www-mechanize-perl \
    libtest-www-mechanize-psgi-perl \
    libwww-mechanize-perl \
    libxml-simple-perl \
&& rm -rf /var/lib/apt/lists/*

RUN cpanm \
  # RT dependencies
  Module::Install \
  Email::Address \
  Email::Address::List \
  Mozilla::CA \
  # RT extension development dependencies
  ExtUtils::MakeMaker \
  Module::Install::RTx \
  Module::Install::Substitute \
&& rm -rf /root/.cpanm

# logs should go to stdout / stderr
ENV APACHE_CONFDIR /etc/apache2
RUN set -eux; \
  . $APACHE_CONFDIR/envvars; \
  ln -sfT /dev/stderr "$APACHE_LOG_DIR/error.log"; \
  ln -sfT /dev/stdout "$APACHE_LOG_DIR/access.log"; \
  ln -sfT /dev/stdout "$APACHE_LOG_DIR/other_vhosts_access.log"; \
  chown -R --no-dereference "$APACHE_RUN_USER:$APACHE_RUN_GROUP" "$APACHE_LOG_DIR"

COPY apache2-foreground /usr/local/bin/

EXPOSE 80
CMD ["apache2-foreground"]
