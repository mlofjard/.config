#!/bin/bash

if ! [ -f "$1" ]
  then
    echo "Input file does not exist!"
fi

if [ -f "$1" ]
  then
    echo "Resolving filename"
    filename=$(basename "$1")
    filebase=$(echo $filename | sed -r "s/\.mkv$//")
    echo "  File base name is \"$filebase\""
    
    mkvextract tracks "$1" 2:"$filebase.ass"
    
    echo "Converting .ass to .srt"
    $(cat "$filebase.ass" | \
    grep Dialogue | \
    awk -F, 'BEGIN { TELLER="1"; }
             { printf("%s\n0%s,%s0 --> 0%s,%s0\n",
    	 	TELLER,substr($2,1,7),substr($2,9,2),substr($3,1,7),substr($3,9,2));
    		TELLER++;}
    	{ DIALOGUE=$10;
    	for(i=11;i<=NF;i++)
    	{
    		DIALOGUE=DIALOGUE","$i
    	};
    	gsub(/\\N|\\n/,"\n", DIALOGUE)
    	gsub(/\{\\i[0-1]\}/,"", DIALOGUE)
    	
    	printf ("%s\n\n",DIALOGUE)}' \
    > "$filebase.en.srt")
    
    echo "Removing temporary files"
    rm "$filebase.ass"
fi
