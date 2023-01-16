*** Settings ***
Resource  resource/base.resource

*** Test Cases ***
01 SMOKE Opening explorer
    [Tags]  smoke
    Skip if  "${VAR}" != "if"
    ${result}=  Run Command  explorer %cd%
    Log  something: ${result}
    Should Be Empty  ${result.stdout}
    Should Be Empty  ${result.stderr}
    Should Be Equal As Integers  ${result.rc}  ${0}

02 SMOKE Opening calc
    [Tags]  smoke
    Skip if  "${VAR}" != "else"
    ${result}=  Run Command  calc
    Log  something else: ${result}
    Should Be Empty  ${result.stdout}
    Should Be Empty  ${result.stderr}
    Should Be Equal As Integers  ${result.rc}  ${0}