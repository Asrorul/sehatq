***Settings***
Resource            ../PageObject/editProfile_objects.robot
Resource            ../PageObject/login_objects.robot
Resource            ../resources.robot
Test Setup          login Account sehatq
Test Teardown       Close Browser

***Variables***
${true/false}           false
${url_profil}           https://www.sehatq.com/profil
${url_profil}           https://www.sehatq.com/login
${valid_email}          cangewithyourowncredential@gmail.com
${valid_password}       cangewithyourowncredential
${heightData}           160
${weightData}           56
${addressData}          xyzabcdef

***Test Cases***
Edit tinggi to empty data
    GIVEN Landing on edit profile page
    WHEN change height to ${empty}
    AND Submit changes
    THEN error on field height would be shown with error message Tinggi Badan wajib diisi

Edit tinggi badan,berat badan and alamat to a Value
    GIVEN Landing on edit profile page
    WHEN change height to ${heightData}
    AND change weight to ${weightData}
    AND change alamat to ${addressData}
    AND Submit changes
    THEN validate alamat,bb,tb  alamat=${addressData}   bb=${weightData}    tb=${heightData}


***Keywords***
login Account sehatq
    Open chrome browser with headless mode ${true/false} with url ${url_login}
    input username and password   username=${valid_email}      password=${valid_password}
    Submit Login
    validate success login
    go to profile Page from entry point