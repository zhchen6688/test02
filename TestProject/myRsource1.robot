*** Variables ***
@{listVar}
&{dictVar}
${scalarVar}      999
&{USER}           doctor=gtzh    password=123123

*** Keywords ***
username
    [Arguments]    ${username}
    Input Text    name=username    ${username}

password
    [Arguments]    ${password}
    input text    name=password    ${password}

click login
    Click Element    xpath=//*[@id='app-container']/div/button

verify

close
    Close Browser

open
    [Arguments]    ${url}
    Open Browser    ${url}

click left sidebar
    Comment    展开左边侧栏
    Click element    css=span.icon-fontello-th-list-5.rubix-icon
    Sleep    1.5
    comment    点击待预约管理
    Click element    xpath=//a[contains(@href,'booking')]
    comment    收缩回左边侧栏
    Click element    css=span.icon-fontello-th-list-5.rubix-icon
    Sleep    1

Login dev website
    open    https://dev.gtzh.51ijk.com
    Sleep    1.5
    Maximize Browser Window
    Sleep    1.5
    username    gtzh
    password    123123
    click login
    Sleep    2
