*** Settings ***
Library         AppiumLibrary
Library         DataDriver      ../Resources/userDiet.csv       sheet_name=sheet1
Resource        ../Resources/appDietPages.robot
Suite Setup     Start Session Apps
Suite Teardown  Close Apps
Test Template   User Input Welcome Data

*** Keywords ***
User Input Welcome Data
    Sleep               5
    [Arguments]         ${username}     ${weight}       ${height}
    Input Text          ${homePageNameField}        ${username}
    Input Text          ${homePageWeightField}      ${weight}
    Input Text          ${homePageHeightField}      ${height}
    Click Element       ${homePageGenderMaleButton}

*** Test Cases ***
As a user i want to open APP Diet
    Sleep                           5
    Page Should Contain Text        Welcome

User Input Welcome Data     ${username}     ${weight}       ${height}
    User Tap Next Button
