***Variables***
${entryPoinHalamanUtama}            id=com.she.sehatq:id/tvSkip
${skipWT}                           id=	com.she.sehatq:id/tv_skip
${dismissLocation}                  id=com.she.sehatq:id/tv_dismiss
${profileEntryPage}                 id=com.she.sehatq:id/iv_profile_nav
${registerEntryPage}                id=com.she.sehatq:id/tv_signup
${inputNameField}                   //android.widget.EditText[@text='Nama Lengkap']
${inputEmailField}                  //android.widget.EditText[@text='Email']
${inputPasswordField}               //android.widget.EditText[@text='Password']
${syaratketentuanCheckBox}	        id=com.she.sehatq:id/cb_terms
${daftarButton}                     id=com.she.sehatq:id/btn_signup
${errorMessage}                     id=com.she.sehatq:id/tv_error

***Keywords***
Go to Main page
    Wait Until Element is Visible       ${entryPoinHalamanUtama}        20s
    Click Element   ${entryPoinHalamanUtama}
    Wait Until Element is Visible       ${skipWT}                       10s
    Click Element   ${skipWT}
    sleep           10s

Go to Profile Page
    Wait Until Element is Visible       ${profileEntryPage}             20s
    Click Element                       ${profileEntryPage}

Go to register page
    Wait Until Element is Visible       ${registerEntryPage}            20s
    Click Element                       ${registerEntryPage}

Input data register
    [Documentation]                       Input register data
    [Arguments]   ${nama}=${empty}    ${email}=${empty}   ${password}=${empty}
    Wait Until Element Is Visible         ${inputNameField}            30s
    Input Text                            ${inputNameField}            ${nama}
    Wait Until Element Is Visible         ${inputEmailField}           30s
    Input Text                            ${inputEmailField}           ${email}
    Wait Until Element Is Visible         ${inputPasswordField}        30s
    Input Text                            ${inputPasswordField}        ${password}

thick syarat ketentua and click Daftar button
    Wait Until Element Is Visible           ${syaratketentuanCheckBox}            5s
    Click Element                         ${syaratketentuanCheckBox}
    Wait Until Element Is Visible           ${daftarButton}            5s
    Click Element                         ${daftarButton}

the error message would be ${error_Message_shouldbe}
    Wait Until Element Is Visible         ${errorMessage}            30s
    ${textError}=   Get Text    ${errorMessage}
    Should Be Equal     ${textError.strip()}	${error_Message_shouldbe}