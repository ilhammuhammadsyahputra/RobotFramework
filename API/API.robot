*** Settings ***
Library  RequestsLibrary

*** Variables ***
${REQRES_BASE_URL}  https://reqres.in/

*** Test Cases ***
Get User from page 3
    [Setup]     Create Session  ReqRes   ${REQRES_BASE_URL}
    ${resp}     Get    On Session  ReqRes   api/users?page=3
    Should Be Equal As Strings  ${resp.status_code} 200

Get Single User with ID 10
    [Setup]     Create Session  ReqRes   ${REQRES_BASE_URL}
    ${resp}     Get    On Session  ReqRes   api/users/10
    Should Be Equal As Strings ${resp.status_code}  200

Register Successful
    [Setup]     Create Session  ReqRes   ${REQRES_BASE_URL}
    &{user}     Create Dictionary   name=John Doe   job=Tester
    ${resp}     Post   On Session     ReqRes  api/register data=${user}
    Should Be Equal As Strings ${resp.status_code}  200

Register Failed
    [Setup]     Create Session  ReqRes   ${REQRES_BASE_URL}
    &{user}     Create Dictionary   name=     job=
    ${resp}     Post   On Session     ReqRes  api/register   data=${user}
    Should Be Equal As Strings ${resp.status_code}  400