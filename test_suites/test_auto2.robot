*** Settings ***
Documentation  Validate login form 
Test Setup        open the browser with the test url  
Test Teardown    close browser session
Resource        ../page_object/settings.robot


*** Variables ***
${error_message_login}    css:.alert-danger 


*** Test Cases ***
Validate child window functionality
    Select the link of child window
    Verify the user is switched to child window
    Grab the email id in the child window
    Switch to parent window and enter the email


*** Keywords ***
Select the link of child window
    Click Element    css:.blinkingText
    Sleep    5s

Verify the user is switched to child window
    Switch Window    NEW
    Element Text Should Be    css:h1    DOCUMENTS REQUEST
    
Grab the email id in the child window
    ${text}=    Get Text    css:.red
    @{words}=    Split String     ${text}    at
    ${text_split}=    Get From List    ${words}    1
    Log    ${text_split}
    @{words_split}=    Split String    ${text_split}
    ${email}=    Get From List    ${words_split}    0
    # ${email}=    xpath://*[@id="interview-material-container"]/div/div[2]/p[2]/strong/a
    Set Global Variable    ${email}

Switch to parent window and enter the email
    Switch Window    MAIN
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    id:username    ${email}
