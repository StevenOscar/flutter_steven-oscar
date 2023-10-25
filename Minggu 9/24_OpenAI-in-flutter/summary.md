# Summary/Resume Minggu 9 (OpenAI in flutter)

## Poin Pertama

Materi pada Minggu 9 pertemuan 3 membahas tentang OpenAI in flutter. Materi ini membahas tutorial penggunaan platform OpenAI untuk mendevelop aplikasi untuk memberikan rekomendasi mobil berdasarkan harga dan asal merk mobil tersebut.

### Library OpenAI

Library OpenAI merupakan library model-model (text model, chat model, dsb) yang didevelop oleh OpenAI yang dapat diintegrasian dengan berbagai aplikasi pada platform yang berbeda-beda seperti API, web, dan mobile.

## Poin Kedua

### Keuntungan dari penggunaan library OpenAI

- Gratis (terdapat trial)
- Mudah dipasang
- Dapat digunakan berbagai perangkat
- Memiliki banyak parameter (175 miliar parameter pada model davinci 03)

### Project Overview

Sesuai penjelasan sebelumnya, project yang dicontohkan merupakan aplikasi untuk memberikan rekomendasi mobil berdasarkan asal merk dan harganya.

## Poin Ketiga

### Cara membuat aplikasi rekomendasi mobil menggunakan AI

1. Mendapatkan API key dari [platform.openai](https://platform.openai.com/account/api-keys). Setelah API key digenerate, simpan dan catatlah key tersebut agar tidak hilang karena tidak bisa dicek kembali
2. Membuat Project flutter

    Buatlah project flutter seperti biasa, lalu tambahkan package `intl` dan `http/dio`.

3. Membuat File konfigurasi

    File konfigurasi dibuat pada folder root project dengan nama `.env`, lalu masukkan `OPENAI_API_KEY` menggunakn key yang sudah digenerate tadi.

    Setelah membuat file `.env`, buat folder baru bernama `env` pada lib dan buat file `env.dart`. Contoh :

      ```dart
      // lib/env/env.dart
      import 'package:envied/envied.dart';

      part 'env.g.dart';

      @Envied(path: '.env')
      abstract class Env {
        @EnviedField(varName: 'OPENAI_API_KEY')
        static const String apiKey = _Env.apiKey;
      }
      ```

    Lalu generate code untuk membaca `.env` dengan menuliskan `flutter pub run build_runner build` di terminal. Setelah file `env.g.dart` dibuat, buat variabel untuk menyimpan API key pada folder `constants`.

4. Membuat Data Model

    Dalam kasus ini, model yang perlu dibuat adalah sebagai berikut :

    - gptData Model : Untuk menampung response body dari API OpenAI
    - Choice Model : Untuk menampung output yang ada pada gptData Model.
    - Usage Model : Untuk Menampung data penggunaan token/biaya dari tiap request

5. Membuat Komponen Service

    Dalam kasus ini, service yang perlu dibuat adalah sebagai berikut :

    - Recommendation Service : File yang berisi algoritma untuk melakukan request POST ke API OpenAI, dan menerima response body dari API OpenAI

6. Membuat Tampilan

    Dalam kasus ini, tampilan yang perlu dibuat adalah sebagai berikut :

    - Halaman Home : Untuk menerima input user yang nantinya digunakan sebagai request body (dalam kasus ini terdapat textfield untuk menerima data budget dan carRegion)
    - Halaman Result : Untuk menampilkan output yang sudah didapat dari response yang diberikan oleh API OpenAI.
