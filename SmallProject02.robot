*** Settings ***
Library           Selenium2Library

*** Variables ***
#HOME Screen
${Btn_SignIn}     xpath=//*[@id="header"]/div[3]/div/div/div[7]/ul/li/a
${Btn_AccountDetail}    id=user_info_acc
${BtnImage_Home}    class=logo.img-responsive
#Login Screen
${Field_email_create}    id=email_create
${Field_email_Login}    id=email
${Field_password_Login}    id=passwd
${Field_Logout}    xpath=/html/body/div/div[1]/header/div[3]/div/div/div[7]/ul/li/ul/li[3]/a
#Create Account Screen
${Btn_CreateAccount}    id=SubmitCreate
${Radio_gender}    id=uniform-id_gender1
${Field_FirstName}    id=customer_firstname
${Field_LastName}    id=customer_lastname
${Field_CreatePassword}    id=passwd
${Field_Date}     id=days
${Field_Months}    id:months
${Field_Years}    id=years
${Radio_SpecialOffer}    uniform-optin
${Btn_Register}    id=submitAccount
#My Account
${Btn_AddAddress}    class=icon-building
${Btn_OrderHistory}    class=icon-list-ol
${Btn_MyCredit}    class=icon-file-o
${Btn_MyAddresses}    class=icon-building
${Btn_PersonalInfo}    class=icon-user
${Btn_BackToAccount}    xpath=/html/body/div/div[2]/div/div[2]/div/ul/li[1]/a
${Field_Company}    id=company
${Field_AddressAdd}    id=address1
${Field_PostalCode}    id=postcode
${Field_City}     id=city
${Field_State}    id=id_state
${Field_MobilePhone}    id=phone_mobile
${Field_AddressName}    id=alias
${Btn_DeleteAddress}    xpath=/html/body/div/div[2]/div/div[2]/div/div[1]/div/div/ul/li[12]/a[2]
${Btn_Save}       id=submitAddress
${Field_OldPass}    id=old_passwd
${Field_NewPass}    id=passwd
${Field_ConfirmNewPass}    id=confirmation
${Btn_SaveNewPass}    xpath=/html/body/div/div[2]/div/div[2]/div/div/form/fieldset/div[11]/button
#Book Hotel Room
${Btn_BookNow}    id=add_to_cart
${Btn_BookNowRoom}    link=Book Now
${Field_CheckInDate}    id=room_check_in
${Btn_ProceedToCheckout}    xpath=/html/body/div[1]/div[1]/header/div[3]/div/div/div[5]/div[1]/div[2]/div[4]/a
${Btn_Proceed}    xpath=/html/body/div/div[2]/div/div[2]/div/section/div/section/div/div[1]/div/div[1]/div[2]/div/div[2]/div[2]/div/a
${Btn_ProceedGuestInfo}    xpath=/html/body/div/div[2]/div/div[2]/div/section/div/section/div/div[1]/div/div[2]/div[2]/div/div[4]/div/a
${Checkbox_TermsOfService}    id=cgv
${Menu_PayByCheck}    class=cheque
${Menu_PayByTransfer}    class=bankwire
${Btn_IconfirmMyOrder}    class=btn.pull-right.button.button-medium

*** Test Cases ***
TC01
    [Documentation]    Test Create Account With Empty Email
    Open Browser    http://qa2.cilsy.id:8080/    Chrome
    Maximize Browser Window
    Click Element    ${Btn_SignIn}
    Click Button    ${Btn_CreateAccount}
    Wait Until Element Is Visible    id=create_account_error

TC02
    [Documentation]    Test Create Account With Valid Email
    Input Text    ${Field_email_create}    tosan.aji15@yahoo.com
    Click Button    ${Btn_CreateAccount}
    Wait Until Element Is Visible    id=noSlide

TC03
    [Documentation]    Test Create Account With Valid Personal Information
    Sleep    5s
    Select Radio Button    id_gender    1
    Input Text    ${Field_FirstName}    Tosan
    Input Text    ${Field_LastName}    Aji
    Input Password    ${Field_CreatePassword}    Gameloft2020
    Select From List By Index    ${Field_Date}    8
    Select From List By Index    ${Field_Months}    12
    Select From List By Value    ${Field_Years}    1980
    Select Checkbox    id=newsletter
    Select Checkbox    id=optin
    Click Button    ${Btn_Register}
    Wait Until Element Is Visible    id=center_column
    Close Browser

