#!/bin/bash

mkdir -p without-cmake
intltool-merge -x -u -c ./.intl-cache ./po org.synfig.SynfigStudio.appdata.xml.in without-cmake/appdata.xml

mkdir -p with-cmake
cd with-cmake
cmake -GNinja ..
ninja