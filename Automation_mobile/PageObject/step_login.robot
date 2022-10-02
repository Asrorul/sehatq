***Variables***
${bottomSheetError}          id=com.she.sehatq:id/design_bottom_sheet
${errorText}                 id=com.she.sehatq:id/tv_detail
${inputEmailField}           //android.widget.EditText[@text='Email']
${inputPasswordField}        //android.widget.EditText[@text='Password']
${loginButton}               id=com.she.sehatq:id/btn_login

***Keywords***
input username and password
    [Arguments]     ${username}=${empty}    ${password}=${empty}
    Wait Until Element Is Visible         ${inputEmailField}              20s
    Input Text                            ${inputEmailField}              ${username}
    Wait Until Element Is Visible         ${inputPasswordField}           20s
    Input Text                            ${inputPasswordField}           ${password}

Submit Login
    Wait Until Element Is Visible         ${loginButton}              20s
    Click Element                         ${loginButton}

validate failed login with message ${error_message}
    Wait Until Element Is Visible         ${bottomSheetError}              20s
    ${textError}=   Get Text    ${errorText}
    Should Be Equal     ${textError.strip()}	${error_message}