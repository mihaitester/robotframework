*** Settings ***
Library  library/ExampleLibrary.py
Library  BuiltIn

*** Variables ***

*** Keywords ***
Run Command
    [Arguments]  ${commandline}=""
    ${result}=  ExampleLibrary.run  cmd.exe /c "${commandline}"
    [Return]  ${result}