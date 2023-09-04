# Summary/Resume Minggu 2 (Branching, Looping, dan Function)

## Poin Pertama

Pertemuan pada Minggu 2 pertemuan 1 membahas tentang Branching, Looping, dan Function. Branching, looping, dan function adalah konsep dalam pemrograman agar program dapat berjalan secara efektif. Branching memungkinkan program untuk membuat keputusan berdasarkan kondisi yang ditentukan, sedangkan looping memungkinkan program menjalankan perintah/blok kode secara berulang. Function memungkinkan pemecahan kode menjadi bagian yang dapat dipanggil secara terpisah, memudahkan untuk membaca kode, dan mempermudah reuse code. Ketiga faktor itu merupakan hal penting yang mampu memudahkan programmer dalam mengembangkan program yang ingin dibuat.

## Poin Kedua

### Branching

Terdapat beberapa cara/jenis dalam Branching :

- If Statement: Menjalankan kode jika kondisi benar.

```dart
if (kondisi) {
    // kode jika kondisi benar
}
```

- If-Else Statement: Menjalankan kode jika kondisi benar, jika tidak, jalankan kode lain.

```dart
if (kondisi) {
    // kode jika kondisi benar
} else {
    // kode jika kondisi salah
}
```

- Nested-if Statement: Mengevaluasi beberapa kondisi secara berurutan dan menjalankan kode sesuai kondisi pertama yang terpenuhi.

```dart
if (kondisi1) {
    // kode untuk kondisi 1
} else if (kondisi2) {
    // kode untuk kondisi 2
} else {
    // kode jika tidak ada kondisi terpenuhi
}
```

- Switch-case : Mengambil keputusan berdasarkan nilai dari sebuah variabel dan menjalankan kode yang sesuai dengan nilai tersebut.

```dart
var pilihan = 'B';

switch (pilihan) {
  case 'A':
    print('Pilihan pertama');
    break;
  case 'B':
    print('Pilihan kedua');
    break;
  default:
    print('Pilihan tidak valid');
}
```

### Looping

Terdapat 3 jenis looping yang bisa digunakan dalam bahasa Dart, yaitu :

- For Loop:
Loop for digunakan untuk melakukan iterasi/pengulangan dalam jumlah tertentu.

```dart
for (inisialisasi; kondisi; perubahan) {
    // kode yang diulang
}
```

- While Loop:
Loop while menjalankan blok kode selama kondisi yang diberikan bernilai true.

```dart
while (kondisi) {
    // kode yang diulang selama kondisi benar
}
```

- Do-While Loop:
Loop do-while mirip dengan while, tetapi blok kode di dalamnya dieksekusi setidaknya satu kali sebelum kondisi diperiksa.

```dart
do {
    // kode yang diulang setidaknya sekali walaupun kondisi bernilai false
} while (kondisi);
```

Selain cara untuk melakukan pengulangan/loop, ada pula perintah untuk memanipulasi looping dengan break dan continue :

- break : Pernyataan break digunakan untuk menghentikan loop sebelum kondisi pengulangan selesai

```dart
for (var i = 0; i < 5; i++) {
    if (i == 3) {
        break; // loop berhenti ketika i == 3
    }
    print(i);
}
```

- continue : Pernyataan continue menghentikan iterasi saat ini dalam loop dan melanjutkan ke iterasi berikutnya.

```dart
for (var i = 0; i < 5; i++) {
    if (i == 3) {
        continue; // lewati iterasi ketika i == 3
    }
    print(i);
}
```

## Poin Ketiga

### Function

Function adalah Kumpulan kode yang dapat digunakan secara berulang

Berikut adalah beberapa jenis Function dalam bahasa pemrograman Dart :

- Function tanpa Parameter: Fungsi ini tidak menerima parameter apapun. Contohnya adalah fungsi yang hanya mencetak pesan singkat.

```dart
void tanpaParameter() {
    print("Ini adalah fungsi tanpa parameter");
}

```

- Function dengan Parameter: Fungsi yang dapat menerima satu atau lebih parameter. Parameter ini digunakan untuk mengirim data ke dalam fungsi itu sendiri.

```dart
void denganParameter(String nama) {
    print("Halo, $nama!");
}
```

- Function dengan Optional parameter : Parameter ini diberi nilai default dan dapat diabaikan saat pemanggilan fungsi. Didefinisikan dalam tanda kurung kotak [].

```dart
void optionalParameter(String pesan, [int jumlah = 1]) {
    for (var i = 0; i < jumlah; i++) {
        print(pesan);
    }
}
```

- Function dengan Required Parameter : Function dengan parameter required ini merupakan fungsi dengan parameter yang wajib diisi pada bracket optional parameter.

```dart
void requiredParameter({required String name, required int age}) {
  print("Hello $name,saya berumur $age");
}
```
