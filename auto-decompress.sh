#!/bin/bash
#requires detox

line_num=1
directory="EDIT-DIRECTORY-VARIABLE"
line_output="placeholder"
threads="0"

#BE CAREFULL WITH THIS.DO NOT ADD A "/" AT THE END OF THE DIRECTORY OR THE FOLDER STRUCTURE WILL BREAK
detox $directory

cd $directory
ls -p | grep ".tar" > "lsdir.txt"

echo ""
echo "IGNORE TAR ERRORS.ITS JUST MY AWFUL CODE.THE DATA IS FINE."
echo ""
echo "threads used can be changed in the script"


#decompress with xz
while [ 0 -lt ${#line_output} ]
do
	line_output=$(sed -n "$line_num"p lsdir.txt)
	xz -d "$line_output"
	((line_num=line_num+1))
	echo ""
	echo "$line_output has been decompressed"
done

rm -rf lsdir.txt
ls -p | grep ".tar" > "lsdir.txt"
line_num=1
echo "$line_num"
line_output=placeholder


#decompress with tar
while [ 0 -lt ${#line_output} ]
do
        line_output=$(sed -n "$line_num"p lsdir.txt)
        tar -xf "$line_output"
	rm -rf "$line_output"
        ((line_num=line_num+1))
        echo ""
        echo "$line_output has been detarred"
done



rm -rf .tar
rm -rf lsdir.txt
