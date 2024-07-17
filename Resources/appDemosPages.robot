*** Settings ***
Library         AppiumLibrary
Variables       locator.yaml

*** Keywords ***
Start Session Apps
    # capability 
    Set Appium Timeout  10
    Open Application    http://127.0.0.1:4723
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 platformVersion=11.0
    ...                 deviceName=sdk_gphone_x86
    # pasang dan jalankan aplikasi
    ...                 app=D:\\belajar\\MobileAutomation-RobotFramework\\Apk\\ApiDemos-debug.apk
    # jalankan aplikasi yang telah terinstal
    # ...                 appPackage=io.appium.android.apis
    # ...                 appActivity=io.appium.android.apis.ApiDemos
    ...                 autoGrantPermissions=true
    ...                 noReset=true
    ...                 shouldTerminateApp=true
    Sleep               1

Tap Accessibility
    Click Element                ${accessibility}

Tap Accessibility Node Provider
    Click Element                 ${accessibility_node_provider}

Tap Accessibility Node Querying
    Click Element                 ${accessibility_node_querying}

Tap Accessibility Service
    Click Element                 ${accessibility_service}

Tap Custom View
    Click Element                 ${custom_view}

Close Session Apps
    Capture Page Screenshot
    Close Application               noReset=true

Close Apps
    Capture Page Screenshot
    Close Application