*** Settings ***
Library                                     AppiumLibrary
Library                                     Collections
Library                                     FakerLibrary
# Resource                                    ../../automation-be/resources.robot
# Resource                                    ../../automation-be/driver/StepDefinition/driver_login_steps.robot

*** Variables ***


*** Keywords ***
Open apps by app id and activity  
    [Documentation]                         Open application by app id and activity    
    [Arguments]                             ${app_id}       ${app_activity}     ${device_id}
    Sleep                                   2s                                                      #Need sleep because need time before start other test                                                                                
    Open Application                        http://localhost:4723/wd/hub    platformName=Android    deviceName=${device_id}     
    ...                                     appPackage=${app_id}     appActivity=${app_activity}    automationName=UiAutomator2
    ...                                     autoGrantPermissions=true       gpsEnabled=true

Go back
    [Documentation]                         Go back        
    Press Keycode                           4                                               #Keycode: Back 

Element Text Should Not Be
    [Documentation]                         Open application by app id and activity    
    [Arguments]                             ${element}      ${expected}
    ${status}=                              Run Keyword And Return Status    
    ...                                     Element Text Should Be                          ${element}      ${expected} 
    Should Not Be True                      ${status}

Swipe Up Screen      
    Swipe By Percent	                    50	    90	    50	    10

Swipe Up Screen per screen     
    Swipe By Percent	                    50	    90	    50	    45

Swipe Down Screen      
    Swipe By Percent	                    50	    50	    50	    90

Generate random email
    [Documentation]   Generate fake email
    ${number}   Random Number   digits=8    fix_len=True
    ${email}    Set Variable    ${number}@asd.com
    # ${email}    Email
    Set Test Variable    ${RANDOM_EMAIL}    ${email}

Delete Text
    [Documentation]     Delete text
    [Arguments]             ${Field}
    ${field text}           Get Value         ${Field}
    ${field text length}    Get Length        ${field text}
    :FOR                    ${index}          IN RANGE        ${field text length}
    \                       Press Keys        ${Field}        BACKSPACE