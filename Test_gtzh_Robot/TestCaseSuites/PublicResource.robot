*** Settings ***
Documentation     Browser:firefox,chrome,phantomjs
Library           Selenium2Library

*** Variables ***
${SERVER}         https://dev.gtzh.51ijk.com
${0.5 seconds}    0.5
${1 seconds}      1.5
${2 seconds}      2.5
${3 seconds}      3
${BROWSER}        chrome
&{USER}           doctor=liang    Assistant=yushuiqing    Nurse=zhangdh    Dietician=jinglulu    FootDoctor=zuping
${Valid User}     gtzh
${Valid Password}    123123
${Invalid User}    demo
${Invalid Password}    demo

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    sleep    ${2 seconds}
    Input Text    name=username    ${username}
    Input text    name=password    ${password}
    Click Element    xpath=//*[@id='app-container']/div/button
    Sleep    ${1 seconds}

QuitBrowser
    Close All Browsers
