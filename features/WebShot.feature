Feature: WebShot Functionality
	In order to get data from a webpage
	The QBot
	Should browse an url, capture html source and get an Image Stamp

Scenario: Gettin webpage data
	Given QBot is running
	When QBot is surfing a webpage
	Then QBot should get a snapshot
