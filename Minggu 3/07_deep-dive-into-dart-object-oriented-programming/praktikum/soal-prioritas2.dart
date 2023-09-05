/*
SOAL :
1. Buatlah Class dengan spesifikasi berikut!
2. Dari rangkaian diatas,  lengkapi kode berikut sehingga dapat menampilkan hasil pada Layar!

*/

import 'dart:io';

abstract class Matematika {
  void hasil();
}

class KelipatanPersekutuanTerkecil implements Matematika{
  int x;
  int y;

  KelipatanPersekutuanTerkecil ({
    required this.x,
    required this.y
  });

  @override
  void hasil() {
    List<int> kelipatanX = [x];
    List<int> kelipatanY = [y];
    int KPK = 0;

    while (KPK == 0){
      if(kelipatanX.last == kelipatanY.last){
        KPK = kelipatanX.last;
      } else if(kelipatanX.last > kelipatanY.last){
        kelipatanY.add(kelipatanY.last + kelipatanY[0]);
      } else {
        kelipatanX.add(kelipatanX.last + kelipatanX[0]);
      }
    }

    print("\nKelipatan dari bilangan $x adalah : $kelipatanX");
    print("Kelipatan dari bilangan $y adalah : $kelipatanY");
    print("\nSehingga Kelipatan Persekutuan Terkecil dari kedua bilangan tersebut adalah : $KPK");
  }
}

class FaktorPersekutuanTerbesar implements Matematika{
  int x;
  int y;

  FaktorPersekutuanTerbesar ({
    required this.x,
    required this.y
  });

  @override
  void hasil() {
    List<int> faktorX = [];
    List<int> faktorY = [];
    int FPB = 1;

    for(int i = 1; i <= (x > y ? x : y); i++){
      if(x % i == 0){
        faktorX.add(i);
      }
      if(y % i == 0){
        faktorY.add(i);
      }
      if(x % i == 0 && y % i == 0){
        FPB = i;
      }
    }

    print("\nFaktor dari bilangan $x adalah : $faktorX");
    print("Faktor dari bilangan $y adalah : $faktorY");
    print("\nSehingga Faktor Persekutuan Terbesar dari kedua bilangan tersebut adalah : $FPB");
  }
}


void main(List<String> args) {
  print("\nSOAL PRIORITAS 2");
  print("Program Menghitung Kelipatan Persekutuan Terkecil dan Faktor Persekutuan Terbesar dengan Class\n");
  print("Pilih yang ingin dicari: ");
  print("1. Kelipatan Persekutuan Terkecil");
  print("2. Faktor Persekutuan Terbesar");

  int? n = int.tryParse(stdin.readLineSync()!);  //digunakan untuk pemilihan case
  if(n == null){       //null safety
    return print("Pilihan yang dimasukkan tidak valid!");
  }

  switch (n){
    case 1 :
      print("\nMasukkan Bilangan Pertama : ");
      int? num1 = int.tryParse(stdin.readLineSync()!);
      if(num1 == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }
      print("\nMasukkan Bilangan kedua : ");
      int? num2 = int.tryParse(stdin.readLineSync()!);
      if(num2 == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }

      Matematika KPK = KelipatanPersekutuanTerkecil(x: num1, y : num2);
      KPK.hasil();
    break;
    case 2 :
      print("\nMasukkan Bilangan Pertama : ");
      int? num1 = int.tryParse(stdin.readLineSync()!);
      if(num1 == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }
      print("\nMasukkan Bilangan kedua : ");
      int? num2 = int.tryParse(stdin.readLineSync()!);
      if(num2 == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }

      Matematika fpb = FaktorPersekutuanTerbesar(x: num1, y : num2);
      fpb.hasil();
    break;
    default: print("Pilihan yang dimasukkan tidak valid!");
  }
}