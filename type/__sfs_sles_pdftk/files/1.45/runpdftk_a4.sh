#!/bin/bash
mydir=$(dirname $1)
myname=$(basename $1)
cd "${mydir}"
for i in ${myname}*.pdf; do
/usr/local/bin/gs-907 -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -sPAPERSIZE=a4 -sFIXEDMEDIA -dAutoRotatePages=/PageByPage -dPDFFitPage -sOutputFile=a4_$i $i>/dev/null
done
/usr/local/bin/pdftk a4_${myname}*.pdf cat output $2
rm a4_${myname}*.pdf
