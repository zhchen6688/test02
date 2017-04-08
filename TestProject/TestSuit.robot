*** Settings ***
Resource          myRsource1.robot
Library           Selenium2Library

*** Test Cases ***
test case1
    @{abc}    create list    a    b    c
    : FOR    ${i}    IN    @{abc}
    \    Exit For Loop If    '${i}' == 'c'
    log    ${i}
    ${years}    get time    year

test case2
    ${a}    Set variable    89
    run keyword if    ${a} >=90    log    优秀
    ...    ELSE IF    ${a} <=70    log    良好
    ...    ELSE IF    ${a} <=60    log    及格
    ...    ELSE    log    不及格

test case3
    @{abc}    create list    a    b    C
    : FOR    ${var}    IN    @{abc}
    \    Exit For Loop If    '${var}' == 'C'
    log    ${var}

test case4
    @{abc}    create list    a    b    c
    : FOR    ${i}    IN    @{abc}
    \    Exit For Loop If    '${i}' == 'c'
    log    ${i}

test case5
    comment

test case6
    comment    这是注释
    import library    /Users/barry/github/my/test02/TestProject/test.py
    ${a}    evaluate    int(4)
    ${b}    evaluate    int(5)
    ${add}    myadd    ${a}    ${b}
    log    ${add}

test case7
    [Documentation]    访问字典
    log many    ${USER}
    log many    ${USER.doctor}
    log many    ${USER.password}

gtzh_case1_Login
    open    https://dev.gtzh.51ijk.com
    Sleep    1.5
    username    gtzh
    password    123123
    click login
    close

gtzh_case2_QianDao
    Comment    登录
    Login dev website
    Comment    1)点击左侧边栏 2)点击待预约管理
    click left sidebar
    Comment    点击新建(待预约用户)
    Click element    css=span.glyphicon-plus.glyphicon
    comment    输入姓名、病历号、电话
    Input Text    name=nickname    999AAA
    Input Text    name=hisNumber    999AAA
    Input Text    name=mobile    13300000091
    Sleep    0.5
    comment    点击保存
    Click element    xpath=//div[@class='table-responsive']//span[.='保存']
    Sleep    1
    close

*** Keywords ***
