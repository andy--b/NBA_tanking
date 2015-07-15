#### Andy Bowling
#### Tanking and the NBA: A statistical analysis
#### July 2015
#### This file scrapes data from basketball-reference.com and stores
#### files in an organized hierarchy.

#! python3

import os
import requests
import shutil
import time

# Thank god for Selenium
import selenium.webdriver as webdriver
import selenium.webdriver.support.ui as ui
from selenium.webdriver.common.keys import Keys
from selenium import webdriver
from selenium.webdriver.firefox.webdriver import FirefoxProfile

####### SET THE FOLLOWING VARIABLES PRIOR TO RUNNING THE PROGRAM

# Specify your Firefox profile path here. It is crucial that this profile downloads
# csv's AUTOMATICALLY upon clicking without a dialog box.
profile = FirefoxProfile\
	("C:/Users/Andy/AppData/Roaming/Mozilla/Firefox/Profiles/cix7hlum.default")

# Specify file name and path for input data.
# Input data should be formatted as so:
# 1st column: 3 letter team abbreviation used on b-r.com
# 2nd and 3rd cols: 4 digit start and end years, respectively
INPUT_DATA="C:/Projects/NBA/teams_formatted.csv" 

# Choose directory where the whole mess of team data will be stored
# Individual subfolders will be created for each team
OUTPUT_PATH="C:/Projects/NBA/game_data/"

# Where do files download to on this computer?
DOWNLOADS_FOLDER = 'C:/Users/Andy/Downloads/'


def download_data(team_info):
# Takes a 3 column list as argument. 1st column is team abbrev., 2nd and 3rd
# are start and end years for that abbrev. 
	
	if not os.path.exists(OUTPUT_PATH): 
		os.makedirs(OUTPUT_PATH)
	
	# Set firefox to open with my profile
	profile = FirefoxProfile\
	("C:/Users/Andy/AppData/Roaming/Mozilla/Firefox/Profiles/cix7hlum.default")
	browser = webdriver.Firefox(profile)
	
	# Save the window opener (current window, do not mistaken with tab... not the same)
	main_window = browser.current_window_handle
	browser.get('https://www.google.com')
	# Loop for each team, each year
	for team in team_info:
		# Create subfolder for each team within the OUTPUT_PATH folder
		team_path = str(OUTPUT_PATH) + '/' + team[0] + '/'
		if not os.path.exists(team_path): 
			os.makedirs(team_path)
		
		for year in range(int(team[1]),int(team[2]) + 1):
			# set url
			url = "http://www.basketball-reference.com/teams/" \
			+ str(team[0]) + '/' + str(year) + '_games.html'
			
			print("Now reading", url)
			
			# After experiencing a few errors, found that adding a half second pause
			# Stops problems with reading web page
			time.sleep(.5)
			
			#### These next 15 or so lines were done with SERIOUS help from StackOverflow
			#### I've lost the page, but if I find it again I will attribute credit here.
			
			# Open the link in a new tab by sending key strokes on the element
			# Use: Keys.CONTROL + Keys.SHIFT + Keys.RETURN to open tab on top of the stack 
			browser.find_element_by_tag_name('body').send_keys(Keys.CONTROL + 't')

			# Put focus on current window which will, in fact, put focus on the current visible tab
			browser.switch_to_window(main_window)
			browser.get(url)

			# Click on the "Export" button on page
			browser.find_element_by_xpath\
			("//div[@id = 'all_schedule']/div[1]/div[1]/span[6]").click()
			# Close current tab
			browser.find_element_by_tag_name('body').send_keys(Keys.CONTROL + 'w')
			
			# Move file from downloads folder to destination folder
			file_name = 'teams_' + team[0] + '_' + str(year) + '_games_teams_games.csv'
			old_location = DOWNLOADS_FOLDER + file_name
			new_location = team_path + file_name
			
			# Half a second allotted for file download. Increase as needed
			time.sleep(.5)
			shutil.move(old_location, new_location)
			
	# Close browser at end of entire operation
	browser.close()
	
	return None
	
with open(INPUT_DATA) as csvfile:
	# read csv file
	a = csvfile.readlines()
	
	# Iterate through each line to get proper formatting
for line in range(len(a)):
	a[line] = a[line].replace('\n','').split(',')
	
# Pass through formatted list to download_data fn
# This will download all team data, which will take significant time
download_data(a)
