#!/usr/bin/env bash

cd html;
svn st| grep '^\?' | tr '^\?' ' ' | sed 's/[ ]*//' | sed 's/[ ]/\\ /g' | xargs svn add;
svn commit -m 'html commit' *;
cd ../static;
svn st| grep '^\?' | tr '^\?' ' ' | sed 's/[ ]*//' | sed 's/[ ]/\\ /g' | xargs svn add;
svn commit -m 'static commit' *;