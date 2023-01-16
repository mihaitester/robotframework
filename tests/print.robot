*** Settings ***
Resource  resource/base.resource

*** Test Cases ***
01 PRINT print something
    [Tags]  print
    Skip if  "${VAR}" != "if"
    ${number}=  ExampleLibrary.count
    Log  something: ${number}

02 PRINT print something else
    [Tags]  print
    Skip if  "${VAR}" != "else"
    ${number}=  ExampleLibrary.count
    Log  something else: ${number}
    