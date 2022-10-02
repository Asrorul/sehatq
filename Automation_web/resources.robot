*** Settings ***
Library         DateTime
Library         SeleniumLibrary
Library         String
# Library         function.py
Library         FakerLibrary

*** Variables ***
${URL}                  https://www.sehatq.com/

*** Keywords ***
Open chrome browser
    [Documentation]     Open chrome browser
    [Arguments]         ${URL}
    ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    Call Method           ${options}    add_argument    --disable-notifications
    Open Browser          ${URL}      chrome	options=${options}
    Maximize Browser Window
    Set Selenium Speed    0.1s

Open chrome browser with headless mode ${true/false} with url ${url}
    [Documentation]     Open chrome browser wih headless or not
    Run Keyword If     "${true/false}"=="false"        Open chrome browser                      URL=${url}
    ...    ELSE IF     "${true/false}"=="true"         Open chrome browser with headless mode   URL=${url}       

Open chrome browser with headless mode
    [Documentation]     Open chrome browser with headless mode
    [Arguments]         ${URL}
    ${chrome_options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}   add_argument    headless
    Call Method    ${chrome_options}   add_argument    disable-gpu
    Call Method    ${chrome_options}   add_argument    no-sandbox
    Call Method    ${chrome_options}   add_argument    disable-dev-shm-usage
    Open Browser          ${URL}      chrome	options=${chrome_options}
    Set Window Size       1440        768
    Set Selenium Speed    0.1s

Delete Text
    [Documentation]     Delete text
    [Arguments]             ${Field}
    ${field text}           Get Value         ${Field}
    ${field text length}    Get Length        ${field text}
    :FOR                    ${index}          IN RANGE        ${field text length}
    \                       Press Keys        ${Field}        BACKSPACE

Generate random email
    [Documentation]   Generate fake email
    ${number}   Random Number   digits=8    fix_len=True
    ${email}    Set Variable    ${number}@asd.com
    # ${email}    Email
    Set Test Variable    ${RANDOM_EMAIL}    ${email}
