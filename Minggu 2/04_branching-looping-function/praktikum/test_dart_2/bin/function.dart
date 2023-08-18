//function
void halo(){
  print("halo");
}

//function parameter
void tampil(String teks){
  print(teks);
}

//function return
int jumlah(int a, int b){
  return a+b;
}

void main(List<String> args) {
  halo();

  tampil("Halo");
  tampil("Selamat datang");

  var hasil = jumlah(1,2);
  print(hasil);

}