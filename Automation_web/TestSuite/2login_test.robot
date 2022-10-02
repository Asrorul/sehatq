***Settings***
Resource            ../PageObject/login_objects.robot
Resource            ../resources.robot
Test Setup          Open chrome browser with headless mode ${true/false} with url ${url_login}
Test Teardown       Close Browser

***Variables***
${true/false}           false
${url_login}            https://account.sehatq.com/login
${valid_password}       cangewithyourowncredential
${invalid_password}     invalidpassword
${valid_email}          cangewithyourowncredential@gmail.com
${invalid_email}        asdfg@ash.com

***Test Cases***
Login using non registered email
    GIVEN input username and password   username=${invalid_email}      password=${invalid_password}
    WHEN Submit Login
    THEN validate failed login

Login using wrong password
    GIVEN input username and password   username=${valid_email}      password=${invalid_password}
    WHEN Submit Login
    THEN validate failed login

Login using right password
    GIVEN input username and password   username=${valid_email}      password=${valid_password}
    WHEN Submit Login
    THEN validate success login