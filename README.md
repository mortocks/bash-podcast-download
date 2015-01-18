# Bash Podcast Download
A simple bash script to download all media from a podcast feed

##Usage
Call the script using

	sh podcast-download.sh http://myfeed.com/rss /PATH/TO/DOWNLOAD/FOLDER
	
###Optional

You can hardcode the feed and output path by changing the variables at the top of the file. You can then ommit the feed and folder when envoking the script

	# Variables
	FEED='http://myfeed.com/rss'
	FOLDER='/PATH/TO/MY/FOLDER'


If the media file already exsists then the file is not downloaded. 

Assumes that the RSS feed is formatted correctly with media in the correct hirachy

####Feed requirments

	<?xml version="1.0" encoding="UTF-8"?>
	<rss version="2.0" xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" xmlns:media="http://search.yahoo.com/mrss/">
  	<channel>
  		...nodes...
		<item>
			...nodes...
			<enclosure url="http://theFileToDownload.extension"/>
		</item>
		<item>
			...nodes...
			<enclosure url="http://theFileToDownload.extension"/>
		</item>
	</channel>
	</rss>
	

####Platform Requirments
This script was written on an OSX machine so assumes that you have the following programs installed

- curl
- xpath
- egrep
- sed

####TODO

- Create option to rename files to the title of the item + original file extension
