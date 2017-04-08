*** Settings ***
Library           Selenium2Library
Resource          PublicResource.robot

*** Test Cases ***
有效用户名密码登录
    [Documentation]    输入正确的用户名(gtzh)、密码(123123)
    [Tags]    OK
    Login    ${Valid User}    ${Valid Password}
    验证    xpath=.//*[@id='rubix-nav-header']/div/div/div[2]/div/span    北大医院－糖尿病共同照护系统
    [Teardown]    QuitBrowser

无效用户名登录
    [Documentation]    输入无效的用户名.
    ...
    ...    期望提示：用户名不存在或已被禁用, 请联系管理员
    [Tags]    OK
    Login    ${Invalid User}    ${Valid Password}
    验证    xpath=.//*[@id='app-container']/div/div[4]    用户名不存在或已被禁用, 请联系管理员
    [Teardown]    QuitBrowser

无效密码登录
    [Documentation]    输入有效的用户名 、无效的密码
    ...    期望提示：用户名或密码错误, 请重试
    [Tags]    OK
    Login    ${Valid User}    ${InValid Password}
    验证    xpath=.//*[@id='app-container']/div/div[4]    用户名或密码错误, 请重试
    [Teardown]    QuitBrowser

医助角色登录
    [Documentation]    用医助 yushuiqing 登录。
    [Setup]    Login    ${USER.Assistant}    ${Valid Password}
    验证    xpath=.//*[@id='rubix-nav-header']/div/div/div[2]/div/span    北大医院－糖尿病共同照护系统
    [Teardown]    QuitBrowser

护理师角色登录
    [Documentation]    用护理师 zhangdh 登录
    [Setup]    Login    ${USER.Nurse}    ${Valid Password}
    验证    xpath=.//*[@id='rubix-nav-header']/div/div/div[2]/div/span    北大医院－糖尿病共同照护系统
    [Teardown]    QuitBrowser

营养师角色登录
    [Documentation]    用营养师jinglulu 登录
    [Setup]    Login    ${USER.Dietician}    ${Valid Password}
    验证    xpath=.//*[@id='rubix-nav-header']/div/div/div[2]/div/span    北大医院－糖尿病共同照护系统
    [Teardown]    QuitBrowser

足评师角色登录
    [Documentation]    用足评师zhuping 登录
    [Setup]    Login    ${USER.FootDoctor}    ${Valid Password}
    验证    xpath=.//*[@id='rubix-nav-header']/div/div/div[2]/div/span    北大医院－糖尿病共同照护系统
    [Teardown]    QuitBrowser

医生角色登录
    [Documentation]    用 liang 医生登录
    [Setup]    Login    ${USER.doctor}    ${Valid Password}
    验证    xpath=.//*[@id='rubix-nav-header']/div/div/div[2]/div/span    北大医院－糖尿病共同照护系统
    [Teardown]    QuitBrowser

*** Keywords ***
验证
    [Arguments]    ${get element property}    ${expect results}
    ${actual results}    get text    ${get element property}
    should contain    ${actual results}    ${expect results}
