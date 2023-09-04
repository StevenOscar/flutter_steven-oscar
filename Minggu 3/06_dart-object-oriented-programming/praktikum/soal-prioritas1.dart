/*
SOAL :

1. buatlah sebuah class dengan ketentuan dibawah ini

2. Selanjutnya pada class Mobil, tambahkan method totalMuatan untuk menghitung total muatan yang diangkut oleh mobil tersebut!

*/
import 'dart:io';

class Hewan {
  double berat;
  String nama;

  Hewan ({
    required this.berat,
    this.nama = "Hewan tanpa nama"      //Nilai default apabila nama hewan tidak diisi
  });
}

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil ({
    required this.kapasitas
  });

  //Method menambahkan hewan ke dalam mobil
  void tambahMuatan(Hewan hewan){
    double beratMuatan = totalMuatan();
    if((beratMuatan+hewan.berat) <= kapasitas){
      muatan.add(hewan);
      print("${hewan.nama} berhasil dimasukkan! berat hewan tersebut adalah ${hewan.berat}");
    } else {
      print("Muatan sudah penuh! (kapasitas tidak cukup, ${hewan.nama} gagal dimasukkan ke mobil)");
    }
  }

  //Method menghitung berat muatan dalam Mobil
  double totalMuatan(){
    double totalMuatan = 0;
    for(int i=0;i<muatan.length;i++){
      totalMuatan = totalMuatan + muatan[i].berat;
    }
    return totalMuatan;
  }
}

void main(List<String> args) {
  print("\nSOAL PRIORITAS 1");
  print("Program memuat hewan ke dalam Mobil \n");

  //Membuat object mobil
  print("Masukkan kapasitas Mobil");
  double? kapasitas = double.tryParse(stdin.readLineSync()!);
  if (kapasitas == null){
    return print("Masukkan nilai yang sesuai!");
  }
  Mobil mobil = Mobil(kapasitas : kapasitas);

  //Membuat object-object hewan
  Hewan hewan1 = Hewan(nama : "Sapi", berat : 50);
  Hewan hewan2 = Hewan(nama: "Kucing", berat : 5);
  Hewan hewan3 = Hewan(nama : "Kambing", berat : 30);
  Hewan hewan4 = Hewan(nama : "Ayam", berat : 20);
  Hewan hewan5 = Hewan(berat : 10);

  //Menambahkan object-object hewan ke object Mobil yang dihitung berdasarkan beratnya
  mobil.tambahMuatan(hewan1);       //Total berat : 50
  mobil.tambahMuatan(hewan2);       //Total berat : 55
  mobil.tambahMuatan(hewan3);       //Total berat : 85
  mobil.tambahMuatan(hewan4);       //Total Berat : 105 (pada contoh kapasitas = 100, gagal dimasukkan)
  mobil.tambahMuatan(hewan5);       //Total Berat : 95

  //Menampilkan isi hewan di dalam Mobil
  print("\nisi dari Mobil tersebut adalah : ");
  for(int i = 0; i < mobil.muatan.length;i++){
    print("Muatan ${i+1} : ${mobil.muatan[i].nama} dengan berat ${mobil.muatan[i].berat}");
  }
  print("Dengan total berat Muatan : ${mobil.totalMuatan()}");
}