*** Settings ***
Library           Selenium2Library

*** Test Cases ***
TC01CreateAccountWithEmptyEmail
    [Documentation]    Test Create Account With Empty Email
    Open Browser    http://qa2.cilsy.id:8080/    Chrome
    Maximize Browser Window
    Click Button    class=user_login navigation-link

[TC02]
    Open Browser    http://103.226.139.66:8080/en/
