#!/bin/bash
set -e
for sb in $(find ./ -name 'SLKBUILD' | sort)
do
	unset pkgname location files pkgver readmeline line
	location=$(dirname $sb)
	if [ -f $sb ]; then
		. $sb
		echo "SLACKBUILD NAME: $pkgname"
		echo "SLACKBUILD LOCATION: $location"
		files="SLKBUILD"
		for i in ${source[@]}; do
			files="$files `basename $i`"
		done
		echo "SLACKBUILD FILES: $files slack-desc"
		echo "SLACKBUILD VERSION: $pkgver"
		if [ -f $location/build.dep ]; then
			echo "SLACKBUILD REQUIRES: `cat $location/build.dep | head -n 1`"
		else
			echo "SLACKBUILD REQUIRES:"
		fi
		echo "SLACKBUILD SHORT DESCRIPTION:  ${slackdesc[0]}"
		echo
		echo "$pkgname: ${slackdesc[0]}" > $location/slack-desc
		echo "$pkgname:" >> $location/slack-desc
		echo "$pkgname: ${slackdesc[1]}" >> $location/slack-desc
		echo "$pkgname: ${slackdesc[2]}" >> $location/slack-desc
		echo "$pkgname: ${slackdesc[3]}" >> $location/slack-desc
		echo "$pkgname: ${slackdesc[4]}" >> $location/slack-desc
		echo "$pkgname: ${slackdesc[5]}" >> $location/slack-desc
		echo "$pkgname: ${slackdesc[6]}" >> $location/slack-desc
		echo "$pkgname: ${slackdesc[7]}" >> $location/slack-desc
		echo "$pkgname: ${slackdesc[8]}" >> $location/slack-desc
		echo "$pkgname: ${slackdesc[9]}" >> $location/slack-desc
		fi
done > SLACKBUILDS.TXT
gzip -9 SLACKBUILDS.TXT -c > SLACKBUILDS.TXT.gz
set +e
