***Settings***
Resource            ../PageObject/register_objects.robot
Resource            ../resources.robot
Test Setup          Open chrome browser with headless mode ${true/false} with url ${url_register}
Test Teardown       Close Browser

***Variables***
${true/false}       false
${url_register}     https://account.sehatq.com/daftar/email

***Test Cases***
Register new Account with invalid empty NameField
    [Setup]    Open Register Page and generate random email
    GIVEN Input data register   nama=${empty}    email=${RANDOM_EMAIL}      password=p@$w0rd
    WHEN thick syarat ketentua and click Daftar button
    THEN error on field name would be shown with error message Nama Lengkap wajib diisi

Register new Account with number as the name account 
    [Setup]    Open Register Page and generate random email
    GIVEN Input data register   nama=123asd    email=${RANDOM_EMAIL}      password=p@$w0rd
    WHEN thick syarat ketentua and click Daftar button
    THEN error on field name would be shown with error message Nama lengkap harus diisi dengan huruf.

Register new Account with empty email 
    GIVEN Input data register   nama=asd    email=${empty}      password=p@$w0rd
    WHEN thick syarat ketentua and click Daftar button
    error on field email would be shown with error message Email wajib diisi

Register new Account with invalid email format 
    GIVEN Input data register   nama=asd    email=@asd@asd      password=p@$w0rd
    WHEN thick syarat ketentua and click Daftar button
    error on field email would be shown with error message Email harus diisi dengan benar.

Register new Account with empty password 
    [Setup]    Open Register Page and generate random email
    GIVEN Input data register   nama=asd    email=${RANDOM_EMAIL}      password=${empty}
    WHEN thick syarat ketentua and click Daftar button
    error on field password would be shown with error message Password wajib diisi

Register new Account with password less than 6 digits 
    [Setup]    Open Register Page and generate random email
    GIVEN Input data register   nama=asd    email=${RANDOM_EMAIL}      password=12345
    WHEN thick syarat ketentua and click Daftar button
    error on field password would be shown with error message Password harus diisi minimal 6

# Register new Account with email that already registered 
#     [Setup]    Open Register Page and generate random email
#     GIVEN Input data register   nama=asd    email=umamasrorul@gmail.com      password=123456
#     WHEN thick syarat ketentua and click Daftar button	
#     THEN toast message would be shown with message Email sudah ada, mohon gunakan email lain


***Keywords***
Open Register Page and generate random email
    Open chrome browser with headless mode ${true/false} with url ${url_register}
    Generate random email

Register Account with invalid data
    [Arguments]    ${nama}     ${email}    ${password}      ${errorPlace}    ${error_message}
    GIVEN Input data register   nama=${nama}    email=${email}      password=${password}
    WHEN Select option register by perorangan
    AND Input data invalid Agen Perorangan ${nama} ${noTelepon1} ${noTelepon2} ${email}
    THEN Alert error after submit Agen ${error}