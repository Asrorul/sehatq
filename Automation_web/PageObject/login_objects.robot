***Settings***
Resource        ../resources.robot


***Variables***
${url_login}            https://account.sehatq.com/login
${emailField}           //*[@id="email"]
${passwordField}        //*[@id="__next"]/div/div/div/div/div[2]/div[1]/form/div[2]/div/label/input
${loginButton}          //*[@id="__next"]/div/div/div/div/div[2]/div[1]/form/button
${profile_account}      //*[@id="popover-profile"]/div[1]/img
${signoutbutton}        //*[@id="popover-profile"]/div[2]/div/a[3]

***Keywords****
input username and password
    [Arguments]     ${username}=${empty}    ${password}=${empty}
    Wait Until Element Is Visible         ${emailField}              20s
    Input Text                            ${emailField}              ${username}
    Wait Until Element Is Visible         ${passwordField}           20s
    Input Text                            ${passwordField}           ${password}

Submit Login
    Wait Until Element Is Visible         ${loginButton}              20s
    Click Element                         ${loginButton}

validate failed login
    ${url}=   Get Location
    Should Be Equal     ${url}	${url_login}	

validate success login
    Wait Until Element Is Visible         ${profile_account}            20s
    Click Element                         ${profile_account}
    Wait Until Element Is Visible         ${signoutbutton}              20s
    Element Should Be Visible             ${signoutbutton} 



