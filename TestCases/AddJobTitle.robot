*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${Job}  xpath://span[normalize-space()='Job']
${Job_Title}    xpath://a[normalize-space()='Job Titles']
${Field_Job_Title }     xpath:(//input[@class='oxd-input oxd-input--active'])[2]
$(Job_Title_Value)      Tukang Bangunan
${Job_Description}      xpath://textarea[@placeholder='Type description here']
${Description_Value}    Tukang Paling Mantap
${Note}                 xpath://textarea[@placeholder='Add note']
${Note_Value}           Tukang Bangunan Project Tower


*** Test Cases ***
UpdatePersonalDetails
    Set Selenium Implicit Wait  15s

    #Login
    Open Browser    ${url}  ${browser}
    Maximize Browser Window
    Input Text     name:username   Admin
    Input Text     name:password   admin123
    Click Element   xpath://body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[3]/button[1]

    #Add Job Title
    Click Element                   xpath://a[@class='oxd-main-menu-item active']//span[1]
    Select From List By Value       ${Job}    ${Job_Title}
    Click Element                   xpath://button[normalize-space()='Add']
    Input Text                      ${Field_Job_Title }     $(Job_Title_Value)
    Input Text                      ${Job_Description}      ${Description_Value}
    Input Text                      ${Note}                 ${Note_Value}
    Click Element                   xpath://button[normalize-space()='Save']


*** Keywords ***