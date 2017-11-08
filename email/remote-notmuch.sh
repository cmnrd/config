#!/bin/bash
printf -v ARGS "%q " "$@"
# diable decryption (it took forever, probably smth is/was broken)
ARGS=`echo ${ARGS} | sed "s/--decrypt[ ?]//g"`
exec timeout 10 ssh batou notmuch ${ARGS}
