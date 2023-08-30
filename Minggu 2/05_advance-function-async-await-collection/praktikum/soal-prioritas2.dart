/*
SOAL :

1. Buatlah sebuah list dengan spesifikasi berikut:
    a. Tiap elemen wajib berupa list juga
    b. tiap element wajib terdapat 2 data(sub-elemen)
    c. Buatlah sebuah map dengan menggunakan list tersebut

2. Buatlah sebuah program untuk menghitung rata-rata dari sekumpulan nilai. Lakukan pembulatan keatas untuk nilai hasil perhitungan rata-rata.

3. Buatlah sebuah program untuk melakukan perhitungan bilangan faktorial secara asinkron.

*/


import 'dart:io';    //IMPORTANT : Karena menggunakan stdin dari library dart:io maka program harus dijalankan melalui terminal


//Fungsi menghitung faktorial
Future<void> faktorial (int nilai) async{
  BigInt faktorial = BigInt.from(1);  //Menggunakan tipe data BigInt agar bisa menampung nilai yang lebih besar

  //Melakukan perulangan untuk menghitung faktorial dengan cara iterasi
  for(int i = 1;i<=nilai;i++){
    await Future.delayed(Duration(seconds: 1), (){        //delay waktu setiap pengulangan
      faktorial = faktorial * BigInt.from(i);
      print("nilai dari $i! adalah $faktorial");
    });
  }

  print("\nHasil faktorial dari $nilai adalah $faktorial");
}


void main(List<String> args) async{
  print("SOAL PRIORITAS 2");
  print("Pilih Soal : ");
  print("1. Membuat map dari data list");
  print("2. Menghitung rata-rata dari sekumpulan nilai (menggunakan list)");
  print("3. Menghitung faktorial secara asinkron\n");

  int? n = int.tryParse(stdin.readLineSync()!);   //digunakan untuk pemilihan case
  if(n == null){      //null safety
    return print("Pilihan yang dimasukkan tidak valid!");
  }

  switch (n) {
    //Case 1 : Memilih program membuat map dari data list
    case 1:
      //Pada list yang dibuat, indeks pertama akan dijadikan "key" dalam map sedangkan indeks kedua akan dijadikan "value" dalam map
      List<List<dynamic>>  brandLists= [
        ["Brand Mobil", "Mercedes"],
        ["Brand Sepeda", "United"],
        ["Brand Perabot", "Lion Star"],
        ["Brand Laptop", "Asus"],
        ["Brand Handphone", "Samsung"],
      ];

      Map<String,String> brandMap = {}; //Map menampung variabel string sebagai key dan valuenya

      //Melakukan perulangan sesuai dengan banyaknya isi variabel brandLists
      for(int i=0;i<brandLists.length;i++){
        //"key" map diambil dari indeks pertama list ([0]), sedangkan "value" nya diambil dari indeks kedua list ([1])
        brandMap[brandLists[i][0]] = brandLists[i][1];
      }
      print("List data brand :\n$brandLists");
      print("Map data brand :\n$brandMap");
    break;

    //Case 2 : Memilih program Menghitung rata-rata dari sekumpulan nilai
    case 2 :
      List<double> listNumber = [];
      //Menentukan jumlah data
      print("\nMasukkan jumlah data dalam list : ");
      int? length = int.tryParse(stdin.readLineSync()!);
      if(length == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }

      //Melakukan input data ke dalam list sesuai jumlah yang ditentukan
      for(int i=1;i<=length;i++){
        print("Masukkan data ke-$i : ");
        double? number = double.tryParse(stdin.readLineSync()!);
        if(number == null){       //null safety
          return print("Masukkan nilai yang sesuai!");
        }
        listNumber.add(number);
      }

      double total = 0;
      for(var number in listNumber){
        total += number;
      }
      double average = total / listNumber.length;     //rumus rata-rata

      print("Nilai rata-rata dari list yang telah dibuat adalah ${average.ceil()}");  //fungsi .ceil() digunakan untuk melakukan pembulatan keatas
    break;

    //Case 3 : Menghitung faktorial secara asinkron
    case 3 :
      //Inisialisasi dan memberikan nilai pada variabel yang diperlukan
      print("\nMasukkan bilangan yang ingin dihitung faktorialnya : ");
      int? number = int.tryParse(stdin.readLineSync()!);
      if(number == null){         //null safety
          return print("Angka yang dimasukkan tidak valid!");
      }

      //Menjalankan fungsi penghitung faktorial
      await faktorial(number);
    break;

    default: print("Pilihan yang dimasukkan tidak valid!");
  }
}