#!/bin/bash

old_lingeling=false
if [ "$OLD_LINGELING" != "" ]; then

    # Old Lingeling (original hordesat)
    old_lingeling=true
    echo "Use old lingeling"

    if [ ! -d lingeling ]; then
        wget http://fmv.jku.at/lingeling/lingeling-ayv-86bf266-140429.zip
        unzip lingeling-ayv-86bf266-140429.zip
        mv *.txt code/
        rm build.sh
        mv code lingeling
    fi
    make lingeling
    cd lingeling
    ./configure.sh
    make
    cd ..
    
else

    # New Lingeling + YalSAT (mallob-like)
    echo "Use new lingeling + YalSAT"

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
fi

# make hordesat
cd hordesat-src
if $old_lingeling ; then make OLD_LINGELING=1 ; else make OLD_LINGELING=0 ; fi
cd ..
mv hordesat-src/hordesat .
