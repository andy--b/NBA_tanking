#! python3

import os
import selenium.webdriver as webdriver
import selenium.webdriver.support.ui as ui
from selenium.webdriver.common.keys import Keys

from selenium import webdriver

from selenium.webdriver.firefox.webdriver import FirefoxProfile

def download_data(teams, years):
# Takes a list of teams and list of year values and downloads game records for those teams/years
	
	# Set firefox to open with my profile
	profile = FirefoxProfile\
	("C:/Users/Andy/AppData/Roaming/Mozilla/Firefox/Profiles/cix7hlum.default")
	browser = webdriver.Firefox(profile)
	# Save the window opener (current window, do not mistaken with tab... not the same)
	main_window = browser.current_window_handle
	
	# Loop for each team, each year
	for team in teams:
		for year in years:
			# set url
			url = "http://www.basketball-reference.com/teams/" \
			+ str(team) + '/' + str(year) + '_games.html'
			
			# Open the link in a new tab by sending key strokes on the element
			# Use: Keys.CONTROL + Keys.SHIFT + Keys.RETURN to open tab on top of the stack 
			browser.find_element_by_tag_name('body').send_keys(Keys.CONTROL + 't')

			# Put focus on current window which will, in fact, put focus on the current visible tab
			browser.switch_to_window(main_window)
			browser.get(url)

			# Click on the "Export" button on page
			browser.find_element_by_xpath\
			("html/body/div[1]/div[4]/div[@id = 'all_schedule']/div[1]/div[1]/span[6]").click()

			# Close current tab
			browser.find_element_by_tag_name('body').send_keys(Keys.CONTROL + 'w')

	# driver.close()
	
download_data(['CLE','CHI'],[1995,2006])

