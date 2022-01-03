#!/bin/bash
printf -v ARGS "%q " "$@"
#echo ${ARGS} >> /tmp/notmuch.txt
# diable decryption (it took forever, probably smth is/was broken)
ARGS=`echo ${ARGS} | sed "s/--decrypt=true//g"`
ARGS=`echo ${ARGS} | sed "s/--format-version=5/--format-version=4/g"`
#echo ${ARGS} >> /tmp/notmuch.txt
exec timeout 10 ssh batou notmuch ${ARGS}
