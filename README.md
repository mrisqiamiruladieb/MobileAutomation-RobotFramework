# MobileAutomation-RobotFramework
Mobile Automation (Android)

## Bahan Uji
---
1. [Source APK Demo](https://bit.ly/Myskill-apk-demo)
2. Diet App: [Source APK Diet App](https://bit.ly/Myskill-apk-diet) dan [Git Version](https://github.com/fghilmany/Easy-Diet-App)

## Persiapan Awal
---
1. Instal [Node.js bersama npm](https://nodejs.org/en/download), Java Development Kit (JDK), [Android SDK: Android Studio](https://developer.android.com/studio) 
2. Konfigurasi Android Studio (Pengujian Aplikasi Android dengan Emulator)
   - Buat Virtual Device pada Device Manager
     - Pilih jenis, versi android, dan sebagainya
     - Klik tombol *Play* untuk jalankan emulator
   - Buka File Aplikasi (.apk)
     - Klik *File* &rarr; *Profile or Debug APK* &rarr; **path_apk**
   - Buka File Aplikasi (Git Version): *Clone Repository*
   - Instal Aplikasi Uji
     - Pastikan pada *header*, terdapat **nama_app(logo_android)** dan **virtual_device**. Lalu, klik tombol *Play* untuk *run*.
3. Instal dan Konfigurasi Appium
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
4. Pengujian Aplikasi Android menggunakan *Real Device*
   - Aktifkan **Mode Pengembang** dan **Debugging USB** pada *Real Device* 
     - Untuk Versi Android >= 11, bisa juga menggunakan *WiFi Debugging* dan *Pair device with QR code* di *android studio*
   - Instal [Vysor](https://www.vysor.io) (Aplikasi untuk melakukan *mirroring* layar *smartphone* di PC)
   - Unduh **APK Info** di *smartphone* untuk mengetahui `appPackage` dan `appActivity`
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
   