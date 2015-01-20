#!/bin/bash

BASEDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

docker run -p 5222:5222 -p 5280:5280 -p 8888:8888 -p 8889:8889 --rm --name zazu -ti -v $BASEDIR/ebin:/usr/lib/mongooseim/lib/zazu/ebin -v $BASEDIR/etc:/usr/lib/mongooseim/etc mongooseim/mongooseim-docker
