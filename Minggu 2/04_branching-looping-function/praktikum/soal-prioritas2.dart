/*
SOAL :

## Tugas Looping
1. Buatlah sebuah piramid bintang seperti gambar dibawah ini:

2. Buatlah sebuah jam pasir seperti pada gambar dibawah ini

3. tampilkan faktorial dari nilai nilai dibawah in:
    a. 10
    b. 40
    c. 50

## Tugas Function

1. Buatlah sebuah function dengan parameter untuk menghitung luas lingkaran. kemudian function lingkaran tersebut dijalankan pada function main!
*/


import 'dart:io'; //IMPORTANT : Karena menggunakan stdin dari library dart:io maka program harus dijalankan melalui terminal
import 'dart:math'as math;


double luasLingkaran(double r){
  const pi = math.pi;  //Menggunakan math.pi dari library dart:math agar lebih akurat

  return pi * r * r;  //Mereturn hasil dari penghitungan luas Lingkaran
}

void main(List<String> args) {
  print("SOAL PRIORITAS 2");
  print("Pilih Soal : ");
  print("1. Tugas Looping");
  print("2. Menghitung luas lingkaran(Tugas Function)\n");

  int? n = int.tryParse(stdin.readLineSync()!); //digunakan untuk pemilihan case
  if(n == null){      //null safety
    return print("Pilihan yang dimasukkan tidak valid!");
  }

  switch(n){
    case 1 :
      print("\nPilih program : ");
      print("1. Piramida bintang");
      print("2. Jam pasir");
      print("3. Faktorial\n");

      int? n = int.tryParse(stdin.readLineSync()!);
      if(n == null){      //null safety
        return print("Pilihan yang dimasukkan tidak valid!");
      }
      switch(n){
        //Case 1.1 : Memilih Program piramida bintang
        case 1 :
          //Inisialisasi dan memberikan nilai pada variabel yang diperlukan
          print("\nMasukkan tinggi piramida : ");
          int? tinggi = int.tryParse(stdin.readLineSync()!);
          if(tinggi == null){         //null safety
              return print("Tinggi yang dimasukkan tidak valid!");
          }

          //Melakukan perulangan sesuai dengan tinggi piramida
          for(int i=0;i<tinggi+1;i++){
            //Menuliskan spasi
            for(int j = tinggi -i; j>0;j--){
              stdout.write("  ");
            }

            //Menuliskan bintang
            for(int k = 2 * i -1; k> 0; k--){
              stdout.write("* ");
            }

            //Membuat line baru
            stdout.write("\n");
          }
        break;

        //Case 1.2 : Memilih Program jam pasir
        case 2 :
          //Inisialisasi dan memberikan nilai pada variabel yang diperlukan
          print("\nMasukkan tinggi jam pasir (dari atas sampai leher) : ");
          int? tinggi = int.tryParse(stdin.readLineSync()!);
          if(tinggi == null){         //null safety
              return print("Tinggi yang dimasukkan tidak valid!");
          }

          //Melakukan perulangan dari bagian atas jam pasir sampai bagian leher jam pasir
          for(int i=0; i<tinggi; i++){
            // Menuliskan spasi
            for(int j = 0; j<i;j++){
              stdout.write(" ");
            }
            // Menuliskan angka nol
            for(int k= 2 * (tinggi-i) - 1;k>0;k--){
              stdout.write("0");
            }
            //Membuat line baru
            stdout.write("\n");
          }

          //Melakukan perulangan dari bagian leher jam pasir sampai bagian bawah jam pasir
          for(int x = 2;x<tinggi+1;x++){
            // Menuliskan spasi
            for(int y = 0; y<tinggi-x;y++){
              stdout.write(" ");
            }
            // Menuliskan angka nol
            for(int z = 2 * x - 1;z>0;z--){
              stdout.write("0");
            }
            //Membuat line baru
            stdout.write("\n");
          }
        break;

        //Case 1.3 : Memilih Program faktorial
        case 3 :
          //Inisialisasi dan memberikan nilai pada variabel yang diperlukan
          print("\nMasukkan bilangan yang ingin dihitung faktorialnya : ");
          int? number = int.tryParse(stdin.readLineSync()!);
          if(number == null){         //null safety
              return print("Angka yang dimasukkan tidak valid!");
          }
          BigInt sum = BigInt.from(1);  //Menggunakan tipe data BigInt agar bisa menampung nilai yang lebih besar

          //Melakukan perulangan untuk menghitung faktorial dengan cara iterasi
          for(int i = 1;i<=number;i++){
            sum = sum * BigInt.from(i);
          }

          //Menampilkan hasil
          print("faktorial dari bilangan $number adalah $sum");
        break;

        default : print("Pilihan yang dimasukkan tidak valid!");
      }
    break;

    //Case 2 : Memilih Program hitung luas lingkaran
    case 2 :
      //Inisialisasi dan memberikan nilai pada variabel yang diperlukan
      print("\nMasukkan jari-jari lingkaran : ");
      double? r = double.tryParse(stdin.readLineSync()!);
      if(r == null){           //null safety
        return print("Jari-jari yang dimasukkan tidak valid!");
      } else {
        //Memanggil fungsi luasLingkaran jika variabel r valid, kemudian hasil dibulatkan menjadi 4 desimal
        print("Luas lingkaran dengan jari-jari $r adalah ${luasLingkaran(r).toStringAsFixed(4)}");
      }
    break;

    default : print("Pilihan yang dimasukkan tidak valid!");
  }
}