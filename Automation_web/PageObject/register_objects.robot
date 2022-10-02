***Settings***
Resource        ../resources.robot


***Variables***
${NameField}                    //*[@id="name"]
${emailField}                   //*[@id="email"]
${passwordField}                //*[@id="__next"]/div/div/div/div/div[2]/div/form/div[3]/div/label/input
${syaratketentuanCheckBox}      //*[@id="__next"]/div/div/div/div/div[2]/div/form/div[4]/div/div/label/span/span
${daftarButton}                 //*[@id="__next"]/div/div/div/div/div[2]/div/form/button
${errorOnFieldName}             //*[@id="__next"]/div/div/div/div/div[2]/div/form/div[1]/div/div
${errorOnFieldEmail}            //*[@id="__next"]/div/div/div/div/div[2]/div/form/div[2]/div/div
${errorOnFieldPassword}         //*[@id="__next"]/div/div/div/div/div[2]/div/form/div[3]/div/div
${ToastMessage}                 .//*[@role="alert"]/span


***Keywords***
Input data register
    [Documentation]                       Input register data
    [Arguments]   ${nama}=${empty}    ${email}=${empty}   ${password}=${empty}
    Wait Until Element Is Visible         ${NameField}            30s
    Input Text                            ${NameField}            ${nama}
    Wait Until Element Is Visible         ${emailField}           30s
    Input Text                            ${emailField}           ${email}
    Wait Until Element Is Visible         ${passwordField}        30s
    Input Text                            ${passwordField}        ${password}

thick syarat ketentua and click Daftar button
    # Execute Javascript  window.scrollTo(120,360)
    Wait Until Element Is Visible           ${syaratketentuanCheckBox}            5s
    Click Element                         ${syaratketentuanCheckBox}
    Wait Until Element Is Visible           ${daftarButton}            5s
    Click Element                         ${daftarButton}

Make sure button is disable
    Element Should Be Disabled          ${daftarButton}

error on field name would be shown with error message ${errorMessage}
    Wait Until Element Is Visible         ${errorOnFieldName}            30s
    ${textError}=   Get Text    ${errorOnFieldName}
    Should Be Equal     ${textError}	${errorMessage}	

error on field email would be shown with error message ${errorMessage}
    Wait Until Element Is Visible         ${errorOnFieldEmail}            30s
    ${textError}=   Get Text    ${errorOnFieldEmail}
    Should Be Equal     ${textError}	${errorMessage}	

error on field password would be shown with error message ${errorMessage}
    Wait Until Element Is Visible         ${errorOnFieldPassword}            30s
    ${textError}=   Get Text    ${errorOnFieldPassword}
    Should Be Equal     ${textError}	${errorMessage}	

# toast message would be shown with message ${errorMessage}
    # Click Element                         ${daftarButton}
    # Alert Should Be Present               ${ToastMessage}
    # Wait Until Element Is Visible         ${ToastMessage}            10s
    # ${textError}=       Get Text          ${ToastMessage}
    # Should Be Equal     ${textError}	${errorMessage}

validate fail register
    ${url}=   Get Location