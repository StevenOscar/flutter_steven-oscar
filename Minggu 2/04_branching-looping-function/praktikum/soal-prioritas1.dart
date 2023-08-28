/*
## Tugas Percabangan(Branching)

1. Terdapat sebuah nilai:
    a. jika nilai > 70 akan mereturn “Nilai A”
    b. jika nilai > 40 akan mereturn “Nilai B”
    c. jika nilai > 0 akan mereturn “Nilai C”
    d. selain itu return teks kosong

## Tugas Perulangan(Looping)

1. tampilkan nilai 1 - 10 pada layar dengan menggunakan perulangan!
*/

import 'dart:io'; //IMPORTANT : Karena menggunakan stdin dari library dart:io maka program harus dijalankan melalui terminal

void main(List<String> args) {
  print("SOAL PRIORITAS 1");
  print("Pilih Soal : ");
  print("1. Mengkategorikan nilai (Tugas Percabangan)");
  print("2. Menampilkan nilai (Tugas Perulangan)\n");

  int? n = int.tryParse(stdin.readLineSync()!); //digunakan untuk pemilihan case
  if(n == null){      //null safety
    return print("Pilihan yang dimasukkan tidak valid!");
  }

  switch(n){
    //Case 1 : Memilih program mengkategorikan nilai
    case 1 :
      //Inisialisasi dan memberikan nilai pada variabel yang diperlukan
      print("Masukkan Nilai : ");
      double? nilai = double.tryParse(stdin.readLineSync()!);
      if(nilai == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }

      //Mengkategorikan nilai dan menuliskan output menggunakan percabangan(if)
      if(nilai > 70 ){
        print("Nilai A");
      } else if(nilai > 40){
        print("Nilai B");
      } else if(nilai >= 0){
        print("Nilai C");
      } else {
        print(" ");
      }
    break;

    //Case 2 : Memilih program menampilkan nilai
    case 2 :
      //Inisialisasi dan memberikan nilai pada variabel yang diperlukan
      print("\nMasukkan batas nilai yang ingin ditampilkan : ");
      double? range = double.tryParse(stdin.readLineSync()!);
      if(range == null){        //null safety
        return print("Masukkan nilai yang sesuai!");
      }

      print("");  //Memberikan jarak antar teks

      //Melakukan perulangan untuk menampilkan output sesuai range
      for(int i=1;i<=range;i++){
        print(i);
      }
    break;

    default : print("Pilihan yang dimasukkan tidak valid!");
  }
}