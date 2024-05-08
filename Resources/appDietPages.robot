*** Settings ***
Library         AppiumLibrary
Variables       appDietLocator.yaml

*** Keywords ***
Start Session Apps
    # capability 
    Set Appium Timeout  10
    Open Application    http://127.0.0.1:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 platformVersion=11.0
    ...                 deviceName=sdk_gphone_x86
    # ...                 app=D:\\belajar\\MobileAutomation-RobotFramework\\Apk\\Diet_meal.apk
    ...                 appPackage=com.fghilmany.dietmealapp
    ...                 appActivity=com.fghilmany.dietmealapp.ui.main.MainActivity
    ...                 autoGrantPermissions=true
    ...                 noReset=true
    ...                 shouldTerminateApp=true
    Sleep               1

User Input Welcome Data
    Input Text          ${homePageNameField}        Ming
    Input Text          ${homePageWeightField}      75
    Input Text          ${homePageHeightField}      182
    Click Element       ${homePageGenderMaleButton}

User Tap Next Button
    Click Element       ${homePageNextButton}

Close Session Apps
    Capture Page Screenshot
    Close Application               noReset=true

Close Apps
    Capture Page Screenshot
    Close Application