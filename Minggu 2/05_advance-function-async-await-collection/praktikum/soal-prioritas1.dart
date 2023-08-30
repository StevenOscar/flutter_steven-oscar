/*
SOAL :

1. Buatlah sebuah fungsi dengan spesifikasi berikut:
    a. Menerima 2 parameter, yaitu list data dan pengali
    b. Lakukan perulangan pada list data secara asynchronous
    c. Tiap perulangan, kalikan elemen list data dengan pengali
    d. Return list baru yang berisi hasil proses diatas
*/

import 'dart:io';   //IMPORTANT : Karena menggunakan stdin dari library dart:io maka program harus dijalankan melalui terminal


Future<List<int>> multiplyList (List<int> data, int multiplier) async{
  List<int> ListBaru = [];         //list yang digunakan untuk menampung data yang sudah dikali
  for(int i=0;i< data.length;i++){
    await Future.delayed(Duration(seconds: 1), (){      //delay waktu setiap pengulangan
    ListBaru.add(data[i] * multiplier);
    print("Berhasil! data ditambahkan dalam list baru : ${ListBaru[i]}");
    });
  }
  return ListBaru;
}

void main() async{
  print("SOAL PRIORITAS 1");
  print("Program mengalikan data dalam list\n");

  List<int> data = [];      //list yang akan menampung data sebelum dikali

  //Menentukan jumlah data dalam list
  print("Masukkan jumlah data dalam list : ");
  int? length = int.tryParse(stdin.readLineSync()!);
  if(length == null){       //null safety
    return print("Masukkan nilai yang sesuai!");
  }

  //Melakukan input data ke dalam list sesuai jumlah yang ditentukan
  for(int i=1;i<=length;i++){
    print("Masukkan data ke-$i : ");
    int? number = int.tryParse(stdin.readLineSync()!);
    if(number == null){       //null safety
      return print("Masukkan nilai yang sesuai!");
    }
    data.add(number);
  }

  //Menentukan nilai pengali
  print("\nMasukkan nilai pengali : ");
  int? multiplier = int.tryParse(stdin.readLineSync()!);
  if(multiplier == null){       //null safety
    return print("Masukkan nilai yang sesuai!");
  }

  //menjalankan fungsi multiplyList untuk mengalikan data dengan pengali
  List<int> listBaru = await multiplyList(data,multiplier);

  //menampilkan hasil dari list sebelum dikali dan sesudah dikali
  print("\nList data sebelum dikali dengan pengali : $data");
  print("List data sesudah dikali dengan pengali : $listBaru");
}