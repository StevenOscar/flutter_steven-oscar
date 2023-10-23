# Summary/Resume Minggu 9 (UI Testing)

## Poin Pertama

Materi pada Minggu 9 pertemuan 1 membahas tentang UI Testing Output Build.

### UI Testing

UI Testing merupakan pengujian yang dilakukan pada tampilan aplikasi untuk memastikan aplikasi dapat menerima interaksi dan memberikan respon kepada user. UI Testing biasa disebut juga dengan Widget testing karena UI testing dilakukan dengan cara menuliskan script yang harus dilakukan oleh komponen widget sehingga aplikasi dapat dijalankan secara otomatis.

### Output Build

Output Build merupakan file/berkas output dari project flutter. Output build ini umumnya digunakan untuk merilis aplikasi ke App Store (mode release), menguji performa aplikasi (mode profile), dan untuk melakukan pengujian pada development (mode debug).

Untuk device android, maka output build yang dipakai adalah .apk/.aab. Sedangkan untuk device iOS maka output build yang digunakan adalah .ipa.

## Poin Kedua

### Keungungan melakukan UI Testing

Keuntungan menggunakan UI Testing adalah sebagai berikut :

- Memastikan seluruh widget memiliki tampilan yang sesuai (Contohnya masalah pada layout, warna, ukuran,dsb)
- Memastikan interaksi dapat diterima dengan baik (Contohnya pada saat melakukan scroll, tap button, mengisi data,dsb)
- Menjadi ketentuan yang harus diikuti saat memerlukan perubahan pada widget

#### Cara Melakukan UI Testing

1. Menambahkan Package flutter_test di pubspec.yaml pada bagian dev_dependencies, setelah itu lakukan `flutter pub get` (langkah ini umumnya tidak perlu dilakukan karena secara default package flutter_test sudah ada di pubspec.yaml)

    ```yaml
    dev_dependencies:
      flutter_test:
        sdk: flutter
    ```

2. Membuat file Testing

    Hal ini dilakukan dengan membuat file pada folder test dengan nama file diakhiri kata `_test.dart` (Contohnya `contact_test.dart`)

3. Menuliskan Test Case

    Penulisan script dilakukan di dalam fungsi `main()`. Setiap Test case diawali dengan fungsi `testWidgets()` yang bersifat asyncronous

    ```dart
    testWidgets('judul test case', (WidgetTester tester) async {
      // Script Test
    });
    ```

4. Menuliskan Script Testing di dalam Test Case

    Setelah menuliskan Test case, maka tuliskan simulasi yang ingin dilakukan, seperti menerkan button dengan `tester.tap`, menemukan text dengan `find.text`, mengisi textfield dengan `tester.entertext`, memperbaharui widget setelah action dengan `tester.pump`,dsb.

    ```dart
    // Contoh script Testing
    testWidgets('judul test case', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      final button = find.byKey(Key('myButton'));
      await tester.tap(button);

      await tester.pump();

      expect(find.text('Teks Setelah Klik'), findsOneWidget);

      final textField = find.byKey(Key('myTextField'));
      await tester.enterText(textField, 'Teks Baru');

      await tester.pump();

      expect(find.text('Teks Baru'), findsOneWidget);
    });
    ```

5. Menjalankan testing dengan menjalankan perintah `flutter test` di terminal. Hasil dari flutter test mencakup lama waktu pengujian, pesan pengujian apabila berhasil/gagal. Jika pengujian gagal maka akan diberi tahu, bagian mana yang gagal.

    ```cmd
    00:05 +1: All tests passed!
    ```

## Poin Ketiga

### Build APK

APK merupakan format file yang hanya dapat digunakan pada sistem operasi Android. Sebelum melakukan build apk, ada beberapa hal yang perlu dilakukan yatu :

- Mengatur nama aplikasi di AndroidManifest.xml
- Mengatur icon aplikasi
- Mengatur perizinan aplikasi di AndroidManifest.xml

Seperti yang dijelaskan sebelumnya, build apk dapat dilakukan dengan 3 mode yaitu profile, debug, dan release.

#### AndroidManifest.xml

AndroidManifest.xml merupakan file yang berisi informasi tentang aplikasi tersebut, seperti nama aplikasi, komponen, permission, dan fitur hardware aplikasi.

file AndroidManifest.xml terdapat pada 3 folder berbeda (debug, profile, main). Ketiga folder tersebut terletak pada directory android/app/src.

### Cara Mengatur perizinan aplikasi

Mengatur perizinan aplikasi dapat dilakukan dengan menambahkan tag `<uses-permission>`. Contoh :

  ```xml
    <uses-permission android:name="android.permission.INTERNET"/>
  ```

### Build IPA

IPA merupakan format file yang hanya dapat digunakan pada sistem operasi iOS. Untuk membuild file .ipa, perlu menggunakan akun Apple Developer program.

#### info.plist

info.plist merupakan file konfigurasi pada aplikasi iOS.

### Cara Mengubah nama aplikasi

Untuk dapat mengubah nama aplikasi pada android, maka hanya tinggal mengganti properti android:label pada AndroidManifest.xml yang ada di file AndroidManifest.xml tersebut.

```dart
<application
  android:label="counter_app"
  .....
  >
```

Untuk mengatur nama aplikasi pada iOS, pada file info.plist, ubah nama dalam tag `String` yang berada dibawah key Bundle Name sesuai nama aplikasi yang ingin digunakan.

Untuk mengubah nama aplikasi pada berbagai platform sekaligus, bisa juga dilakukan menggunakan package rename :

1. Install Package rename dengan menjalankan perintah `flutter pub get global activate rename`
2. Menjalankan perintah `flutter pub global run rename --appname "Nama Aplikasi"`
3. Stop dan jalankan ulang aplikasi

### Cara Mengubah icon aplikasi

Langkah-langkah mengubah icon aplikasi menggunakan library `flutter_launch_icons`

1. Buat folder `assets` pada root project flutter
2. Masukkan icon yang ingin dipakai ke dalam folder `assets`
3. Menambahkan package `flutter_launcher_icons` di dev_dependencies pada `pubspec.yaml`
4. Tambahkan flutter_icons di `pubspec.yaml` dibawah dev_dependencies, isinya terdiri dari sistem operasinya, dan path icon (yang sudah diletakkan pada `assets`)
5. Jalankan `flutter pub run flutter_launcher_icons:main` di terminal
