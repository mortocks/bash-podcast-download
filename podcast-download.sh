#!/bin/bash


# Variables
FEED='http://myfeed.com/rss'
FOLDER='/PATH/TO/MY/FOLDER'

# Create destination folder if it doesn't exsist
if [ -d $FOLDER ]; then
	echo "$FOLDER exists"
else 
	mkdir $FOLDER
fi 


# Get the full XML feed | extract the enclosure url attribute | extract the url
MEDIA=$(curl -s $FEED | xpath '/rss/channel/item/enclosure/@url' | egrep -o 'http?://[^"<]+' )


# Loop through and download file if not already downloaded
while IFS= read -r URL
do

	# Find the last part of the url using the / as delimiter
	AFTER_SLASH=${URL##*/}

	# Remove any additional query params in the filename by removing everything after ?
	FILE_NAME=${AFTER_SLASH%%\?*}

	# If file as already been downloaded ignore
	if [ -f $FOLDER/$FILE_NAME ]; then
		echo "$FILE_NAME Exists"
	else 
		echo "Download $FOLDER/$FILE_NAME"
		curl -s -L $URL > $FOLDER/$FILE_NAME
	fi 

done <<< "$MEDIA"
