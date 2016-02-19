FROM debian:jessie

MAINTAINER Christian Loos <cloos@netsandbox.de>

# we need non-free for libapache2-mod-fastcgi
RUN sed -i "s/jessie main/jessie main contrib non-free/" /etc/apt/sources.list

RUN apt-get update \
  && apt-get install -y \
    apache2 \
    cpanminus \
    curl \
    gcc \
    libapache-session-perl \
    libapache2-mod-fastcgi \
    libcgi-emulate-psgi-perl \
    libcgi-psgi-perl \
    libconvert-color-perl \
    libcrypt-eksblowfish-perl \
    libcrypt-ssleay-perl \
    libcss-minifier-xs-perl \
    libcss-squish-perl \
    libdata-guid-perl \
    libdata-ical-perl \
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
    libtime-modules-perl \
    libterm-readkey-perl  \
    libtext-password-pronounceable-perl \
    libtext-quoted-perl \
    libtext-template-perl \
    libtext-wikiformat-perl  \
    libtext-wrapper-perl \
    libtree-simple-perl  \
    libuniversal-require-perl \
    libxml-rss-perl \
    make \
    perl-doc \
    starlet \
    w3m \
  && rm -rf /var/lib/apt/lists/*

RUN cpanm \
  Business::Hours \
  Data::Page::Pageset \
  Encode \
  HTML::FormatText::WithLinks::AndTables \
  Mozilla::CA

# Manually set up the apache environment variables
# TODO: why we need this here, it's already in /etc/apache2/envvars
ENV APACHE_LOCK_DIR=/var/lock/apache2
ENV APACHE_LOG_DIR=/var/log/apache2
ENV APACHE_PID_FILE=/var/run/apache2/apache2.pid
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_RUN_USER=www-data
