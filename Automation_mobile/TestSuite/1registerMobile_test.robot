***Settings***
Resource            ../PageObject/step_register.robot
Resource            ../resources.robot
Test Setup          Open App and go to register page
Test Teardown       Close Application

***Variables***
${APP_ID}               com.she.sehatq 
${APP_ACTIVITY}         com.she.sehatq.view.intro.SplashActivity
${DEVICE_ID}            emulator-5554

***Test Cases***
Register new Account with invalid empty NameField
    [Setup]    Open Register Page and generate random email
    GIVEN Input data register   nama=${empty}    email=${RANDOM_EMAIL}      password=p@$w0rd
    WHEN thick syarat ketentua and click Daftar button
    THEN the error message would be Name must be filled in correctly

Register new Account with empty email 
    GIVEN Input data register   nama=asd    email=${empty}      password=p@$w0rd
    WHEN thick syarat ketentua and click Daftar button
    THEN the error message would be Masukkan email yang valid

Register new Account with invalid email format 
    GIVEN Input data register   nama=asd    email=@asd@asd      password=p@$w0rd
    WHEN thick syarat ketentua and click Daftar button
    THEN the error message would be Masukkan email yang valid

Register new Account with empty password 
    [Setup]    Open Register Page and generate random email
    GIVEN Input data register   nama=asd    email=${RANDOM_EMAIL}      password=${empty}
    WHEN thick syarat ketentua and click Daftar button
    THEN the error message would be Password must be filled in correctly

Register new Account with password less than 6 digits 
    [Setup]    Open Register Page and generate random email
    GIVEN Input data register   nama=asd    email=${RANDOM_EMAIL}      password=12345
    WHEN thick syarat ketentua and click Daftar button
    THEN the error message would be Password minimal 6 karakter

***Keywords***
Open App and go to register page
    Open apps by app id and activity        ${APP_ID}       ${APP_ACTIVITY}     ${DEVICE_ID}
    Go to Main page
    Go to Profile Page
    Go to register page

Open Register Page and generate random email
    Open App and go to register page
    Generate random email