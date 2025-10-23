#checkov:skip=CKV_DOCKER_2:Ensure that HEALTHCHECK instructions have been added to container images
#checkov:skip=CKV_DOCKER_3:Ensure that a user for the container has been created
ARG IMAGE=debian
ARG TAG=bookworm-slim
FROM ${IMAGE}:${TAG}

LABEL org.opencontainers.image.authors="Christian Loos <cloos@netsandbox.de>"

# hadolint ignore=DL3008
RUN apt-get update && apt-get -y upgrade && apt-get -y install --no-install-recommends \
    autoconf \
    cpanminus \
    curl \
    gcc \
    gnupg \
    vim \
    # RT core dependencies
    libapache-session-perl \
    libbusiness-hours-perl \
    libc-dev \
    libcgi-emulate-psgi-perl \
    libcgi-psgi-perl \
    libconvert-color-perl \
    libcrypt-eksblowfish-perl \
    libcrypt-ssleay-perl \
    libcrypt-x509-perl \
    libcss-minifier-xs-perl \
    libcss-squish-perl \
    libdata-guid-perl \
    libdata-ical-perl \
    libdata-page-pageset-perl \
    libdata-page-perl \
    libdate-extract-perl \
    libdate-manip-perl \
    libdatetime-format-natural-perl \
    libdatetime-set-perl \
    libdbd-sqlite3-perl \
    libdbix-searchbuilder-perl \
    libdevel-globaldestruction-perl \
    libemail-address-list-perl \
    libemail-address-perl \
    libencode-detect-perl \
    libencode-hanextra-perl \
    libencode-perl \
    libfile-sharedir-perl \
    libgd-graph-perl \
    libgnupg-interface-perl \
    libgraphviz-perl \
    libhash-merge-perl \
    libhtml-formatexternal-perl \
    libhtml-formattext-withlinks-andtables-perl \
    libhtml-formattext-withlinks-perl \
    libhtml-gumbo-perl \
    libhtml-mason-psgihandler-perl \
    libhtml-quoted-perl \
    libhtml-rewriteattributes-perl \
    libhtml-scrubber-perl \
    libimager-perl \
    libipc-run3-perl \
    libjavascript-minifier-xs-perl \
    libjson-perl \
    liblocale-maketext-fuzzy-perl \
    liblocale-maketext-lexicon-perl \
    liblog-dispatch-perl \
    libmailtools-perl \
    libmime-tools-perl \
    libmime-types-perl \
    libmodule-path-perl \
    libmodule-refresh-perl \
    libmodule-signature-perl \
    libmodule-versions-report-perl \
    libmoose-perl \
    libmoosex-nonmoose-perl \
    libmoosex-role-parameterized-perl \
    libnet-cidr-perl \
    libnet-ip-perl \
    libnet-ldap-perl \
    libparallel-forkmanager-perl \
    libpath-dispatcher-perl \
    libperlio-eol-perl \
    libplack-perl \
    libregexp-common-net-cidr-perl \
    libregexp-common-perl \
    libregexp-ipv6-perl \
    librole-basic-perl \
    libscope-upper-perl \
    libsymbol-global-name-perl \
    libterm-readkey-perl \
    libtext-password-pronounceable-perl \
    libtext-quoted-perl \
    libtext-template-perl \
    libtext-wikiformat-perl \
    libtext-worddiff-perl \
    libtext-wrapper-perl \
    libtime-parsedate-perl \
    libtree-simple-perl \
    libuniversal-require-perl \
    libweb-machine-perl \
    libxml-rss-perl \
    make \
    perl-doc \
    starlet \
    w3m \
    # RT developer dependencies
    libemail-abstract-perl \
    libfile-which-perl \
    libhtml-selector-xpath-perl \
    liblocale-po-perl \
    liblog-dispatch-perl-perl \
    libmodule-install-perl \
    libmojolicious-perl \
    libnet-ldap-server-test-perl \
    libplack-middleware-test-stashwarnings-perl \
    libset-tiny-perl \
    libstring-shellquote-perl \
    libtest-deep-perl \
    libtest-email-perl \
    libtest-expect-perl \
    libtest-longstring-perl \
    libtest-mocktime-hires-perl \
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
    CSS::Inliner \
    DBIx::SearchBuilder \
    GD::Graph \
    GraphViz2 \
    Hash::Merge::Extra \
    HTML::RewriteAttributes \
    HTTP::Message \
    Mozilla::CA \
    Pod::Select \
    # RT dev dependencies
    Markdown::Render \
    Test::Selenium::Remote::Driver \
    # RT extension development dependencies
    Module::Install::RTx \
    Module::Install::Substitute \
  && rm -rf /root/.cpanm
