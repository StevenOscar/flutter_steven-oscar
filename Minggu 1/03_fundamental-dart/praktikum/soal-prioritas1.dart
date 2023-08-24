/*
SOAL :

1. Buatlah rumus keliling dan luas persegi dan persegi panjang dengan menggunakan bahasa pemrograman Dart
2. Implementasikan rumus keliling dan luas dari Lingkaran dengan menggunakan Bahasa Dart

*/

import 'dart:io'; //IMPORTANT : Karena menggunakan stdin dari library dart:io maka program harus dijalankan melalui terminal
import 'dart:math' as math;

void main() {
  print("SOAL PRIORITAS 1");
  print("Pilih Soal : ");
  print("1. Menghitung Keliling dan Luas Persegi dan Persegi Panjang");
  print("2. Menghitung Keliling dan Luas Lingkaran\n");

  int n = int.parse(stdin.readLineSync()!); //digunakan untuk pemilihan case

  switch(n){
    //Case 1 : Memilih ingin menghitung persegi atau persegi panjang
    case 1 :
      print("\nPilih Bangun Datar");
      print("1. Persegi");
      print("2. Persegi Panjang\n");

      int n = int.parse(stdin.readLineSync()!);

      switch(n){
        //Case 1 : Menghitung Keliling dan Luas Persegi
        case 1 :
          //Inisiaslisasi dan input variabel yang diperlukan
          print("\nMasukkan sisi persegi : ");
          double s = double.parse(stdin.readLineSync()!);
          double KPersegi, LPersegi;

          //Menghitung Keliling dan Luas menggunakan rumus
          KPersegi = 4 * s;
          LPersegi = s * s;

          //Menampilkan hasil
          print("\nKeliling Persegi dengan Sisi $s adalah $KPersegi");
          print("Luas Persegi dengan Sisi $s adalah $LPersegi");

          break;

        //Case 2 : Menghitung Keliling dan Luas Persegi Panjang
        case 2 :
          //Inisiaslisasi dan input variabel yang diperlukan
          print("\nMasukkan Panjang persegi panjang : ");
          double p = double.parse(stdin.readLineSync()!);

          print("\nMasukkan Lebar persegi panjang : ");
          double l = double.parse(stdin.readLineSync()!);

          double KPersegiPanjang, LPersegiPanjang;

          //Menghitung Keliling dan Luas menggunakan rumus
          KPersegiPanjang = 2 * (p+l);
          LPersegiPanjang = p * l;

          //Menampilkan hasil
          print("\nKeliling Persegi Panjang dengan Panjang $p dan Lebar $l adalah $KPersegiPanjang");
          print("Luas Persegi Panjang dengan Panjang $p dan Lebar $l adalah $LPersegiPanjang");
          break;

        default : print("Pilihan yang dimasukkan tidak valid!");
        break;
      }
    break;

    //Case 2 : Menghitung Keliling dan Luas Lingkaran
    case 2 :
      //Inisiaslisasi variabel yang diperlukan
      const double pi = math.pi; //Menggunakan math.pi dari library dart:math agar lebih akurat
      print("\nMasukkan Jari-jari lingkaran : ");
      double r = double.parse(stdin.readLineSync()!);

      //Menggunakan variabel dynamic karena hasil akan diubah menjadi string agar angka dapat dibulatkan
      var KLingkaran, LLingkaran;

      //Menghitung Keliling dan Luas menggunakan rumus lalu dibulatkan
      KLingkaran = (pi * 2 * r).toStringAsFixed(4);
      LLingkaran = (pi * r * r).toStringAsFixed(4);

      //Menampilkan hasil
      print("\nKeliling Lingkaran dengan Jari-jari $r adalah $KLingkaran");
      print("Luas Lingkaran dengan Jari-jari $r adalah $LLingkaran");
      break;

    default : print("Pilihan yang dimasukkan tidak valid!");
  }
}