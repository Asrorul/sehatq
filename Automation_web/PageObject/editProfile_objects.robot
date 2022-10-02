***Variables***
${entry_editProfile_button}         //*[@id="__next"]/div[2]/div[2]/div[2]/div[2]/a
${editNameField}                    //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[1]/div/label/input
${genderField}                      //*[@id="gender"]/div/button
${optionGenderMale}                 //*[@id="gender"]/div[2]/div/div/a[1]
${optionGenderFemale}               //*[@id="gender"]/div[2]/div/div/a[2]
${editHeightField}                  //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[4]/div/label/input
${editWeightField}                  //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[5]/div/label/input
${editPhoneNumberField}             //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[6]/div/label/input
${editEmailField}                   //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[7]/div/label/input
${editAlamatField}                  //*[@id="address"]
${errorOnFieldName}                 //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[1]/div/div
${errorOnFieldHeight}               //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[4]/div/div
${errorOnFieldWight}                //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[5]/div/div
${errorOnFieldAlamat}               //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[1]/div[8]/div
${sumbitEditProfileBtn}             //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div[2]/div/div/div[3]/button
${entryPointProfilePage}            //*[@id="popover-profile"]/div[2]/div/a[1]
${profileAlamat}                    //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div/div/div[2]/div[3]/div/div/div/span
${profilTinggi}                     //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div/div/div[1]/div/div[2]/span[1]
${profilBerat}                      //*[@id="__next"]/div[1]/div/div/div[2]/div[2]/div/div/div[1]/div/div[3]/span[1]


***Keywords***
Landing on edit profile page
    Wait Until Element Is Visible          ${entry_editProfile_button}          20s
    Click Element                          ${entry_editProfile_button}

change name to ${name}
    Wait Until Element Is Visible         ${editNameField}              20s
    press keys                            ${editNameField}            CTRL+A+BACKSPACE
    Input Text                            ${editNameField}              ${name}

change height to ${height}
    Wait Until Element Is Visible         ${editHeightField}            20s
    press keys                            ${editHeightField}            CTRL+A+BACKSPACE
    Input Text                            ${editHeightField}            ${height}

change weight to ${weight}
    Wait Until Element Is Visible         ${editWeightField}            20s
    press keys                            ${editWeightField}            CTRL+A+BACKSPACE
    Input Text                            ${editWeightField}            ${weight}

change phone number to ${number}
    Wait Until Element Is Visible         ${editPhoneNumberField}       20s
    press keys                            ${editPhoneNumberField}       CTRL+A+BACKSPACE
    Input Text                            ${editPhoneNumberField}       ${number}

change email to ${email}
    Wait Until Element Is Visible         ${editEmailField}             20s
    press keys                            ${editEmailField}       CTRL+A+BACKSPACE
    Input Text                            ${editEmailField}             ${email}

change alamat to ${address}
    Wait Until Element Is Visible         ${editAlamatField}             20s
    press keys                            ${editAlamatField}       CTRL+A+BACKSPACE
    Input Text                            ${editAlamatField}             ${address}

change gender to Laki-laki
    Click Element                         ${genderField}
    Wait Until Element Is Visible         ${optionGenderMale}             20s
    Click Element                         ${optionGenderMale}

change gender to Perempuan
    Click Element                         ${genderField}
    Wait Until Element Is Visible         ${optionGenderFemale}             20s
    Click Element                         ${optionGenderFemale}

error on field name would be shown with error message ${errorMessage}
    Wait Until Element Is Visible         ${errorOnFieldName}               20s
    ${textError}=   Get Text    ${errorOnFieldName}
    Should Be Equal     ${textError}	${errorMessage}	

error on field height would be shown with error message ${errorMessage}
    Wait Until Element Is Visible         ${errorOnFieldHeight}               20s
    ${textError}=   Get Text    ${errorOnFieldHeight}
    Should Be Equal     ${textError}	${errorMessage}	

Submit changes
    Wait Until Element Is Visible          ${sumbitEditProfileBtn}          20s
    Click Element                          ${sumbitEditProfileBtn}

go to profile Page from entry point
    Wait Until Element Is Visible          ${entryPointProfilePage}          20s
    Click Element                          ${entryPointProfilePage}
    
validate alamat,bb,tb
    [Arguments]     ${alamat}   ${bb}   ${tb}
    Wait Until Element Is Visible         ${profileAlamat}               20s
    ${textAlamat}=   Get Text    ${profileAlamat}
    ${textBerat}=    Get Text    ${profilBerat}
    ${textTinggi}=    Get Text    ${profilTinggi}

    Should Be Equal     ${textAlamat}	${alamat}
    Should Be Equal     ${textBerat}	${bb}
    Should Be Equal     ${textTinggi}	${tb}
    
