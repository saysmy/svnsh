#!/usr/bin/env bash

cd html;
svn st| grep '^\?' | tr '^\?' ' ' | sed 's/[ ]*//' | sed 's/[ ]/\\ /g' | xargs svn add;
svn commit -m "$1 html commit" *;
cd ../static;
svn st| grep '^\?' | tr '^\?' ' ' | sed 's/[ ]*//' | sed 's/[ ]/\\ /g' | xargs svn add;
svn commit -m "$1 static commit" *;