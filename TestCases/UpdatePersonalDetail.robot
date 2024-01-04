*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${First_Name}   xpath://input[@placeholder='First Name']
${Middle_Name}      Xpath://input[@placeholder='Middle Name']
${First_Name_Value}     Ilham Muhammad
${MIddle_Name_Value}        Syah Putra
${Nick_Name}    xpath:(//input[@class='oxd-input oxd-input--active'])[2]
${Nick_Name_Value}      IMS
${Number_Phone}     xpath:(//input[@class='oxd-input oxd-input--active'])[8]
${Phone_Value}      085693997928
${Email_Contact}    (//input[@class='oxd-input oxd-input--active'])[10]
${Email_Value}      abg12345@gmail.com



*** Test Cases ***
UpdatePersonalDetails
    Set Selenium Implicit Wait  15s

    #Login
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    Input Text     name:username   Admin
    Input Text     name:password   admin123
    Click Element   xpath://body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[3]/button[1]

    #Update Personal Details
    Click Element       xpath://span[normalize-space()='My Info']
    Input Text          ${First_Name}       ${First_Name_Value}
    Input Text          ${MIddle_Name}      ${MIddle_Name_Value}
    Input Text          ${Nick_Name}        ${Nick_Name_Value}
    Click Element       xpath:(//button[@type='submit'][normalize-space()='Save'])[1]

    #Update Contact Details
    Click Element       xpath://a[normalize-space()='Contact Details']
    Input Text          ${Number_Phone}     ${Phone_Value}
    Input Text          ${Email_Contact}    ${Email_Value}
    Click Element       xpath:(//button[normalize-space()='Save'])[1]


*** Keywords ***