# Summary/Resume Minggu 1 (Fundamental Dart)

## Poin Pertama

Pertemuan pada Minggu 2 pertemuan 2 membahas tentang Advance Function, Async-Await,dan Collection Dart. Advanced function dalam Dart mencakup penggunaan anonymous function (fungsi tanpa nama) dan arrow function (fungsi berisi return value). async-await dalam dart berguna untuk menjalankan beberapa proses tanpa perlu menunggu, 'await' dapat digunakan untuk men-delay eksekusi program hingga proses pada Future selesai. Dart memiliki tipe data collection untuk menampung data dalam jumlah banyak contohnya seperti List dan map. Dalam list kita dapat mengakses nilai berdasarkan indeks, sedangkan dalam map kita dapat menyimpan data berdasarkan key-value nya. Penggunaan Collection membuat data lebih mudah dimanipulasi dan digunakan terutama jika data berjumlah banyak.

## Poin Kedua

### Advanced Function

Advanced Function Dart terdiri dari :

- Anonymous Function : Merupakan fungsi yang tidak memiliki nama. Fungsi ini dapat diperlakukan seperti data.

```dart
(){
    //perintah yang akan dijalankan ketika fungsi dipanggil
}
```

- Arrow Function : Merupakan fungsi yang bisa memiliki nama ataupun tidak. fungsi ini dapat menghasilkan nilai return setelah pendefinisian parameter. Arrow function ini digunakan dengan mengganti kurung kurawal'{}' dengan tanda panah '=>'.

```dart
void main() {
  int addNumbers(int a, int b) => a + b;
  print(addNumbers(5, 3)); // Output: 8
}
```

### Async-Await

Async-Await adalah konsep dalam Dart yang digunakan untuk mengelola operasi asinkron secara lebih mudah. Dalam pemrograman asinkron, operasi yang memerlukan waktu seperti pencarian data dan penghitungan tidak akan mengganggu eksekusi program. Async-await digunakan dengan menandai fungsi menggunakan kata kunci 'async', dan menggunakan kata kunci 'await' untuk menunggu hasil dari operasi yang berjalan.

Contoh :

```dart
void main() async {

  await fetchData(data) {
    print("Data yang diterima: $data");
  };

  print("Program selesai");
}

Future<String> fetchData() async{
  return Future.delayed(Duration(seconds: 2), () {
    // Perintah
  });
}

```

### Tipe data Future

Tipe data Future adalah cara untuk merepresentasikan nilai yang akan tersedia di masa depan setelah operasi asinkron selesai. Tipe data ini dapat ditunggu dan membawa data return dari fungsi async.

## Poin Ketiga

### Collection

Collection dalam Dart berarti kumpulan data dalam suatu tempat/variabel.

Contoh Colection dalam Dart :

- List : List adalah Collection yang mengandung urutan nilai, yang dapat berupa tipe data apa pun, termasuk campuran tipe data (apabila tipe data tidak dispesifikan dalam deklarasi). List menyimpan data secara berbaris berdasarkan indeks yang dimulai dari indeks '0'.

```dart
List<int> numbers = [1, 2, 3, 4, 5];
print(numbers[0]); // Output: 1

numbers.add(6); // Menambahkan nilai 6 ke dalam list
numbers.remove(3); // Menghapus nilai 3 dari list

print(numbers); // Output: [1, 2, 4, 5, 6]

```

- Map : Map adalah Collection yang memetakan kunci (keys) ke nilai (values). Kunci dalam Map harus unik, dan setiap kunci terkait dengan satu nilai. Key memiliki kegunaan yang mirip dengan indeks pada List.

```dart
Map<String, int> ages = {
  'Alice': 25,
  'Bob': 30,
  'Carol': 28,
};

print(ages['Alice']); // Output: 25

ages['David'] = 22; // Menambahkan pasangan kunci-nilai baru
ages.remove('Bob'); // Menghapus pasangan kunci-nilai untuk 'Bob'

print(ages); // Output: {'Alice': 25, 'Carol': 28, 'David': 22}

```
