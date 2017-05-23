*** Settings ***
Resource         my_Rsource.robot

*** Test Cases ***
testcase1-IF
   [Documentation]   IF 语句
   [Tags]   ok
   ${a}   Set variable   89
   run keyword if   ${a} >=90   log   优秀
   ...   ELSE IF   ${a} <=70   log   良好
   ...   ELSE IF   ${a} <=60   log   及格
   ...   ELSE   log   不及格

testcase11-IF
   [Documentation]   IF 语句
   [Tags]   pass
   ${a}   Set variable   0
   ${b}   Set variable   5
   #多行写法
   run keyword if   ${a} >=1   log   1
   ...   ELSE IF   ${b}<=4   log   2
   ...   ELSE IF   ${b}<=7   log   5
   ...   ELSE   log   3
   #单行写法
   run keyword if   ${a} >=1   No Operation
   ...   ELSE   log   6

testcase2-FOR
   [Documentation]   FOR 循环
   @{abc}   create list   a   b   c
   : FOR   ${i}   IN   @{abc}
   \   Exit For Loop If   '${i}' == 'c'
   log   ${i}
   ${years}   get time   year

testcase21-FOR
   [Documentation]   FOR IN RANGE end
   : FOR   ${i}   IN RANGE   10
   \   LOG   y=${i}
   log   ===========
   : FOR   ${k}   IN RANGE   1   10
   \   LOG   j=${k}

testcase22-FOR
   [Documentation]   FOR IN RANGE start end [step]
   : FOR   ${k}   IN RANGE   1   10
   \   LOG   k=${k}
   log   ===========
   : FOR   ${z}   IN RANGE   1   10   2
   \   LOG   z=${z}
   log   ===========
   : FOR   ${x}   IN RANGE   10   1   -2
   \   LOG   x=${x}

testcase23-FOR
   [Documentation]   循环嵌套
   : FOR   ${i}   IN RANGE   2
   \   LOG   i=${i}
   \   FORANDFOR   ${i}

testcase-Exit-FOR
   [Documentation]   Exit For Loop If condition
   #第一种写法
   : FOR   ${i}   IN RANGE   10
   \   Log   i=${i}
   \   Run Keyword If   ${i}>=3   log   chenzhonghua
   \   Run Keyword If   ${i}>=3   Exit For Loop
   #第二种写法
   Log   =======================
   : FOR   ${i}   IN RANGE   10
   \   Log   i=${i}
   \   Exit For Loop If   ${i}>=3

testcase5-List
   @{varVal4}   create list   abcd   WARN
   log   ${varVal4}
   ${varVal4}   create list   1234   5678
   log   ${varVal4}

testcase6-invoking-python-file
   [Documentation]   调用外部test.py文件中的myadd函数
   comment   这是注释
   # import library   ${CURDIR}/test.py
   ${a}   evaluate   int(4)
   ${b}   evaluate   int(5)
   # ${add}   myadd   ${a}   ${b}
   # log   ${add}

testcase7-Dict
   [Documentation]   访问字典
   log many   ${USER}
   log many   ${USER.doctor}
   log many   ${USER.password}

testcase8-List
   @{abc}   create list   a   b   c
   : FOR   ${i}   IN   ${abc}
   \   log   ${i}
   comment   访问列表中第一个元素
   log   ${abc[0]}

testcase9-Run-Keyword
   @{L}   create list   hello world !   WARN
   ${keyword}   set variable   log
   run keyword   ${keyword}   ${L}

testcase10-RuturnValue
   随机字符   arg1value

testcase11-RuturnValue1
   [Documentation]   有1个返回值的情况
   ${returnArg1}   随机字符-1   arg1value1
   log   返回值为:${returnArg1}
   log   ============
   随机字符-1   arg1value1
   log   ============

testcase12-RuturnValue2
   [Documentation]   有2个返回值的情况
   [Timeout]   500 milliseconds
   comment   1.使用 scalar 变量接收返回值
   ${returnArg2}   随机字符-2   arg1value1
   log   ${returnArg2}
   log   ================================
   comment   2.使用 list 变量接收返回值
   @{listArg2}   随机字符-2   arg1value1
   log   =@{listArg2}=
   log   ================================
   comment   3.使用多个 scalar 变量接收返回值
   ${varArg1}   ${varArg2}   随机字符-2   arg1value1
   log   ${varArg1}=${varArg2}

testcase13-RuturnValue3
   [Documentation]   有3个返回值的情况
   ${returnArg3}   随机字符-3   arg1value   \   arg3
   log   ${returnArg3}
   log   ================================
   @{ListArg3}   随机字符-3   arg1value   \   arg3
   log   =@{ListArg3}=

testcase14
   ${time}   get time   year month day
   ${year}   ${month}   ${day}   Get Time   year and month and day
   ${DATE}   Catenate   ${year}${month}${day}

testcase15
   ${web_url}   set variable   https://dev.gtzh.51ijk.com
   ${role_name}   set variable   chenzhua
   log   ${web_url}
   evaluate   os.system('python ${CURDIR}/main_roles.py ${web_url} ${role_name}')   os

*** Keywords ***
FORANDFOR
   [Arguments]   ${arg1}
   [Documentation]   for 嵌套 for
   : FOR   ${j}   IN RANGE   3
   \   LOG   arg=${arg1};j=${j}
