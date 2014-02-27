#!/bin/bash
exec "/usr/local/bin/pdftk" $1*.pdf cat output $2
 
