/*
SOAL : 

1. Buat 3 buah variabel yang menampung tipe data String, lalu sambungkan 3 variabel tersebut dan tampilkan pada layar.
2. Implementasikan rumus volume dari tabung (silinder) dengan menggunakan Bahasa Dart.

*/

void main() {
  String variabel1 = "Saya";
  String variabel2 = "Steven"; 
  String variabel3 = "Oscar";

  const double pi = 3.14;
  double r = 28;
  double h = 10;

  double VSilinder = pi * r * r * h;


  print("$variabel1 $variabel2 $variabel3");
  print(VSilinder);

}