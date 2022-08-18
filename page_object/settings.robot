*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...              
...            The system specific keywords created here form our own
...            domain specific language. They utilize keywords provided
...            by the imported SeleniumLibrary


Library        Collections
Library        SeleniumLibrary
Library        OperatingSystem 
Library        String


*** Variables ***
${CHROMEDRIVER_PATH}        /usr/local/bin/chromedriver

${correct_username}    rahulshettyacademy
${correct_password}    learning
${incorrect_username}    pruebauser
${incorrect_password}    pruebapassword

${url_testing}        https://rahulshettyacademy.com/loginpagePractise/ 

# Messages
${test_error_message}    Incorrect username/password.


*** Keywords ***
open the browser with the test url 
    ${chrome_options}=      Evaluate      sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
    Open Browser     ${url_testing}    chrome    options=${chrome_options}      executable_path=${CHROMEDRIVER_PATH}

close browser session
    Close Browser

fill the login form
    [arguments]    ${username}    ${password}
    Sleep    2s
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}
    Click Button    id:signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible    ${error_message_login}

verify error message is correct
    ${result}=    Get Text    ${error_message_login}
    Should Be Equal As Strings    ${result}    ${test_error_message}
    Element Text Should Be    ${error_message_login}    ${test_error_message}