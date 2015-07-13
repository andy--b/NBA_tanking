#! python3

import os
import csv
import requests

# Thank god for Selenium
import selenium.webdriver as webdriver
import selenium.webdriver.support.ui as ui
from selenium.webdriver.common.keys import Keys
from selenium import webdriver
from selenium.webdriver.firefox.webdriver import FirefoxProfile

# Specify your Firefox profile path here
profile = FirefoxProfile\
	("C:/Users/Andy/AppData/Roaming/Mozilla/Firefox/Profiles/cix7hlum.default")

# Specify file name and path for input data.
# Input data should be formatted as so:
# 1st column: 3 letter team abbreviation used on b-r.com
# 2nd and 3rd cols: 4 digit start and end years, respectively
INPUT_DATA="C:/Projects/NBA/teams_formatted.csv" 


def download_data(team_info):
# Takes a 3 column list as argument. 1st column is team abbrev., 2nd and 3rd
# are start and end years for that abbrev. 

	
	# Set firefox to open with my profile
	profile = FirefoxProfile\
	("C:/Users/Andy/AppData/Roaming/Mozilla/Firefox/Profiles/cix7hlum.default")
	browser = webdriver.Firefox(profile)
	
	# Save the window opener (current window, do not mistaken with tab... not the same)
	main_window = browser.current_window_handle
	
	# Loop for each team, each year
	for team in team_info:
		for year in range(int(team[1]),int(team[2]) + 1):
			# set url
			url = "http://www.basketball-reference.com/teams/" \
			+ str(team[0]) + '/' + str(year) + '_games.html'
			
			print("Now reading ", url)
			
			#### These next 15 or so lines were done with SERIOUS help from StackOverflow
			#### I've lost the page, but if I find it again I will attribute credit here.
			
			# Open the link in a new tab by sending key strokes on the element
			Use: Keys.CONTROL + Keys.SHIFT + Keys.RETURN to open tab on top of the stack 
			browser.find_element_by_tag_name('body').send_keys(Keys.CONTROL + 't')

			# Put focus on current window which will, in fact, put focus on the current visible tab
			browser.switch_to_window(main_window)
			browser.get(url)

			# Click on the "Export" button on page
			browser.find_element_by_xpath\
			("html/body/div[1]/div[4]/div[@id = 'all_schedule']/div[1]/div[1]/span[6]").click()

			# Close current tab
			browser.find_element_by_tag_name('body').send_keys(Keys.CONTROL + 'w')

	driver.close()
	
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
