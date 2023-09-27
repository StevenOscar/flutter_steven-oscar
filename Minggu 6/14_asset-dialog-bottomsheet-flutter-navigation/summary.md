# Summary/Resume Minggu 6 (Assets, Dialog & Bottom Sheet, dan Flutter Navigation)

## Poin Pertama

### Assets

Materi pada Minggu 6 pertemuan 1 membahas tentang Assets. Assets merupakan kumpulan file yang dibundle dan dideploy bersama dengan aplikasi. Kumpulan file ini dapat memiliki tipe dan ekstensi yang berbeda-beda.

Contoh tipe dan ekstensi file Assets :

- Static data (JSON)
- File gambar (.svg, .jpg, .png, dll), file
- File font (.ttf), file
- File audio (.MP3, .WAV, .flac, dll),
- File pdf, dan sebagainya

#### Menambahkan Assets

Untuk dapat menggunakan Assets, File-file Asset tersebut harus didaftarkan terlebih dahulu di file `pubspec.yaml`. Umumnya Assets disimpan pada sebuah folder `assets`.

```yaml
  # Menambahkan assets per file
  assets:
    - assets/image.png
    - assets/data.json

  #Menambahkan assets dalam 1 folder sekaligus
  assets :
    - assets/
```

#### Asset Image

Image merupakan file gambar yang umumnya digunakan untuk menampilkan icon, background, foto pendukung content, dsb sehingga tampilan aplikasi menjadi lebih menarik. Flutter mendukung banyak format gambar seperti JPEG, WebP, GIF, PNG, BMP, WBMP, dll.

Untuk dapat menampilkan Asset image terdapat 2 cara, yaitu :

- Menggunakan Widget Image

  ```dart
  Image(
    image: AssetImage('assets/image.png'),
  )
  ```

- Menggunakan Method Image.asset (untuk local assets) dan Image.network (untuk remote assets)

  ```dart
    Image.assets('assets/image.png'),
    Image.network('https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-674010.jpg&fm=jpg')
  ```

#### Asset Font

Asset Font merupakan asset yang digunakan untuk mengubah tampilan teks dalam aplikasi. Styling Font dapat membuat aplikasi menjadi lebih unik. File font biasanya menggunakan format .ttf atau .otf.

Cara menggunakan Asset Font terdapat 2 jenis yaitu :

- Menggunakan Custom Font dari file :

1. Cari dan download file font di internet (contoh : [Google Fonts](fonts.google.com) )
2. Masukkan file font yang sudah didownload ke folder `assets` di project flutter
3. Daftarkan file font tersebut di `pubspec.yaml`

    ```yaml
    flutter:
      fonts:
        - family: NamaFont
          fonts:
            - asset: assets/font/NamaFont-Regular.ttf
            - asset: assets/font/NamaFont-Bold.ttf
    ```

4. Gunakan font dengan cara memanggil nama family font tersebut

    ```dart
    Text(
      'Text',
      style: TextStyle(
        fontFamily: 'NamaFont',
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    )
    ```

- Menggunakan Font dari Package GoogleFonts :

