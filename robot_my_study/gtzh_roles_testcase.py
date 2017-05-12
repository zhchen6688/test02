# -*- coding: utf-8 -*-
import time,sys
# from selenium.webdriver.firefox.webdriver import WebDriver
from selenium.webdriver.common.action_chains import ActionChains
import unittest
import initDriver
import main_roles

def is_alert_present(wd):
    try:
        wd.switch_to_alert().text
        return True
    except:
        return False

class permissionClass(unittest.TestCase):
    def setUp(self):
        self.gtzh = initDriver.gtzhClass()
        self.driver = self.gtzh.init_browser_driver()
        time.sleep(1)

    def test_add_role(self):
        success = True
        wd = self.driver
        wd.get(main_roles.web_url)
        self.gtzh.login()

        '添加医助角色'
        wd.find_element_by_css_selector("span.icon-fontello-cog-6.rubix-icon").click()
        wd.find_element_by_id("user-admin-tabs-tab-1").click()
        ActionChains(wd).move_to_element(wd.find_element_by_id("user-admin-tabs")).perform()
        ActionChains(wd).move_to_element(wd.find_element_by_xpath("//div[@id='user-admin-tabs-pane-1']//div[.=' 添加']")).perform()
        ActionChains(wd).move_to_element(wd.find_element_by_xpath("//div[@id='user-admin-tabs-pane-1']//button[.=' 添加']")).perform()
        wd.find_element_by_xpath("//div[@id='user-admin-tabs-pane-1']//button[.=' 添加']").click()
        '输入角色名称'
        wd.find_element_by_id("roleName").send_keys(main_roles.role_name)
        wd.find_element_by_xpath("//*[@id='user-admin-tabs-pane-1']/div/div[2]/table/tbody[1]/tr/td[12]/span[1]").click()
        ActionChains(wd).move_to_element(wd.find_element_by_xpath("//div[@id='user-admin-tabs-pane-1']//span[.='编辑']")).perform()
        self.assertTrue(success)
        wd.close()

    def tearDown(self):
        self.driver.quit()

if __name__ == "__main__":
    suite = unittest.TestSuite()
    suite.addTest(permissionClass("test_add_role"))
    unittest.TextTestRunner().run(suite)