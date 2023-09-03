/*
SOAL :

1. buatlah sebuah class dengan ketentuan dibawah ini

2. Selanjutnya pada class Mobil, tambahkan method totalMuatan untuk menghitung total muatan yang diangkut oleh mobil tersebut!

*/

class Hewan {
  double berat;
  String nama;

  Hewan ({
    required this.berat,
    this.nama = "Hewan tanpa nama"
  });
}

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil ({
    required this.kapasitas
  });

  void tambahMuatan(Hewan hewan){
    double beratMuatan = totalMuatan();
    if((beratMuatan+hewan.berat) <= kapasitas){
      muatan.add(hewan);
      print("${hewan.nama} berhasil dimasukkan! berat hewan tersebut adalah ${hewan.berat}");
    } else {
      print("Muatan sudah penuh! (kapasitas tidak cukup, ${hewan.nama} gagal dimasukkan ke mobil)");
    }
  }

  double totalMuatan(){
    double totalMuatan = 0;
    for(int i=0;i<muatan.length;i++){
      totalMuatan = totalMuatan + muatan[i].berat;
    }
    return totalMuatan;
  }
}



void main(List<String> args) {
  Mobil truk = Mobil(kapasitas : 100);

  Hewan hewan1 = Hewan(nama : "Sapi", berat : 50);
  Hewan hewan2 = Hewan(nama: "Kucing", berat : 5);
  Hewan hewan3 = Hewan(nama : "Kambing", berat : 30);
  Hewan hewan4 = Hewan(nama : "Ayam", berat : 20);
  Hewan hewan5 = Hewan(berat : 10);

  truk.tambahMuatan(hewan1);
  truk.tambahMuatan(hewan2);
  truk.tambahMuatan(hewan3);
  truk.tambahMuatan(hewan4);
  truk.tambahMuatan(hewan5);

  print("\nisi dari Mobil tersebut adalah : ");
  for(int i = 0; i < truk.muatan.length;i++){
    print("Muatan ${i+1} : ${truk.muatan[i].nama} dengan berat ${truk.muatan[i].berat}");
  }
  print("Dengan total berat Muatan : ${truk.totalMuatan()}");
}