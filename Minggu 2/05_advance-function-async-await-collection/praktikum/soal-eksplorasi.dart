/*
SOAL :

1. Buatlah sebuah program untuk menghilangkan nilai atau data yang sama pada sebuah data sehingga output akhirnya adalah sekumpulan nilai atau data yang unik.

2. Buatlah sebuah program untuk menghitung frekuensi pada setiap data di dalam sebuah list. Frekuensi merupakan jumlah kemunculan data di dalam list.

*/

import 'dart:io';    //IMPORTANT : Karena menggunakan stdin dari library dart:io maka program harus dijalankan melalui terminal


//Fungsi untuk menambahkan data ke dalam list menggunakan input terminal
void addData(List<String> rawData){
  //Menentukan jumlah data
  print("Masukkan jumlah data dalam list : ");
  int? length = int.tryParse(stdin.readLineSync()!);
  if(length == null){       //null safety
    return print("Masukkan nilai yang sesuai!");
  }

  //Melakukan input data ke dalam list sesuai jumlah yang ditentukan
  for(int i=1;i<=length;i++){
    print("Masukkan data ke-$i : ");
    String? data = stdin.readLineSync();
    if(data == null){       //null safety
      return print("Masukkan nilai yang sesuai!");
    }
    rawData.add(data);
  }
}

void main(List<String> args) {
  print("SOAL EKSPLORASI");
  print("Pilih Soal : ");
  print("1. Menghilangkan data yang sama pada sebuah data (list data unik)");
  print("2. Menghitung frekuensi setiap data dalam sebuah list\n");

  int? n = int.tryParse(stdin.readLineSync()!);   //digunakan untuk pemilihan case
  if(n == null){      //null safety
    return print("Pilihan yang dimasukkan tidak valid!");
  }

  switch (n) {
    case 1 :
      //Inisialisasi  variabel yang diperlukan
      List<String> rawData = [];
      List<String> uniqueData = [];

      //Fungsi untuk mengisi data ke dalam list
      addData(rawData);

      //Mengisi unique List
      for(int i=0;i<rawData.length;i++){
        if(uniqueData.contains(rawData[i])){   //data dari list rawData tidak akan ditambahkan apabila sudah ada di list uniqueData
          continue;
        }
        uniqueData.add(rawData[i]);
      }

      //Menampilkan hasil
      print("\nData awal yang telah dimasukkan adalah \n$rawData");
      print("\nList data yang sudah dijadikan unique adalah \n$uniqueData");
    break;


    case 2 :
      //Inisialisasi  variabel yang diperlukan
      List<String> rawData = [];
      List<String> uniqueData = [];
      List<String> frequencyList = [];

      //Fungsi untuk mengisi data ke dalam list
      addData(rawData);

      //Mengisi unique List
      for(int i=0;i<rawData.length;i++){
        if(uniqueData.contains(rawData[i])){
          continue;
        }
        uniqueData.add(rawData[i]);
      }

      //Menghitung frekuensi masing-masing data dalam list
      for(int j=0;j<uniqueData.length;j++){
        int counter = 0;
        for(int k=0;k<rawData.length;k++){
          if(uniqueData[j]==rawData[k]){
            counter++;
          }
        }
        frequencyList.add("${uniqueData[j]} : ${counter}");
      }

      //Menampilkan hasil
      print("\nData awal yang telah dimasukkan adalah \n$rawData");
      print("\nFrekuensi dari masing-masing data di list tersebut adalah : ");
      for(int i=0;i<frequencyList.length;i++){
        stdout.write("${frequencyList[i]}, ");
      }
    break;

    default: print("Pilihan yang dimasukkan tidak valid!");
  }
}