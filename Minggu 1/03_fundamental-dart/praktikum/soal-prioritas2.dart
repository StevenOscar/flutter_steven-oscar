/*
SOAL :

1. Buat 3 buah variabel yang menampung tipe data String, lalu sambungkan 3 variabel tersebut dan tampilkan pada layar.
2. Implementasikan rumus volume dari tabung (silinder) dengan menggunakan Bahasa Dart.

*/

import 'dart:io'; //IMPORTANT : Karena menggunakan stdin dari library dart:io maka program harus dijalankan melalui terminal
import 'dart:math' as math;

void main() {
  print("SOAL PRIORITAS 2");
  print("Pilih Soal : ");
  print("1. Menyambungkan 3 variabel bertipe data String");
  print("2. Menghitung Volume dari tabung (silinder)\n");

  int n = int.parse(stdin.readLineSync()!); //digunakan untuk pemilihan case

  switch(n){
    //Case 1 : Menyambungkan 3 variabel bertipe data String
    case 1 :
      //Menginput data yang diperlukan
      print("\nMasukkan kata/string pertama : ");
      String variabel1 = stdin.readLineSync()!;
      print("\nMasukkan kata/string kedua : ");
      String variabel2 = stdin.readLineSync()!;
      print("\nMasukkan kata/string ketiga : ");
      String variabel3 = stdin.readLineSync()!;

      //Menyambungkan string (masing-masing variabel dipisah dengan spasi)
      String StringGabungan = "$variabel1 $variabel2 $variabel3";

      //Menampilkan hasil
      print("\nString yang sudah disambung adalah : $StringGabungan");
    break;

    //Case 2 : Menghitung Volume Tabung(silinder)
    case 2 :
      //Inisiaslisasi variabel yang diperlukan
      const double pi = math.pi; //Menggunakan math.pi dari library dart:math agar lebih akurat

      print("\nMasukkan Jari-jari tabung (silinder) : ");
      double r = double.parse(stdin.readLineSync()!);
      print("\nMasukkan Tinggi tabung (silinder) : ");
      double h = double.parse(stdin.readLineSync()!);

      //Menghitung Volume menggunakan rumus lalu dibulatkan
      var VTabung = (pi * r * r * h).toStringAsFixed(4);

      //Menampilkan hasil
      print("\nVolume dari tabung (silinder) dengan Jari-jari $r dan Tinggi $h adalah $VTabung");
      break;

    default : print("Pilihan yang dimasukkan tidak valid!");;
  }
}