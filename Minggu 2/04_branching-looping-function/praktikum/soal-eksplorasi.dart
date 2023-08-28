/*
SOAL :

1. Buatlah sebuah program untuk mengecek apakah sebuah bilangan termasuk bilangan prima atau bukan.
2. Buatlah sebuah program untuk mencetak tabel perkalian.
*/

import 'dart:io';

bool primeCheck(int angka){
  bool isPrime = true;

  for(int i=2;i<angka/2;i++){
    if(angka%i==0){
      isPrime = false;
    }
  }
  return isPrime;
}

void tabelKali(int baris){
  //perulangan sesuai baris yang ditentukan
  for(int i=1;i<=baris;i++){
    //perulangan untuk menampilkan hasil kali baris (i) dengan kolom (j)
    for(int j=1;j<=baris;j++){
      stdout.write("${(i * j)} \t");
    }
    stdout.write("\n");
  }
}

void main(List<String> args) {
  print("SOAL EKSPLORASI");
  print("Pilih Soal : ");
  print("1. Mengecek bilangan Prima");
  print("2. Mencetak tabel perkalian\n");

  int? n = int.tryParse(stdin.readLineSync()!); //digunakan untuk pemilihan case
  if(n == null){      //null safety
    return print("Pilihan yang dimasukkan tidak valid!");
  }
  switch(n){
    case 1 :
      //Inisialisasi dan memberikan nilai pada variabel yang diperlukan
      print("Masukkan bilagan bulat yang ingin dicek primanya : ");
      int? angka = int.tryParse(stdin.readLineSync()!);
      if(angka == null){      //null safety
        return print("Angka tidak valid!");
      }

      //Menampilkan output sesuai dengan bilangan yang telah dicek
      if(primeCheck(angka) == true){
        print("\nBilangan $angka termasuk dalam bilangan prima");
      } else {
        print("\nBilangan $angka adalah bukan bilangan prima");
      }
    break;

    case 2 :
      //Inisialisasi dan memberikan nilai pada variabel yang diperlukan
      print("Masukkan batas nilai tabel perkalian : ");
      int? angka = int.tryParse(stdin.readLineSync()!);
      if(angka == null){      //null safety
        return print("Angka tidak valid!");
      } else {
        //Memanggil fungsi tabelKali jika variabel angka valid
        tabelKali(angka);
      }
    break;

    default : print("Pilihan yang dimasukkan tidak valid!");
  }
}