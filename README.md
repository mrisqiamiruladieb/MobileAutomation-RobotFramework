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

## Persiapan & Langkah TDD (*Test Driven Development*)
---
1. Instal [DataDriver Library](https://docs.robotframework.org/docs/testcase_styles/datadriven#using-datadriver-library)
   - [Cek daftar paket yang terinstal](https://pip.pypa.io/en/stable/cli/pip_list/#) di cmd: `pip list`
2. Buat *File Sumber Data* berikut: Resources/**userDiet.csv**
3. Konfigurasi *Settings (Library, Test Template), Keywords, Test Cases* pada *file* Step/**appDietStep.robot**
4. Jalankan server Appium di command line: `appium`
5. *Run file* Step/**appDietStep.robot**, seperti *Problem* and *Solving* nomor 3 pada *repository* [swagLabs-RobotFramework](https://github.com/mrisqiamiruladieb/swagLabs-RobotFramework/tree/main?tab=readme-ov-file#problem-and-solving) serta pantau *emulator* di *android studio* atau tampilan di *real device* (*Stand By*)
   
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