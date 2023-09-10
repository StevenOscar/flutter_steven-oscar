# Summary/Resume Minggu 4 (Installation Command Line Interface and Package Management Flutter)

## Poin Pertama

Pertemuan pada Minggu 4 pertemuan 1 membahas tentang Flutter CLI dan Package Management.

### Flutter CLI

Flutter CLI merupakan kumpulan command/perintah yang dapat digunakan untuk mengembangkan aplikasi dengan Flutter. Perintah-perintah ini memungkinkan developer untuk membuat project, run project, mengelola software & packages yang diperlukan, mengatur device yang digunakan sebagai output, dan membersihkan project setelah di build/test. Perintah Flutter CLI bisa dijalankan dengan menuliskan perintah tersebut di terminal.

### Package Management

Package Management mengacu pada pengelolaan dan pengintegrasian package pihak ketiga (third-party) yang dibuat oleh developer lain ke dalam project Flutter. Melalui package sharing, developer tidak perlu lagi mengembangkan aplikasi dari nol karena pekerjaan tersebut telah dilakukan oleh developer lain, alhasil pengembangan aplikasi dapat berjalan dengan lebih cepat. Package pihak ketiga tersebut dapat dilihat dan diakses pada link : [pub.dev](pub.dev).

## Poin Kedua

### Important Command pada CLI Flutter

Agar dapat melihat seluruh perintah yang bisa dijalankan pada Flutter CLI, ketikkan "flutter --help" pada terminal atau bisa dengan masuk ke link : <https://docs.flutter.dev/reference/flutter-cli>.

Berikut adalah contoh perintah-perintah yang penting dalam mendevelop aplikasi menggunakan Flutter :

#### - Flutter Doctor

Command ini digunakan untuk memeriksa software-software dan configuration yang digunakan untuk mendevelop aplikasi menggunakan Flutter seperti Android Studio, Xcode (untuk pengembangan aplikasi iOS), SDK flutter, dll. serta mengecek dependensi yang hilang atau masalah lainnya.

``` cmd
flutter doctor
```

#### - Flutter Create

Command ini digunakan untuk membuat project Flutter baru pada directory yang kita inginkan. Ketika menjalankan perintah ini, maka flutter akan secara otomatis men-generate seluruh file yang diperlukan.

``` cmd
flutter create <nama_project>
```

#### - Flutter Run

Command ini digunakan untuk menjalankan project flutter yang telah dibuat. Pada saat menjalankan perintah ini, akan muncul pilihan untuk mengcompile dan menjalankan aplikasi di emulator, windows, perangkat fisik (connected device), dan di browser.

``` cmd
flutter run <Dart_file>
```

#### - Flutter Emulator

Command ini digunakan untuk mengelola emulator android yang sudah terinstall dan terkoneksi dengan project flutter. Perintah ini dapat melihat daftar emulator yang tersedia, menjalankan emulator, dan melakukan konfigurasi pada emulator.

``` cmd
flutter emulators

flutter emulators --launch <emulator_id>

flutter emulator create [--name xyz]
```

#### - Flutter Channel

Command ini digunakan untuk menampilkan daftar channel yang tersedia dan menunjukan channel yang digunakan saat ini. Flutter memiliki beberapa channel, seperti stable, beta, dan dev, yang memiliki versi Flutter yang berbeda. Dengan mengubah channel dari stable menjadi beta atau dev, developer dapat mencoba berbagai fitur-fitur eksperimental atau update paling baru dari flutter, namun biasanya channel ini memiliki bug atau masalah lainnya.

``` cmd
flutter channel

flutter channel list

flutter channel beta
```

#### - Flutter Pub

Command ini digunakan untuk melakukan package management. Perintah ini dapat menginstall dan mengupdate package pada project flutter.

``` cmd
flutter pub add        //untuk menambah package ke pubspec.yaml

flutter pub get        //untuk mendownload package di pubspec.yaml
```

#### - Flutter Build

Command ini digunakan untuk meng-export project ke berbagai platform, seperti android (.apk), iOS (.ipa), web (HTML), dan desktop (macOS, linux, windows). Setelah project di-export, maka project tersebut dapat dipublish di AppStore, PlayStore,dll.

``` cmd
flutter build apk

flutter build ipa

flutter build web

flutter build windows
```

#### - Flutter Clean

Command ini digunakan untuk membersihkan project flutter dari berbagai temporary file, cache,build, dependecies, dll. Perintah ini dapat memperkecil ukuran prject dan dapat mengatasi masalah cache file yang bisa mempengaruhi proses compile.

``` cmd
flutter clean
```

## Poin Ketiga

### Langkah menambahkan package di Flutter

1. Cari Package di [pub.dev](pub.dev), lalu cari package yang diinginkan, misalnya package http.

2. Copy Baris Dependencies package tersebut di Installing

3. Buka file pubspec.yaml pada project flutter menggunakan code editor

4. Paste Baris Dependencies yang sudah dicopy dari [pub.dev](pub.dev) ke Depndencies di file pubspec.yaml

5. Get Dependencies, setelah menambahkan dependencies baru ke pubspec.yaml, download dependencies tersebut dengan menjalankan perintah flutter pub get di terminal.

6. Import Package di File Dart. contoh : import 'package:http/http.dart' as http;

7. Stop atau Restart jika diperlukan (bila program tidak berjalan atau error)
