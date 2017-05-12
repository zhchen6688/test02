import unittest
import sys

web_url = str(sys.argv[1])
role_name = str(sys.argv[2])

cases = ['gtzh_roles_testcase.permissionClass']

suite = unittest.TestSuite()
if __name__ == '__main__':
    for test in cases:
        try:
            print test
            suite.addTest(unittest.defaultTestLoader.loadTestsFromName(test))
            unittest.TextTestRunner().run(suite)
        except Exception as e:
            print 'ERROR: Skipping tests from "%s".' % test
            try:
                __import__(test)
            except ImportError:
                print 'Could not import the test module'
            else:
                print 'Could not load the test suite'
            from traceback import print_exc
            print_exc
