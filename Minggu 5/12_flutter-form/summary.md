# Summary/Resume Minggu 5 (Flutter Form)

## Poin Pertama

Pertemuan pada Minggu 5 pertemuan 2 membahas tentang Flutter Form. Flutter Form merupakan widget yang digunakan untuk menerima sebuah input atau banyak input sekaligus dari user. Input dari user ini bisa terdiri dari banyak jenis, contohnya seperti text, angka, pilihan, file, dan lain-lain. Form memungkinkan user untuk mengirimkan data yang kemudian dapat diproses/disimpan sesuai kebutuhan.

### Form Widget

Form merupakan sebuah wadah untuk berbagai input field, form biasanya digunakan untuk mengatur validasi dan submit data. Form biasanya menggunakan Stateful Widget dikarenakan form harus dapat merespon perubahan state pada aplikasi (terutama apabila tampilan form dapat berubah tergantung interaksi pada input field). State form disimpan menggunakan `GlobalKey<FormState>`.

Contoh Form :

```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: Column(
    children: <Widget>[
      TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return 'Masukkan value';
          }
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () {},
        child: Text('Submit'),
      ),
    ],
  ),
)
```

## Poin Kedua

### Input Widgets

Input Widgets adalah widget yang digunakan untuk menampung input dari user. Seperti penjelasan form sebelumnya, input ini bisa terdiri dari banyak jenis, contohnya seperti text, angka, pilihan, file, warna, dan lain-lain.

Contoh Input Widget :

#### TextField

TextField merupakan widget yang digunakan untuk menerima input dalam bentuk teks. TextField menggunakan TextEditingController untuk mengontrol value yang ditampilkan dalam TextField dan untuk mengubah value teks yang diinput oleh user (terdapat alternatif cara mengontrol value dengan memanfaatkan property onChanged atau dengan menggunakan widget textFormField agar form lebih interaktif terhadap input user).

TextField memiliki banyak properti, contohnya :

- decoration : Menghias TextField, terdiri dari banyak properti lainnya seperti hintText, errorText, focusedBorder, label, suffixIcon, dll.
- keyboardType : Mengatur jenis keyboard untuk input,
- obscureText : Menyembunyikan teks,
- autoFocus : Mengatur focus pada saat pertama kali dijalankan,
- onChanged : Menghandle perubahan input pada TextField
- onSubmitted : Menghandle ketika field disubmit

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'Masukkan Nama',
    hintText: 'Nama Lengkap',
    prefixIcon: Icon(Icons.person),
    border: OutlineInputBorder(),
  ),
  onChanged: (value) {
    print('Teks yang dimasukkan: $value');
  },
  onSubmitted: (value) {
    print('Teks yang disubmit: $value');
  },
)
```

#### Radio

Radio merupakan merupakan jenis input dimana user wajib memilih salah satu value dari banyak pilihan/opsi yang sudah disediakan (opsi yang dipilih hanya boleh satu).Data diambil menggunakan property dengan tipe data yang sesuai value pada radio. Radio memiliki alternatif Widget yaitu RadioListTile dimana widget ini memiliki tampilan default yang lebih baik daripada Radio widget biasa.

Properti pada Radio :

- groupValue : Mengelompokkan value input berdasarkan grupnya, biasanya berisi value dari opsi yang dipilih user
- value : Merupakan value dari opsi yang dipilih oleh user.
- onChanged : Digunakan untuk menghandle ketika user melakukan pemilihan/perubahan pada input

```dart
var radioValue = '';

Radio(
  value: 'laki-laki',
  groupValue: radioValue,
  onChanged: (String? value){
    setState(() {
      radioValue = value ?? '';
    });
  }
),

Radio(
  value: 'Perempuan',
  groupValue: radioValue,
  onChanged: (String? value){
    setState(() {
      radioValue = value ?? '';
    });
  }
),
```

#### CheckBox

CheckBox merupakan jenis input dimana user dapat memilih banyak value sekaligus dari opsi/pilihan yang disediakan. Value dalam CheckBox biasanya bersifat boolean tergantung dari dipilih atau tidaknya value tersebut.

Properti pada CheckBox :

- value : Merupakan value dari opsi yang dipilih oleh user.
- onChanged : Digunakan untuk menghandle ketika user melakukan pemilihan/perubahan pada input

```dart
checkValue = false;

Checkbox(
  value: checkValue,
  onChanged: (bool? value) {
    setState(() {
      checkValue = value ?? false;
    });
  },
)
```

#### DropdownButton

DropdownButton merupakan input field dimana user dapat memilih salah satu value berdasarkan daftar pilihan. Widget ini biasanya digunakan apabila pilihan yang diberikan cukup banyak. Opsi pada DropdownButton akan muncul ketika user menekan DropdownButton tersebut. Data diambil menggunakan property dengan tipe data sesuai value pada DropdownMenuItem.

Contoh Properti pada DropdownButton :

- items : merupakan daftar item yang akan ditampilkan dalam dropdown. items berisi objek DropdownMenuItem yang mendefinisikan value dari setiap opsi.
- value : Merupakan value dari opsi yang dipilih oleh user.
- onChanged : Digunakan untuk menghandle ketika user melakukan pemilihan/perubahan pada input
- hint : Memberikan hint ketika belum ada opsi yang dipilih.

```dart
DropdownButton(
  value: dropdownValue,
  onChanged: (int? value){
    setState(() {
      dropdownValue = value ?? 0;
    });
  },
  items: const [
    DropdownMenuItem(
      value: 0,
      child: Text("pilih ..."),
    ),
    DropdownMenuItem(
      value: 1,
      child: Text("satu"),
    ),
    DropdownMenuItem(
      value: 2,
      child: Text("dua"),
    ),
  ],
),
```

## Poin Ketiga

### Button

Button merupakan widget berbentuk tombol yang dapat melakukan sesuatu ketika tombol tersebut ditekan. Setiap button memiliki properti onPressed untuk menjalankan perintah yang diberikan ketika tombol ditekan.

Contoh Button :

#### ElevatedButton

ElevatedButton merupakan button yang memiliki warna dan memiliki tampilan seperti "terangkat/timbul".

Contoh Properti ElevatedButton :

- onPressed : Menjalankan perintah ketika tombol ditekan.
- child : Merupakan isi tombol, biasanya menggunakan teks atau icon.
- style : digunakan untuk mengatur tampilan tombol.

```dart
ElevatedButton(
  onPressed: () {},
  style : ElevatedButton.styleFrom(
    primary: Colors.blue,
    onPrimary: Colors.white,
  ),
  child: const Text("Submit")
),
```

#### IconButton

IconButton merupakan tombol yang memiliki tampilan berupa icon.

Contoh properti IconButton :

- icon : Merupakan icon yang ditampilkan pada tombol.
- onPressed : Menjalankan perintah ketika tombol ditekan.
- color : Mengatur warna background tombol.
- splashRadius : mengatur efek "splash" ketika tombol ditekan.

```dart
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {};
  splashRadius : 24,
  color: Colors.red,
)
```

#### TextButton

TextButton merupakan jenis button yang memiliki tampilan berupa teks.

Contoh properti TextButton :

- onPressed : Menjalankan perintah ketika tombol ditekan.
- child : isi tombol yang biasanya berupa widget text.
- style : Menghias tampilan tombol, contohnya warna text

```dart
TextButton(
  onPressed: () {},
  style: TextButton.styleFrom(
    primary: Colors.blue,
    textStyle: TextStyle(fontSize: 18),
  ),
  child: Text('Submit'),
)
```
