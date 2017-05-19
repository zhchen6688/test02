*** Settings ***
Test Teardown    Close Browser
Library          pymongo
Library          MongoDBLibrary
Library          Selenium2Library

*** Test Cases ***
删除数据(患者姓名)
   [Documentation]   输入DEV数据库连接信息，输入姓名，删除用户关联的所有数据.
   Connect To Mongodb   mongodb://paperKingDevelopingByiHealth:d3Wrg40dE@120.131.8.26/paper-king-developing   27017
   Delete Patient Data Gtzh   paper-king-developing   00000AAAB
   Disconnect From Mongodb

删除数据(手机号)
   [Documentation]   输入DEV数据库连接信息，输入手机号，删除对应用户关联的所有数据.
   Connect To Mongodb   mongodb://paperKingDevelopingByiHealth:d3Wrg40dE@120.131.8.26/paper-king-developing   27017
   Delete Duplicate Mobile Data Gtzh   paper-king-developing   12312312312
   Disconnect From Mongodb

插入数据(待预约)
   [Documentation]   创建待预约,未签到 用户数据.
   Connect To Mongodb   mongodb://paperKingDevelopingByiHealth:d3Wrg40dE@120.131.8.26/paper-king-developing   27017
   Insert Daiyuyue Patient Gtzh   paper-king-developing   陈忠华   13717983335
   Disconnect From Mongodb

插入数据(初诊)
   [Documentation]   创建已签到,初诊状态用户数据.
   Connect To Mongodb   mongodb://paperKingDevelopingByiHealth:d3Wrg40dE@120.131.8.26/paper-king-developing   27017
   Insert Chuzhen Patient Gtzh   paper-king-developing   00000BBBB   19120872017
   disconnect from mongodb

插入数据(复诊)
   [Documentation]   创建复诊状态用户数据.
   Connect To Mongodb   mongodb://paperKingDevelopingByiHealth:d3Wrg40dE@120.131.8.26/paper-king-developing   27017
   Insert Fuzhen Patient Gtzh   paper-king-developing   0000000A   13717983335
   #   Connect To Mongodb   mongodb://paperKingStagingByiHealth:d3Sid92jcxe9W@120.131.8.26/paper-king-staging   27017
   #   Insert Fuzhen Patient Gtzh   paper-king-staging   00000AAAB   13717983335
   Disconnect From Mongodb

temp1
   [Documentation]    权限
   log   ${CURDIR}
   evaluate   os.system('python /Users/barry/Downloads/role.py')   os

插入角色
    # Import Library    datetime
    ${DATE}   Evaluate    datetime.datetime.utcnow()   datetime
    Log    ${DATE}
    Connect To Mongodb    mongodb://paperKingDevelopingByiHealth:d3Wrg40dE@120.131.8.26/paper-king-developing   27017
    Save Mongodb Records    paper-king-developing    userAdmin    {"roleName" : "Test001","caseRecord" : 1,"clinicalLabResults" : 3,"appointment" : 1,"nutritionAt" : 3,"insulinAt" : 1,"footAt" : 1,"quantizationAt" : 1,"soap" : 3,"superAdmin" : 0,"updateAt" : "${DATE}", "createAt" :"${DATE}","eyeground" : 3}
    Disconnect From Mongodb
