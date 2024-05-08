*** Settings ***
Library         AppiumLibrary
Resource        ../Resources/appDietPages.robot
Suite Setup     Start Session Apps
Suite Teardown  Close Apps

*** Test Cases ***
As a user i want to open APP Diet
    Sleep                           5
    Page Should Contain Text        Welcome

As a user i want to input my data
    User Input Welcome Data
    User Tap Next Button
