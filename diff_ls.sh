#!/bin/bash

readonly BEFORE=./before.ls.txt
readonly AFTER=./after.ls.txt

if [ ! -f $BEFORE ] ; then
    touch $BEFORE
fi

if [ ! -f $AFTER ] ; then
    touch $AFTER
fi

if [ -f $BEFORE ] && [ -f $AFTER ] ; then
    cp $AFTER $BEFORE
    find .git -exec ls -ld --full-time {} \; | grep -v ^d > $AFTER
    colordiff $BEFORE $AFTER
fi
