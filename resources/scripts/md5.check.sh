#!/bin/bash

pushd ../../bootisos/

for d in `find . -type d`
do
pushd $d
for f in `find . -maxdepth 1 -type f \( -iname "*.iso" -o -iname "*.bin" -o -iname "*.img" \) -printf "%f\n"`
do
	if [ -f ${f}.md5 ]
	then
		md5sum -c $f.md5
		# if not exit code = 0 read "md5 failed on $f"
	else
		echo "# generating $f.md5"
		md5sum $f > $f.md5
		cat $f.md5
	fi
done
popd
done
popd

read -n 1 -p "Press any key to continue..."