TC04
    [Documentation]    Test Sign In Account With Empty Email
    Open Browser    http://qa2.cilsy.id:8080/    Chrome
    Maximize Browser Window
    Click Element    ${Btn_SignIn}
    Sleep    3s
    Input Password    ${Field_password_Login}    Gameloft2020
    Click Button    id=SubmitLogin
    Wait Until Page Contains    An email address required.

TC05
    [Documentation]    Test Sign In Account With Empty Password
    Sleep    3s
    Input Text    ${Field_email_Login}    tosan.aji@yahoo.com
    Click Button    id=SubmitLogin
    Wait Until Page Contains    Password is required.

TC06
    [Documentation]    Sign In Account With Valid Data
    Sleep    3s
    Input Text    ${Field_email_Login}    tosan.aji@yahoo.com
    Input Password    ${Field_password_Login}    Gameloft2020
    Click Button    id=SubmitLogin
    Wait Until Element Is Visible    id=center_column
    Close Browser

TC07
    [Documentation]    Test feature to add first address
    Open Browser    http://qa2.cilsy.id:8080/    Chrome
    Maximize Browser Window
    Click Element    ${Btn_SignIn}
    Sleep    3s
    Input Text    ${Field_email_Login}    tosan.aji@yahoo.com
    Input Password    ${Field_password_Login}    Gameloft2020
    Click Button    id=SubmitLogin
    Wait Until Element Is Visible    id=center_column
    Sleep    2s
    Click Element    ${Btn_AddAddress}
    Sleep    2s
    Input Text    ${Field_Company}    Cilsy
    Input Text    ${Field_AddressAdd}    Ngestiharjo, Kasihan
    Input Text    ${Field_PostalCode}    55182
    Input Text    ${Field_City}    Bantul
    Select From List By Value    ${Field_State}    265
    Input text    ${Field_MobilePhone}    08888321211
    Input Text    ${Field_AddressName}    Kontrakan
    Click Button    ${Btn_Save}
    Wait Until Page Contains    Your addresses are listed below.
    Click Element    ${Btn_BackToAccount}
    Sleep    2s

TC08
    [Documentation]    Test feature for order history menu
    Click Element    ${Btn_OrderHistory}
    Wait Until Page Contains    You have not placed any orders.
    Sleep    2s
    Click Element    ${Btn_BackToAccount}
    Sleep    2s

TC09
    [Documentation]    Test feature for credit slips menu
    Click Element    ${Btn_MyCredit}
    Sleep    2s
    Wait Until Page Contains    You have not received any credit slips.
    Sleep    2s
    Click Element    ${Btn_BackToAccount}
    Sleep    2s

TC10
    [Documentation]    Test feature for my address menu
    Click Element    ${Btn_MyAddresses}
    Sleep    2s
    Click Element    ${Btn_DeleteAddress}
    Handle Alert    ACCEPT
    Click Element    ${Btn_BackToAccount}
    Sleep    2s

TC11
    [Documentation]    Test feature Change Password From Personal Information Menu
    Click Element    ${Btn_PersonalInfo}
    Sleep    2s
    Input Password    ${Field_OldPass}    Gameloft2020
    Input Password    ${Field_NewPass}    Gameloft2021
    Input Password    ${Field_ConfirmNewPass}    Gameloft2021
    Click Element    ${Btn_SaveNewPass}
    Sleep    2s
    Close Browser

TC12
    [Documentation]    *Test feature to Adding Room and Pick Date*
    Open Browser    http://qa2.cilsy.id:8080/    Chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=/html/body/div[1]/div[2]/div/div[2]/div/div/div[3]/div/div[2]/div/div[1]/div[2]/div/div[3]/a
    Switch Window    locator=NEW
    Click Button    ${Field_CheckInDate}
    Click Element    xpath=/html/body/div[2]/div/a[2]
    Click Element    xpath=/html/body/div[2]/table/tbody/tr[2]/td[1]
    Click Element    xpath=/html/body/div[2]/table/tbody/tr[2]/td[2]
    Click Element    ${Btn_BookNow}
    Sleep    2s
    Wait Until Page Contains    Room successfully added to your cart
    Sleep    2s

TC13
    [Documentation]    Test book room and add guest information
    Click Element    ${Btn_ProceedToCheckout}
    Sleep    2s
    Click Element    ${Btn_Proceed}
    Sleep    2s
    Input Text    ${Field_FirstName}    Tosan
    Input Text    ${Field_LastName}    Aji
    Input Text    ${Field_email_Login}    tosan.aji16@yahoo.com
    Input Password    ${Field_password_Login}    Gameloft2020
    Input text    ${Field_MobilePhone}    05643739891
    Click Button    ${Btn_Register}
    Sleep    2s
    Wait Until Page Contains    Guest Information

