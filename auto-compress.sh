#!/bin/bash
#requires detox

line_num=1
directory="DIRECTORY"
line_output="placeholder"
threads="6"

#BE CAREFULL WITH THIS.DO NOT ADD A "/" AT THE END OF THE DIRECTORY OR THE FOLDER STRUCTURE WILL BREAK
detox $directory
cd $directory
ls -p | grep / > "lsdir.txt"

echo "IGNORE TAR ERRORS.ITS JUST MY AWFUL CODE.THE DATA IS FINE."
echo ""
echo "threads used can be changed in the script"

while [ 0 -lt ${#line_output} ]
do
	line_output=$(sed -n "$line_num"p lsdir.txt | awk '{ print substr( $0, 1, length($0)-1 ) }')
	tar -cf "$line_output.tar" "$line_output" && xz -z -9 --threads=$threads "$line_output.tar"
	rm -rf "$line_output"
	((line_num=line_num+1))
	echo ""
	echo "$line_output has been tarred"
done

rm -rf .tar
rm -rf lsdir.txt
