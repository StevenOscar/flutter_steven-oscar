/*
SOAL : 

1. Buatlah rumus keliling dan luas persegi dan persegi panjang dengan menggunakan bahasa pemrograman Dart
2. Implementasikan rumus keliling dan luas dari Lingkaran dengan menggunakan Bahasa Dart

*/

void main() {
  double p = 20;
  double l = 13;
  const double pi = 3.14;
  double r = 28;

  double KPersegiPanjang, LPersegiPanjang, KLingkaran, LLingkaran;

  KPersegiPanjang = 2 * (p+l);
  LPersegiPanjang = p * l;

  KLingkaran = pi * 2 * r;
  LLingkaran = pi * r * r;

  print(KPersegiPanjang);
  print(LPersegiPanjang);
  print(KLingkaran);
  print(LLingkaran);
}