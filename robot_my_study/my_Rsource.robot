*** Variables ***
${scalarVar}      999
@{listVar}
&{dictVar}
&{USER}           doctor=gtzh    password=123123

*** Keywords ***
随机字符
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    Log    ${arg1}
    log    ${arg2}
    Log    =@{arg3}=

随机字符-1
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    Log    ${arg1}
    log    ${arg2}
    Log    =@{arg3}=
    [Return]    ${arg1}

随机字符-2
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    Log    ${arg1}
    log    ${arg2}
    Log    =@{arg3}=
    [Return]    ${arg1}    ${arg2}

随机字符-3
    [Arguments]    ${arg1}    ${arg2}=123    @{arg3}
    Log    ${arg1}
    log    ${arg2}
    Log    =@{arg3}=
    [return]   @{arg3}
