import os
import selenium.webdriver as webdriver
import selenium.webdriver.support.ui as ui
from selenium.webdriver.common.keys import Keys

from selenium import webdriver

from selenium.webdriver.firefox.webdriver import FirefoxProfile

profile = FirefoxProfile("C:/Users/Andy/AppData/Roaming/Mozilla/Firefox/Profiles/cix7hlum.default")

def getURLinfo(url):
	browser = webdriver.Firefox(profile)

	# Save the window opener (current window, do not mistaken with tab... not the same)
	main_window = browser.current_window_handle

	# Open the link in a new tab by sending key strokes on the element
	# Use: Keys.CONTROL + Keys.SHIFT + Keys.RETURN to open tab on top of the stack 
	browser.find_element_by_tag_name('body').send_keys(Keys.CONTROL + 't')

	# Switch tab to the new tab, which we will assume is the next one on the right
	# browser.find_element_by_tag_name('body').send_keys(Keys.CONTROL + Keys.TAB)

	# Put focus on current window which will, in fact, put focus on the current visible tab
	browser.switch_to_window(main_window)
	browser.get(url)

	# Click on the "Export" button on page
	browser.find_element_by_xpath("html/body/div[1]/div[4]/div[@id = 'all_schedule']/div[1]/div[1]/span[6]").click()

	# Close current tab
	browser.find_element_by_tag_name('body').send_keys(Keys.CONTROL + 'w')

	# driver.close()
	
getURLinfo("http://www.basketball-reference.com/teams/LAL/1995_games.html")

