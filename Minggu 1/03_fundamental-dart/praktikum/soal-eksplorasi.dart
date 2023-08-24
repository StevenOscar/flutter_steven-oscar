/*
SOAL : 

1. Buatlah sebuah program untuk mengecek apakah sebuah kata merupakan sebuah palindrom atau bukan. Palindrom adalah sebuah kata yang jika dibalik dari kata aslinya memiliki cara baca atau susunan yang sama persis.
2. Buatlah sebuah program untuk mencari faktor dari sebuah bilangan yang dimasukkan.

*/

import 'dart:io';

//Fungsi mengecek Palindrom
void cekPalindrom(String kata){
    String cleanWord = kata.replaceAll(" ","").toLowerCase(); //membersihkan kata dari spasi dan huruf besar kecil
    bool isPalindrom = false; //indikator kata palindrom atau tidak
    String reversedWord = ""; //variabel penampung kata yang dibalik

    for(int i = 0;i<cleanWord.length;i++){
      reversedWord += cleanWord[cleanWord.length - i -1]; //mengisi variabel kata terbalik dari indeks paling belakang dari kata asli
    }

    if(reversedWord == cleanWord){
        isPalindrom = true;
    }

    if(isPalindrom==true){
      print("\npalindrom");
      print("Penjelasan : kata '$kata' jika dibalik adalah '$reversedWord' sehingga kata ini merupakan kata palindrom.");
    } else {
      print("\nbukan palindrom");
      print("Penjelasan : kata '$kata' jika dibalik adalah '$reversedWord' sehingga kata ini bukan palindrom karena ketika dibalik cara membacanya menjadi berbeda.");
    };
}

//Fungsi mencari faktor
void faktor(int angka){
  int counter = 1; //Digunakan untuk menghitung faktor ke berapa
  for (int i = 1; i <= angka; i++) {
    if(angka%(i) == 0){
      print("Faktor ke-$counter dari $angka adalah $i");
      counter++;
    }
  }
}


void main() {
  print("SOAL EKSPLORASI");
  print("Pilih Soal : ");
  print("1. Mengecek kata palindrom");
  print("2. Mencari faktor dari bilangan yang dimasukkan\n");

  int n = int.parse(stdin.readLineSync()!); //digunakan untuk pemilihan case

  switch(n){
    //Case 1 : Menghitung kata palindrom
    case 1 :
      print("\nInput kata/kalimat yang ingin dicek : \n");
      String kata = stdin.readLineSync()!;
      cekPalindrom(kata);
    break;

    //Case 2 : Mencari faktor dari bilangan
    case 2 :
      print("\nInput bilangan yang ingin dicari faktornya : ");
      int angka = int.parse(stdin.readLineSync()!);
      faktor(angka);
    break;
  }
}