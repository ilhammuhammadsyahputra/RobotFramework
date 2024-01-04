*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Test Cases ***
LoginTest
    open browser    ${url}  ${browser}
    maximize browser window
    wait until page contains element    name:username      15 seconds
    input text     name:username   Admin
    input text     name:password   admin123
    click element   xpath://body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[3]/button[1]
    close browser

LogoutTest
    open browser    ${url}  ${browser}
    maximize browser window
    wait until page contains element    name:username      15 seconds
    input text     name:username   Admin
    input text     name:password   admin123
    click element   xpath://body/div[@id='app']/div[1]/div[1]/div[1]/div[1]/div[2]/div[2]/form[1]/div[3]/button[1]
    wait until page contains element    xpath:(//i[@class='oxd-icon bi-caret-down-fill oxd-userdropdown-icon'])[1]  15 seconds
    click element   xpath:(//i[@class='oxd-icon bi-caret-down-fill oxd-userdropdown-icon'])[1]
    wait until page contains element    xpath://a[normalize-space()='Logout']  15 seconds
    click element   xpath://a[normalize-space()='Logout']
    close browser

*** Keywords ***
