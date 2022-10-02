***Settings***
Resource            ../PageObject/step_login.robot
Resource            ../PageObject/step_register.robot
Resource            ../PageObject/step_edit.robot
Resource            ../resources.robot
Test Setup          login Account sehatq
Test Teardown       Close Application

***Variables***
${APP_ID}               com.she.sehatq 
${APP_ACTIVITY}         com.she.sehatq.view.intro.SplashActivity
${DEVICE_ID}            emulator-5554
${valid_password}       cangewithyourowncredential
${invalid_password}     invalidpassword
${valid_email}          cangewithyourowncredential@gmail.com
${invalid_email}        asdfg@ash.com
${name}                 testName

***Test Cases***
Edit name to a Value
    GIVEN Landing on edit profile page
    WHEN change name to ${name}
    AND Submit changes

***Keywords***
login Account sehatq
    Open apps by app id and activity        ${APP_ID}       ${APP_ACTIVITY}     ${DEVICE_ID}
    Go to Main page
    Go to Profile Page
    input username and password   username=${valid_email}      password=${valid_password}
    Submit Login
    sleep   7s