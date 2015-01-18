# bash-podcast-download
A small bash script to download all media from a podcast feed

##Usage
Change variables at the top of the file for the feed url and the folder to download the files to.

If the media file already exsists then the file is not downloaded. 

Assumes that the RSS feed is formatted correctly with media in the correct hirachy

...xml

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
```
