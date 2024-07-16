# MobileAutomation-RobotFramework
Mobile Automation (Android)

## Branch Information
---
- **main:** utama
- **TDD:** Test Driven Development

## Bahan Uji
---
1. [Source APK Demo](https://bit.ly/Myskill-apk-demo)
2. Diet App: [Source APK Diet App](https://bit.ly/Myskill-apk-diet) dan [Git Version](https://github.com/fghilmany/Easy-Diet-App)

## Persiapan Awal
---
1. Instal [Node.js bersama npm](https://nodejs.org/en/download), Java Development Kit (JDK), [Android SDK: Android Studio](https://developer.android.com/studio) 
2. Konfigurasi Android Studio (Pengujian Aplikasi Android dengan Emulator)
   - Pada _File_ &rarr; **Project Structure**, pastikan sudah terdapat _Android SDK berhubungan dengan Java_ dan sebagainya.
   - Buat Virtual Device pada Device Manager
     - Pilih jenis, versi android, dan sebagainya
     - Klik tombol *Play* untuk jalankan emulator
   - Buka File Aplikasi (.apk)
     - Klik *File* &rarr; *Profile or Debug APK* &rarr; **path_apk**
   - Buka File Aplikasi (Git Version): *Clone Repository*
   - Instal Aplikasi Uji
     - Pastikan pada *header*, terdapat **nama_app(logo_android)** dan **virtual_device**. Lalu, klik tombol *Play* untuk *run*.
4. Instal dan Konfigurasi Appium
   - Instal [Appium](https://appium.io/docs/en/latest/quickstart/install/) beserta [Drivernya](https://appium.io/docs/en/latest/quickstart/uiauto2-driver/) di *command line*
   - Instal [Appium Inspector](https://github.com/appium/appium-inspector/releases)
   - Jalankan server Appium di *command line*: `appium`
   - Buka aplikasi *Appium Inspector*
     - Sesuaikan Appium Server di *command line* dengan *Aplikasi*: Remote Host, Remote Port, Remote Path
     - Pada **JSON Representation/Capability Builder** masukkan kode berikut dan sesuaikan dengan emulator di *android studio*:
       - `{
                "appium:deviceName": "sdk_gphone_x86",
                "platformName": "Android",
                "appium:platformVersion": "11.0",
                "appium:app": "C:/Users/ACER/Downloads/Copy of ApiDemos-debug.apk",
                "appium:automationName": "UiAutomator2"
          }`
       - Keterangan:
         - *deviceName* : Android Studio &rarr; Buka *Emulator* &rarr; Pergi ke *Settings* &rarr; Pilih **About emulated device**
         - *automationName* : **Appium Driver**
     - Selanjutnya, *Start Session*
5. Pengujian Aplikasi Android menggunakan *Real Device*
   - Aktifkan **Mode Pengembang** dan **Debugging USB** pada *Real Device* 
     - Untuk Versi Android >= 11, bisa juga menggunakan *WiFi Debugging* dan *Pair device with QR code* di *android studio*
   - Instal [Vysor](https://www.vysor.io) (Aplikasi untuk melakukan *mirroring* layar *smartphone* di PC)
   - Unduh [APK Info](https://apkcombo.com/apk-info/com.wt.apkinfo/download/apk) di *smartphone* untuk mengetahui `appPackage` (di bawah nama aplikasi) dan `appActivity` (di bagian Activities &rarr; bagian pertama)
   - Jalankan *Appium Server* dan *Appium Inspector*. 
     - Pada *Appium Inspector*: sesuaikan kode **JSON Representation/Capability Builder** berikut:<br>
     `{
        "appium:deviceName": "Redmi",
        "platformName": "Android",
        "appium:platformVersion": "7.1.2 N2G47H",
        "appium:appPackage": "com.fghilmany.dietmealapp",
        "appium:appActivity": ".ui.main.MainActivity",
        "appium:automationName": "UiAutomator2"
      }` 
   - Selanjutnya, *Start Session*

## Persiapan & Langkah *Android Automation* menggunakan *Robot Framework*
---
1. Lakukan **Pre-Requisite** nomor 1-2, seperti *repository* [swagLabs-RobotFramework](https://github.com/mrisqiamiruladieb/swagLabs-RobotFramework?tab=readme-ov-file#pre-requisite)
2. Instal [Appium Library](https://docs.robotframework.org/docs/different_libraries/appium)
3. Buat **Struktur Folder** berikut: **POM (*Page Object Modelling*)** 
   - **Apk**: Untuk menyimpan *file* aplikasi .apk
   - **Resources**: Untuk menyimpan *file locator, test data, keywords*, dan *resources* lainnya
   - **Step**: Untuk menyimpan *test files*
4. Jalankan server Appium di *command line*: `appium`
5. *Run*, seperti **Problem and Solving** nomor 3 pada *repository* [swagLabs-RobotFramework](https://github.com/mrisqiamiruladieb/swagLabs-RobotFramework/tree/main?tab=readme-ov-file#problem-and-solving)

## Masalah & Solusi
---
1. *Failed no module named AppiumLibrary*
   - Solusi: Pastikan *Appium Library: Robot Framework* terinstal pada *environment python* yang sedang digunakan. 
   - Jika memiliki instalasi *python* > 1 versi maka pada **footer vs code** bagian kanan, dapat memilih *interpreter python* tempat terinstalnya *Appium Library*.
2. *Module not found error: no moduled named 'appium.webdriver.common.touch_action'*
   - Solusi: Instal [Appium-Python-Client 3.2.1 (*Downgrade*)](https://forum.robotframework.org/t/unable-to-import-robotframework-appiumlibrary-even-after-successful-installation-in-pycharm/6990/6)
3. Hasil *screenshot* dari perintah `Capture Page Screenshot` tersimpan di [log.html](https://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html#Capture%20Page%20Screenshot)
4. Perintah untuk menutup aplikasi, setelah menyelesaikan *test cases*
   - Solusi: Tambahkan `shouldTerminateApp=true` di **capability** ([Read me](https://github.com/appium/appium-flutter-driver/issues/491))
5. Gagal mirroring dengan _vysor_
   - Solusi: Pada __hp__ &rarr; _USB settings_, pilih **Transferring images** ([Referensi](https://stackoverflow.com/questions/56251888/my-device-doesnt-show-the-allow-usb-debugging-dialog))
6. Gagal _Start Session_ di **Appium Inspector**
   - Pesan Gagal: Failed to create session. An unknown server-side error occurred while processing the command. Original error: Error executing adbExec. Original error: 'Command 'C:\\Users\\ACER\\AppData\\Local\\Android\\Sdk\\platform-tools\\adb.exe -P 5037 -s RRCWB010MLA shell cmd package list packages' exited with code 255'; Command output: Exception occurred while executing 'list': java.lang.SecurityException: Shell does not have permission to access user 150 com.android.server.am.ActivityManagerService.handleIncomingUser:15970 android.app.ActivityManager.handleIncomingUser:5152 com.android.server.pm.PackageManagerShellCommand.translateUserId:3733 at com.android.server.am.UserController.handleIncomingUser(UserController.java:2892) at com.android.server.am.ActivityManagerService.handleIncomingUser(ActivityManagerService.java:15970) at android.app.ActivityManager.handleIncomingUser(ActivityManager.java:5152) at com.android.server.pm.PackageManagerShellCommand.translateUserId(PackageManagerShellCommand.java:3733) at com.android.server.pm.PackageManagerShellCommand.runListPackages(PackageManagerShellCommand.java:1074) at com.android.server.pm.PackageManagerShellCommand.runListPackages(PackageManagerSh..bla..bla..
   - Solusi: Pada _hp_ &rarr; **Uninstall** Secure Folder app ([Referensi](https://android.stackexchange.com/questions/243104/getting-java-lang-securityexception-shell-does-not-have-permission-to-access-u))
