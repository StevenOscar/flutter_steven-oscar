# Summary/Resume Minggu 5 (Advanced Flutter Form)

## Poin Pertama

Pertemuan pada Minggu 5 pertemuan 3 membahas tentang Advanced Flutter Form. Menurut saya, Advanced Form disini merujuk pada penggunaan berbagai input Widget yang tidak menyimpan data dengan tipe data primitif seperti String, integer, boolean, double, dll. Pada materi ini, implementasi Advanced Form dilakukan pada DatePicker (Memilih tanggal), ColorPicker (Memilih warna), dan FilePicker (Memilih file).

### Inisialisasi

Untuk dapat menggunakan Advanced Form, perlu dilakukan penambahan dependencies pada file `pubspec.yaml`. Berikut adalah daftar package dependencies yang perlu ditambahkan :

- intl: untuk datePicker
- flutter_colorPicker : untuk colorPicker
- file_picker : untuk filePicker
- openFile : untuk membuka file (yang dipick oleh filePicker)

```yaml
dependencies:
  flutter:
    sdk: flutter
  intl: ^0.18.1
  flutter_colorpicker: ^1.0.3
  file_picker: ^5.5.0
  open_file: ^3.3.2
```

## Poin Kedua

### DatePicker

DatePicker adalah sebuah widget dimana user dapat menginputkan data berupa tanggal. Tanggal dalam aplikasi sendiri dapat digunakan pada beberapa hal seperti tanggal kelahiran, waktu pemesanan tiket, waktu reservasi, jadwal,dll. data datePicker biasanya disimpan dalam variabel yang bertipe data DateTime.

datePicker menggunakan fungsi showDatePicker untuk menerima input tanggal. Fungsi showDatePicker memiliki tipe data future dan menampilkan dialog material design date picker. showDatePicker dialog ini memiliki beberapa properti seperti :

- initialDate : Menunjukan tanggal yang ditampilkan ketika dialog dibuka pertama kali.
- firstDate : Digunakan untuk menentukan batas awal tanggal yang dapat dipilih.
- lastDate : Digunakan untuk menentukan batas akhir tanggal yang dapat dipilih.
- locale : Untuk melokalisasi bahasa khususnya dalam penamaan tanggal

Contoh Penggunaan datePicker :

```dart
ElevatedButton(
  onPressed: () async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null) {
      setState(() {
        print('Selected date: $selectedDate');
      });
    }
  },
  child: Text('Select Date'),
)
```

#### ColorPicker

ColorPicker adalah widget dimana user bisa menginputkan data berupa warna/color. colorPicker bisa digunakan pada kasus ketika ingin mengcustomize tema aplikasi atau mengcustomize profile akun di aplikasi. colorPicker memiliki beberapa jenis seperti blockPicker, colorPicker, dan slidePicker.

Contoh properti colorPicker :

- pickerColor : Menentukan warna yang dipilih pertama kali saat colorPicker ditampilkan.
- onColorChanged : Merupakan function callback ketika warna diubah dalam colorPicker.
- colorPickerWidth : Menentukan lebar dari colorPicker.
- recentColors : Digunakan untuk menyimpan history warna yang dipilih dalam bentuk List. Perlu digunakan bersamaan dengan properti enableRecentColors.

Contoh penggunaan colorPicker :

```dart
Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Container(
      width: 100.0,
      height: 100.0,
      color: currentColor,
    ),
    ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Pilih warna'),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: currentColor,
                  onColorChanged: changeColor,
                  colorPickerWidth: 300.0,
                ),
              ),
              actions: <Widget>[
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
      },
      child: Text('Change Color'),
    ),
  ],
)
```

## Poin Ketiga

### FilePicker dan openFile

filePicker merupakan widget yang dapat menyimpan data dalam bentuk file. filePicker memiliki kemampuan untuk dapat mengakses storage device dan memilih file.

Pada filePicker terdapat properti type untuk menentukan jenis dari file yang dapat diinput, properti allowedExtensions untuk menentukan extension dari file yang dapat diinput, dsb.

openFile merupakan package yang digunakan untuk membuka file yang dipilih berdasarkan nama pathnya,

Contoh penggunaan FilePicker dan OpenFile :

```dart
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text("Pick Files"),
    const SizedBox(height: 10,),
    Center(
      child: ElevatedButton(
        onPressed: () {
          _pickFile();
        },
        child: const Text("Pick and open file")
      ),
    )
  ]
);

void _pickFile() async {
  final result = await FilePicker.platform.pickFiles();
  if (result == null ) return ;

  final file = result.files.first;
  _openFile(file);
}

void _openFile(PlatformFile file){
  OpenFile.open(file.path);
}
``'
