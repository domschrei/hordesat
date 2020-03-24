
# get lingeling
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

# make hordesat
cd hordesat-src
make
cd ..
mv hordesat-src/hordesat .