TC14
    [Documentation]    Test book room and add Payment with bank transfer
    Click Element    ${Btn_ProceedGuestInfo}
    Sleep    2s
    Select Checkbox    ${Checkbox_TermsOfService}
    Sleep    10s
    Click Element    ${Menu_PayByTransfer}
    Sleep    2s
    Click Element    ${Btn_IconfirmMyOrder}
    Sleep    2s
    Wait Until Page Contains    Your order on Sekolah QA is complete.
    Sleep    2s

TC15
    [Documentation]    Test book room and add Payment with check
    Click Element    ${BtnImage_Home}
    Sleep    2s
    Click Element    xpath=/html/body/div[1]/div[2]/div/div[2]/div/div/div[3]/div/div[2]/div/div[2]/div[1]/div/div[3]/a
    Click Button    ${Field_CheckInDate}
    Click Element    xpath=/html/body/div[2]/div/a[2]
    Click Element    xpath=/html/body/div[2]/table/tbody/tr[2]/td[3]
    Click Element    xpath=/html/body/div[2]/table/tbody/tr[2]/td[4]
    Click Element    ${Btn_BookNow}
    Sleep    2s
    Wait Until Page Contains    Room successfully added to your cart
    Sleep    2s
    Click Element    ${Btn_ProceedToCheckout}
    Sleep    2s
    Click Element    ${Btn_Proceed}
    Sleep    2s
    Click Element    ${Btn_ProceedGuestInfo}
    Sleep    2s
    Select Checkbox    ${Checkbox_TermsOfService}
    Sleep    10s
    Click Element    ${Menu_PayByCheck}
    Sleep    2s
    Click Element    ${Btn_IconfirmMyOrder}
    Sleep    2s
    Wait Until Page Contains    Your order on Sekolah QA is complete.
    Sleep    2s

TC16
    [Documentation]    Test book room and add Payment with PayPall
    Click Element    ${BtnImage_Home}
    Sleep    2s
    Click Link    ${Btn_BookNowRoom}
    Click Element    ${Btn_BookNow}
    Sleep    2s
    Wait Until Page Contains    Room successfully added to your cart
    Sleep    2s
    Click Element    ${Btn_ProceedToCheckout}
    Sleep    2s
    Click Element    ${Btn_Proceed}
    Sleep    2s
    Click Element    ${Btn_ProceedGuestInfo}
    Sleep    2s
    Select Checkbox    ${Checkbox_TermsOfService}
    Sleep    10s
    Click Element    ${Menu_PayByCheck}
    Sleep    2s
    Click Element    ${Btn_IconfirmMyOrder}
    Sleep    2s
    Wait Until Page Contains    Your order on Sekolah QA is complete.
    Click Element    ${BtnImage_Home}
    Close Browser

TC17
    [Documentation]    Check redirection Menu Policies and Legal Notice
    Open Browser    http://qa2.cilsy.id:8080/    Chrome
    Maximize Browser Window
    Click Element    ${Btn_SignIn}
    Sleep    3s
    Input Text    ${Field_email_Login}    tosan.aji@yahoo.com
    Input Password    ${Field_password_Login}    Gameloft2021
    Click Button    id=SubmitLogin
    Wait Until Element Is Visible    id=center_column
    Sleep    2s
    Click Link    link=Policies
    Sleep    2s
    Click Link    link=Legal Notice
    Sleep    2s

TC18
    [Documentation]    Check redirection Menu Terms And Conditions and About Us
    Click Link    link=Terms And Conditions Of Use
    Sleep    2s
    Click Link    link=About Us
    Sleep    2s
    Click Link    link=Secure Payment
    Sleep    2s

TC19
    [Documentation]    Check Feature to Change Language
    Click Element    id=languages-block-top
    Sleep    2s
    Click Element    xpath=/html/body/div/div[3]/footer/div/div[1]/div/section/div[2]/div/ul/li[2]/a
    Wait Until Page Contains    Pembayaran
    Sleep    2s

TC20
    [Documentation]    Check Logout phase
    Click Element    ${Btn_AccountDetail}
    Sleep    2s
    Click Element    xpath=/html/body/div/div[1]/header/div[3]/div/div/div[7]/ul/li/ul/li[3]/a
    Wait Until Element Is Not Visible    ${Btn_AccountDetail}
    Close Browser
