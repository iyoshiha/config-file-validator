#!/bin/bash

for file in $(find . -maxdepth 1 -type f -exec basename {} \;)
do
	filename_without_extension="${file%.*}"
	extension=$(expr "$file" : '.*\.\(.*\)$')
	# sed -i "s/$extension/\U&/g" "$file"

	first_two_characters="${extension:0:2}"
	rest_char="${extension:2}"
	ext=`echo $first_two_characters | tr [a-z] [A-Z]`
		
	replace="$filename_without_extension.$ext$rest_char"
	mv $file $replace
done

# # ファイル名の拡張子の部分を取得

