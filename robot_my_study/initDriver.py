# coding=utf-8
# from selenium import webdriver
from selenium.webdriver.firefox.webdriver import WebDriver
import time

class gtzhClass(object):
    def init_browser_driver(self):
        try:
            driver = WebDriver()
            driver.implicitly_wait(30)
            driver.maximize_window()
            self.driver = driver
        except Exception:
            raise BaseException("open firefox occur error")
        return driver

    def login(self, username='gtzh', password='123123'):
        try:
            self.driver.find_element_by_name('username').send_keys(username)
            self.driver.find_element_by_name('password').send_keys(password)
            time.sleep(1)
            self.driver.find_element_by_xpath("//*[@id='app-container']/div/button").click()
        except Exception as e:
            print e


# if __name__ == '__main__':
#     driver = gtzhClass()