*** Settings ***
Documentation  Test 0 Login Validations
Library     SeleniumLibrary
Test Teardown    Close Browser


*** Variables ***
${url_testing}    https://rahulshettyacademy.com/loginpagePractise/ 
${error_message_login}    css:.alert-danger
${CHROMEDRIVER_PATH}        /usr/local/bin/chromedriver


*** Test Cases ***
Validate UnSuccessful Login
    open the browser with the test url
    fill the loginf form
    wait until it checks and display error message
    verify error message is correct 


*** Keywords ***
open the browser with the test url 
    ${chrome_options}=      Evaluate      sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
    Open Browser        ${url_testing}    chrome    options=${chrome_options}      executable_path=${CHROMEDRIVER_PATH}

fill the loginf form
    Sleep    2s
    Input Text    id:username    pruebauser
    Input Password    id:password    pruebapassword
    Click Button    id:signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${error_message_login}

verify error message is correct
    ${result}=    Get Text    ${error_message_login}
    Should Be Equal As Strings    ${result}    Incorrect username/password. 
    Element Text Should Be    ${error_message_login}    Incorrect username/password.
    