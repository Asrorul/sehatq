***Settings***
Resource            ../PageObject/step_login.robot
Resource            ../PageObject/step_register.robot
Resource            ../resources.robot
Test Setup          Open App and go to login page
Test Teardown       Close Application

***Variables***
${APP_ID}               com.she.sehatq 
${APP_ACTIVITY}         com.she.sehatq.view.intro.SplashActivity
${DEVICE_ID}            emulator-5554
${valid_password}       cangewithyourowncredential
${invalid_password}     invalidpassword
${valid_email}          cangewithyourowncredential@gmail.com
${invalid_email}        asdfg@ash.com

***Test Cases***
Login using non registered email
    GIVEN input username and password   username=${invalid_email}      password=${invalid_password}
    WHEN Submit Login
    THEN validate failed login with message Email harus diisi dengan benar.

Login using wrong password
    GIVEN input username and password   username=${valid_email}      password=${invalid_password}
    WHEN Submit Login
    THEN validate failed login with message Email atau Password yang Anda masukkan salah. 

# Login using right password
#     GIVEN input username and password   username=${valid_email}      password=${valid_password}
#     WHEN Submit Login
#     THEN validate success login

***Keywords***
Open App and go to login page
    Open apps by app id and activity        ${APP_ID}       ${APP_ACTIVITY}     ${DEVICE_ID}
    Go to Main page
    Go to Profile Page