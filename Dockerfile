FROM mongooseim/mongooseim-docker

MAINTAINER Jan Vincent Liwanag <jvliwanag@gmail.com>

EXPOSE 5222
EXPOSE 5280
EXPOSE 8888
EXPOSE 8889

ADD etc /usr/lib/mongooseim/etc
