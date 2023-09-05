/*
SOAL :

1. Buatlah sebuah program berdasarkan class diagram berikut:
Kriteria dari program yang dibuat adalah sebagai berikut:

- Buat class beserta interface sesuai dengan class diagram diatas.
- Method `getArea()` digunakan untuk menghitung luas bangun datar.
- Method `getPerimeter()` digunakan untuk menghitung keliling bangun datar.
- Output yang harus ditampilkan adalah luas dan keliling untuk tiga bangun datar berdasarkan di class diagram.

*/

import 'dart:io';
import 'dart:math' as math;

abstract class Shape {
  int getArea();
  int getPerimeter();
}

class Circle implements Shape{
  int radius;

  Circle({
    required this.radius
  });

  @override
  int getArea() {
    return (math.pi * radius * radius).round().toInt();         //diubah menjadi int agar sesuai class diagram
  }

  @override
  int getPerimeter() {
    return (math.pi * 2 * radius).round().toInt();         //diubah menjadi int agar sesuai class diagram
  }
}

class Square extends Shape{
  int side;

  Square({
    required this.side
  });

  @override
  int getArea() {
    return side * side;
  }

  @override
  int getPerimeter() {
    return 4 * side;
  }
}

class Rectangle extends Shape{
  int width;
  int height;

  Rectangle({
    required this.width,
    required this.height
  });

  @override
  int getArea() {
    return width * height;
  }

  @override
  int getPerimeter() {
    return 2 * (width + height);
  }
}

void main(List<String> args) {
  print("\nSOAL EKSPLORASI");
  print("Program Menghitung Keliling dan Luas Bangun Datar dengan Class ");
  print("Pilih Bangun Datar : ");
  print("1. Lingkaran (Circle)");
  print("2. Persegi (Square)");
  print("3. Persegi Panjang (Rectangle)");

  int? n = int.tryParse(stdin.readLineSync()!);  //digunakan untuk pemilihan case
  if(n == null){       //null safety
    return print("Pilihan yang dimasukkan tidak valid!");
  }

  switch (n){

    case 1 :
      //Memasukkan nilai yang diperlukan untuk penghitungan Luas dan Keliling
      print("\nMasukkan nilai Jari-jari lingkaran : ");
      int? radius = int.tryParse(stdin.readLineSync()!);
      if(radius == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }

      //Membuat object lingkaran sesuai jari-jari yang diinput
      Shape lingkaran = Circle(radius : radius);

      //Memanggil Method getArea dan getPerimeter pada class Circle untuk melakukan penghitungan Luas dan Keliling
      print("\nLuas lingkaran dengan jari-jari $radius adalah : ${lingkaran.getArea()}");
      print("Keliling lingkaran dengan jari-jari $radius adalah : ${lingkaran.getPerimeter()}");
    break;

    case 2 :
      //Memasukkan nilai yang diperlukan untuk penghitungan Luas dan Keliling
      print("\nMasukkan nilai Sisi Persegi : ");
      int? side = int.tryParse(stdin.readLineSync()!);
      if(side == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }

      //Membuat object persegi sesuai dengan sisi yang diinput
      Shape persegi = Square(side : side);

      //Memanggil Method getArea dan getPerimeter pada class Square untuk melakukan penghitungan Luas dan Keliling
      print("\nLuas Persegi dengan sisi $side adalah : ${persegi.getArea()}");
      print("Keliling Persegi dengan sisi $side adalah : ${persegi.getPerimeter()}");
    break;

    case 3 :
      //Memasukkan nilai yang diperlukan untuk penghitungan Luas dan Keliling
      print("\nMasukkan nilai Panjang Persegi Panjang : ");
      int? width = int.tryParse(stdin.readLineSync()!);
      if(width == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }
      print("\nMasukkan nilai Lebar Persegi Panjang : ");
      int? height = int.tryParse(stdin.readLineSync()!);
      if(height == null){       //null safety
        return print("Masukkan nilai yang sesuai!");
      }

      //Membuat object persegiPanjang sesuai dengan panjang dan lebar yang diinput
      Shape persegiPanjang = Rectangle(width : width, height : height);

      //Memanggil Method getArea dan getPerimeter pada class Rectangle untuk melakukan penghitungan Luas dan Keliling
      print("\nLuas Persegi Panjang dengan panjang $width dan tinggi $height adalah : ${persegiPanjang.getArea()}");
      print("Keliling Persegi Panjang dengan panjang $width dan tinggi $height adalah : ${persegiPanjang.getPerimeter()}");
    break;

    default: print("Pilihan yang dimasukkan tidak valid!");
  }
}