#!/bin/bash

# Make sure cf_units can find the udunits library.
if [[ $(uname) == Darwin ]]; then
    EXT=dylib
else
    EXT=so
fi

SITECFG=cf_units/etc/site.cfg
echo "[System]" > $SITECFG
echo "udunits2_xml_path = $PREFIX/share/udunits/udunits2.xml" >> $SITECFG


$PYTHON setup.py build_ext -I$PREFIX/include -L$PREFIX/lib
$PYTHON setup.py install --single-version-externally-managed  --record record.txt
cat record.txt
