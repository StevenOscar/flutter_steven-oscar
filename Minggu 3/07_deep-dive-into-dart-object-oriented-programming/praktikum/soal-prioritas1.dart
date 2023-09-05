/*
SOAL :

1. Buat Class dengan spesifikasi sesuai pada gambar dibawah ini

2. Dari rangkaian Class diatas, buatlah method Overriding untuk membedakan tiap proses dalam method antar Class! sehingga dapat melengkapi pengguaan code dibawah ini

*/
import 'dart:io';

abstract class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang({
    this.panjang = 0,
    this.lebar = 0,
    this.tinggi = 0
  });

  double volume();
}

class Kubus extends BangunRuang{
  double sisi;

  Kubus ({
    required this.sisi
  });

  @override
  double volume(){
    print("\nVolume Kubus dengan Sisi $sisi adalah : ");
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang{
  Balok({
    required super.panjang,
    required super.lebar,
    required super.tinggi
  });

  @override
  double volume(){
    print("\nVolume Balok dengan Panjang $panjang, Lebar $lebar, dan Tinggi $tinggi adalah :");
    return panjang * lebar * tinggi;
  }
}


void main(List<String> args) {
  print("\nSOAL PRIORITAS 1");
  print("Program Menghitung Volume Bangun Ruang dengan Class ");
  print("Pilih Bangun Ruang : ");
  print("1. Kubus");
  print("2. Balok");

  int? n = int.tryParse(stdin.readLineSync()!);  //digunakan untuk pemilihan case
  if(n == null){       //null safety
    return print("Pilihan yang dimasukkan tidak valid!");
  }

  switch (n){
    //Case 1 : Memilih program menghitung volume kubus
    case 1 :
      //Memasukkan nilai yang diperlukan untuk penghitungan Volume
      print("\nMasukkan nilai Sisi Kubus : ");
      double? sisi = double.tryParse(stdin.readLineSync()!);
      if(sisi == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }

      //Membuat object kubus sesuai dengan sisi yang diinput
      BangunRuang kubus = Kubus(sisi: sisi);

      //Memanggil Method volume pada class Kubus untuk melakukan penghitungan volume
      print(kubus.volume());
    break;

    //Case 2 : Memilih program menghitung volume balok
    case 2 :
      //Memasukkan nilai yang diperlukan untuk penghitungan Volume
      print("\nMasukkan nilai Panjang Balok : ");
      double? panjang = double.tryParse(stdin.readLineSync()!);
      if(panjang == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }
      print("\nMasukkan nilai Lebar Balok : ");
      double? lebar = double.tryParse(stdin.readLineSync()!);
      if(lebar == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }
      print("\nMasukkan nilai Tinggi Balok : ");
      double? tinggi = double.tryParse(stdin.readLineSync()!);
      if(tinggi == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }

      //Membuat object balok sesuai dengan panjang, lebar, dan tinggi yang diinput
      BangunRuang balok = Balok(panjang: panjang, lebar: lebar, tinggi: tinggi);

      //Memanggil Method volume pada lass Balok untuk melakukan penghitungan volume
      print(balok.volume());
    break;

    default: print("Pilihan yang dimasukkan tidak valid!");
  }
}