*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${DROPDOWN_LOCATOR}  xpath:(//div[@class='oxd-select-text oxd-select-text--active'])[1]
${OPTION_VALUE}     CAN - Personal
${EMPLOYEE_LOCATOR}     xpath:(//input[@placeholder='Type for hints...'])[1]
${EMPLOYEE_NAME}        Shubham Gupta
${FROM_DATE}     2024-01-10
${TO_DATE}       2024-01-15
${COMMENTS}      Technical Test

*** Test Cases ***
ApplyLeave
    Set Selenium Implicit Wait  15s

    #Login
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    Input Text     name:username   Admin
    Input Text     name:password   admin123
    Click Element   xpath://body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[3]/button[1]

    #Apply Leave
    Click Element                            xpath://button[@title='Apply Leave']
    Element Text Should Be                   xpath:(//p[@class='oxd-text oxd-text--p oxd-text--subtitle-2'])[1]  No Leave Types with Leave Balance

    #Assign Leave
    Click Element                            xpath:(//a[normalize-space()='Assign Leave'])[1]
    Input Text                               ${EMPLOYEE_LOCATOR}    ${EMPLOYEE_NAME}
    Select From List By Value                ${DROPDOWN_LOCATOR}    ${OPTION_VALUE}
    Input Text                               xpath:(//input[@placeholder='yyyy-mm-dd'])[1]  ${FROM_DATE}
    Input Text                               xpath:(//input[@placeholder='yyyy-mm-dd'])[2]  ${TO_DATE}
    Input Text                               xpath://textarea[@class='oxd-textarea oxd-textarea--active oxd-textarea--resize-vertical']  ${COMMENTS}
    Click Element                            xpath://button[normalize-space()='Assign']
    Click Element                            xpath://button[normalize-space()='Ok']

    #Reject Leave
    Click Element  xpath://a[normalize-space()='Leave List']
    Click Button  xpath:(//button[@type='button'][normalize-space()='Reject'])[1]


*** Keywords ***
