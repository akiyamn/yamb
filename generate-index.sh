#!/bin/bash

OUT=index.md

title=$1
if [ -n $title ]; then
	title='Index'
fi

echo -e "---\ntitle: $title\n---\n"
echo -e '|Article Title|Date|\n' '|-|-|'

for f in `ls -t *.md`; do
	#title=`grep -s title test2.html | sed 's/\ *<\/*title>//g'`
	if [ $f != $OUT ]; then
		file_title=`grep -s title $f | cut -d ' ' -f 2-`
		if [ -n $title ]; then
			file_title=`echo $f | cut -d '.' -f 1`
		fi
		date=`date -r $f`
		html_file=`echo $f | sed s/.md/.html/`
		echo "|[$file_title]($html_file)|$date|"
	fi
done
