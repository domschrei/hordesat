#!/bin/bash

if [ ! -f yalsat/libyals.a ]; then

    echo "Fetching YalSAT ..."
    
    # Get YalSAT
    wget http://fmv.jku.at/yalsat/yalsat-03v.zip
    unzip yalsat-03v.zip
    rm yalsat-03v.zip
    mv yalsat-03v yalsat
    
    echo "Building YalSAT ..."
    
    cd yalsat
    ./configure.sh
    make
    cd ..
else
    echo "Assuming that a correct installation of YalSAT is present."
fi

if [ ! -f lingeling/liblgl.a ]; then
    
    echo "Fetching lingeling ..."
    
    # Get lingeling (SAT 2018, MIT-licenced)
    wget http://fmv.jku.at/lingeling/lingeling-bcj-78ebb86-180517.tar.gz
    tar xzvf lingeling-bcj-78ebb86-180517.tar.gz
    rm lingeling-bcj-78ebb86-180517.tar.gz
    mv lingeling-bcj-78ebb86-180517 lingeling
    
    echo "Building lingeling ..."

    cd lingeling
    ./configure.sh
    make
    cd ..
else
    echo "Assuming that a correct installation of lingeling is present."
fi

# make hordesat
cd hordesat-src
make
cd ..
mv hordesat-src/hordesat .