1. Tambahkan package google_fonts di dependencies `pubspec.yaml`

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      google_fonts: ^2.2.0
    ```

2. Import package di file dart

    ```dart
      import 'package:google_fonts/google_fonts.dart';
    ```

3. Gunakan dengan memanggil GoogleFonts.namaFont() di style widget Text

    ```dart
    Text(
      'Text',
      style: GoogleFonts.roboto(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
    )
    ```

## Poin Kedua

### Dialog & Bottom Sheet

Materi pada Minggu 6 pertemuan 2 membahas tentang Dialog & Bottom Sheet. Dialog digunakan untuk menginformasikan ke user tentang informasi tertentu atau untuk mendapatkan input dari user. AlertDialog dan BottomSheet dapat menampilkan informasi melalui popup window yang muncul pada saat ada interaksi dari user.

#### AlertDialog

AlertDialog merupakan sebuah dialog yang biasanya muncul di tengah layar. AlertDialog digunakan bersamaan dengan fungsi showDialog sebagai builder.

Parameter dari fungsi AlertDialog terdiri dari :

- title : Berisi judul dari Dialog, terletak pada bagian atas dialog
- content : Berisi keterangan/informasi utama dari Dialog, terletak pada bagian tengah dialog
- actions : Biasanya berisi tombol/button untuk mengkonfirmasi tindakan yang ingin dilakukan, terletak pada bagian bawah dialog

Contoh Penggunaan AlertDialog :

```dart
showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Alert Dialog'),
      content: Text('Contoh Alert Dialog'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    );
  },
);
```

#### Bottom Sheet

Bottom Sheet merupakan sebuah dialog yang biasanya muncul di bagian bawah layar. FungsishowModalBottomSheet membutuhkan dua properti utama yaitu context dan builder.

Contoh parameter dari fungsi showModalBottomSheet :

- context : Merupakan context aplikasi saat ini.
- builder : Merupakan builder yang membangun tampilan Bottom Sheet
- isDismissible : Digunakan untuk mengatur apakab user bisa mengclose Bottom Sheet bila ditekan bagian luarnya
- enableDrag : Digunakan untuk mengatur apakah Bottom Sheet bisa di scroll atau tidak
- backgroundColor : Memberi warna pada Bottom Sheet
- shape : Mengubah bentuk dari Bottom Sheet

Contoh penggunaan Bottom Sheet :

```dart
showModalBottomSheet(
  context: context,
  builder: (BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Tambahkan Item'),
            onTap: () {
              // Logika ketika item dipilih
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Hapus Item'),
            onTap: () {
              // Logika ketika item dipilih
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  },
);

```

## Poin Ketiga

### Navigation

Materi pada Minggu 6 pertemuan 3 membahas tentang Flutter Navigation. Navigation merupakan cara untuk berpindah halaman di aplikasi. Navigation dalam Flutter diibaratkan seperti sebuah tumpukan/stack. Navigation di flutter diatur oleh sebuah Object Navigator.

#### Navigation Biasa

Pada Navigation biasa, digunakan method Navigator.push() untuk berpindah halaman dan Navigator.pop() untuk kembali ke halaman sebelumnya. Terdapat beberapa variasi pada Navigator.push() yaitu :

- Navigator.pushReplacement() : Navigator ini akan mereplace halaman saat ini dengan halaman baru, sehingga ketika dilakukan Navigator.pop() maka yang tampil adalah halaman sebelumnya.
- Navigator.pushAndRemoveUntil() : Navigator ini membuka halaman baru dan menghapus semua halaman yang ada di stack navigator sampai suatu kondisi terpenuhi.
- Dan masih banyak lagi

Untuk mendapatkan data dari halaman sebelumnya, maka class yang dituju memerlukan properti dan constructor untuk menampung yang diberikan. Sehingga ketika ketika halaman saat ini melalukan Navigator.push(), halaman tersebut terlebih dahulu harus menginisialisasi properti yang dibutuhkan untuk memanggil class di halaman selanjutnya.

Contoh penggunaan Navigator.push() untuk mengirim data :

```dart
/// Halaman Pertama
String data = 'Halo';

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => HalamanKedua(data: data),
  ),
);


/// Halaman Kedua
class HalamanKedua extends StatelessWidget {
  final String data;

  HalamanKedua({required this.data});

  /// Data sudah berhasil didapatkan dan tinggal ditampilkan
}
```

#### Navigation dengan Named Routes

Pada Navigasi menggunakan Named Routes, diperlukan sebuah map pada properti routes di MaterialApp. Map tersebut berisi daftar seluruh halaman yang bisa dituju ketika "key" dari map itu dipanggil.

```dart
MaterialApp(
  routes: {
    '/': (context) => HomePage(),
    '/detail': (context) => DetailPage(),
  },
)
```

Pada Navigation dengan Named Routes, Method Navigator.push() diganti dengan menggunakan Navigator.pushNamed(), sedangkan untuk kembali tetap menggunakan Navigator.pop(). Variasi pada Navigator.pushNamed() sama saja dengan Navigator.push(), hanya tinggal menambahkan kata 'Named' saja ditiap methodnya.

Contoh penggunaan Navigation.pushNamed() :

```dart
Navigator.pushNamed(context, '/detail');
```

Untuk mendapatkan data dari halaman sebelumnya, Navigator Named routes biasanya menggunakan sebuah properti arguments yang bisa diisi dengan data yang ingin dikirim. Kemudian pada halaman selanjutnya tinggal membuat variabel yang menyimpan nilai `ModalRoute.of(context)!.settings.arguments`.

```dart
  /// Halaman Pertama
  String data = 'Halo';

  Navigator.pushNamed(
    context,
    '/halamanKedua',
    arguments: data,
  );

  ///Halaman Kedua
  class HalamanKedua extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      // Mengambil data dari arguments
      String? data = ModalRoute.of(context)?.settings.arguments as String?;
      /// Data sudah berhasil didapatkan dan tinggal ditampilkan
    }
  }
```
