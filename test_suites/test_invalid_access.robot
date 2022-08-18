*** Settings ***
Documentation  Validate login form
Library    DataDriver    file=resources/data.csv    encoding=utf-8    dialect=unix
Test Setup        open the browser with the test url  
Test Teardown    close browser session
Resource        ../page_object/settings.robot
Test Template    Validate UnSuccessful Login


*** Variables ***
${error_message_login}    css:.alert-danger  


*** Test Cases ***
Login with user ${username} and password ${password}        default_user        default_password


*** Keywords ***
Validate UnSuccessful Login 
    [arguments]    ${username}    ${password}
    fill the login form    ${username}    ${password}
    wait until it checks and display error message
    verify error message is correct 
