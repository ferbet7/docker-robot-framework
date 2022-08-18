*** Settings ***
Documentation  Validate login form
Library    Collections
Test Setup        open the browser with the test url  
Test Teardown    close browser session
Resource        ../page_object/settings.robot


*** Variables ***
${error_message_login}    css:.alert-danger
${show_pages_load}    css:.nav-link


*** Test Cases ***
Validate UnSuccessful Login 
    fill the login form    ${incorrect_username}    ${incorrect_password}
    wait until element is visible in the page        ${error_message_login}
    verify error message is correct 

Validate Cards display in the Shopping Page
    fill the login form    ${correct_username}    ${correct_password}
    wait until element is visible in the page        ${show_pages_load}
    verify card titles in the shop page
    select the card    BlackBerry

Select the form and navigate to child window
    Fill tje login details and select the user option    ${correct_username}    ${correct_password}


*** Keywords ***
fill the login form
    Sleep    2s
    [arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn 
    
wait until element is visible in the page
    [arguments]    ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    ${result} =    Get Text    ${error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password. 
    Element Text Should Be    ${error_message_login}    Incorrect username/password.

verify card titles in the shop page
    @{expectedList} =    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry     
    ${elements} =    Get WebElements    .card   
    @{actualList} =    Create List 
    FOR    ${element}    IN    @{elements}
        Log    ${element.text}
        Append To List    ${actualList}    ${element.text}
    END 
    Lists Should Be Equal    ${expectedList}    ${actualList} 

select the card
    [arguments]    ${cardName}
    ${elements} =    Get WebElements    css:.card-title
    ${index} =    Set Variable    1
    FOR    ${element}    IN    @{elements}
        Exit For Loop If    '${cardName}' == '${element.text}'
        ${index}=    Evaluate    ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button

Fill tje login details and select the user option  
    [arguments]    ${username}    ${password}
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Element     xpath://*[@value="user"]
    wait until element is visible in the page    xpath://*[@id="okayBtn"]
    Click Element     xpath://*[@id="okayBtn"]
    Click Element     xpath://*[@id="okayBtn"] 
    Wait Until Element Is Not Visible    xpath://*[@id="okayBtn"]
    Select From List By Value     xpath://*[@id="login-form"]/div[5]/select    teach
    Sleep    2s
    Select Checkbox    terms
    Check Box Should Be Selected    terms
    