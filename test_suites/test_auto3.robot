*** Settings ***
Documentation  Validate login form
Test Setup        open the browser with the test url  
Test Teardown    close browser session
Resource        ../page_object/settings.robot
Test Template    Validate UnSuccessful Login


*** Variables ***
${error_message_login}    css:.alert-danger 


*** Test Cases ***
Invalid username    asdasdasd    learning
Invalid password    rahul    asdasdasd
Special characters    4$#3-$    learning


*** Keywords ***        
Validate UnSuccessful Login 
    [arguments]    ${username}    ${password}
    fill the login form    ${username}    ${password}
    wait until it checks and display error message
    verify error message is correct 
