#!/bin/bash

read -p "ID: " CPASS_id
read -sp "Pass: " CPASS_pass

CONC="$CPASS_id$CPASS_pass"

SEDNONUM="s/[0-9]//g"
SEDUCASE="s/\([adf]\)/\\U\\1/g"
AWKSHORT='{print substr($1, 1, 15)}'
AWKSPEC='{print substr($1, 1, 2) "-" substr($1, 3, 3) "+" substr($1, 6, 10)}'

HASH=`echo $CONC | sha512sum | awk '{print $1}'`

HASHNORM=`echo $HASH | awk "$AWKSHORT" | sed $SEDUCASE` 
HASHNONUM=`echo $HASH | sed $SEDNONUM | awk "$AWKSHORT" | sed $SEDUCASE`
HASHNORMSPEC=`echo $HASHNORM | awk "$AWKSPEC"`
HASHNONUMSPEC=`echo $HASHNONUM | awk "$AWKSPEC"`

echo
echo
echo "Raw:    $HASH"

echo
echo "Normal: $HASHNORM"
echo "Nonum:  $HASHNONUM"
echo "-------------------------"
echo "Spec 1: $HASHNORMSPEC"
echo "-------------------------"
echo "Spec 2: $HASHNONUMSPEC"
