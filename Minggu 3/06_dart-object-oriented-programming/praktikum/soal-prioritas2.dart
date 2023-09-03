/*
SOAL :
1. Buatlah sebuah class Calculator dengan kriteria sebagai berikut:
    a. Terdapat method untuk melakukan penjumlahan dua bilangan.
    b. Terdapat method untuk melakukan pengurangan dua bilangan.
    c. Terdapat method untuk melakukan perkalian dua bilangan.
    d. Terdapat method untuk melakukan pembagian dua bilangan.

2. Buatlah sebuah class Course dan Student dengan kriteria sebagai berikut:
    a. Atribut dari Course terdiri dari judul dan deskripsi.
    b. Atribut dari Student terdiri dari nama, kelas dan daftar course yang dimiliki.
    c. Student dapat menambahkan course.
    d. Student dapat menghapus course.
    e. Student dapat melihat semua course yang telah ditambahkan.
*/

import 'dart:io';

class Calculator {
  double num1;
  double num2;

  Calculator (this.num1, this.num2);

  double addNumber(double num1, double num2){
    return num1 + num2;
  }

  double substractNumber(double num1, double num2){
    return num1 - num2;
  }

  double multiplyNumber(double num1, double num2){
    return num1 * num2;
  }

  double divideNumber(double num1, double num2){
    return num1 / num2;
  }
}

class Course {
  String judul;
  String deskripsi;

  Course ({
    required this.judul,
    this.deskripsi = ""
  });
}

class Student {
  String nama;
  String kelas;
  List<Course> listCourse = [];

  Student ({
    required this.nama,
    required this.kelas,
  });

  void addCourse(List<Course> allCourse){
    for(int i=0;i<allCourse.length;i++){
      print(allCourse[i].judul);
      print(allCourse[i].deskripsi);
    }
    int? n = int.tryParse(stdin.readLineSync()!);
    if (n == null){
      return print("Masukkan nilai yang sesuai!");
    }

    if(listCourse.contains(allCourse[n-1])){
      print("Course sudah ada");
    } else {
      listCourse.add(allCourse[n-1]);
    }
  }

  void deleteCourse(){
    print("Pilih course yang ingin dihapus : ");
    for(int i=0; i< listCourse.length;i++){
      print(listCourse[i].judul);
    }

    int? n = int.tryParse(stdin.readLineSync()!);
    if (n == null || n > listCourse.length){
      return print("Masukkan nilai yang sesuai!");
    }

    else if(listCourse.contains(listCourse[n-1])){
      listCourse.removeAt(n-1);
    } else {
      print("Course tersebut tidak ada");
    }
  }

  void viewCourse(){
    for(int i=0; i< listCourse.length;i++){
      print(listCourse[i].judul);
    }
  }
}

void main(List<String> args) {
  List<Course> allCourse = [];
  bool quit = false;

  Course course1 = Course(judul: "Course A", deskripsi: "bla bla bla");
  allCourse.add(course1);
  Course course2 = Course(judul: "Course B", deskripsi: "bla bla bla");
  allCourse.add(course2);
  Course course3 = Course(judul: "Course C", deskripsi: "bla bla bla");
  allCourse.add(course3);

  print("Masukkan nama anda : ");
  String? nama = stdin.readLineSync();
    if(nama == null){       //null safety
      return print("Masukkan pilihan yang sesuai!");
  }

  print("Masukkan kelas anda : ");
  String? kelas = stdin.readLineSync();
    if(kelas == null){       //null safety
      return print("Masukkan pilihan yang sesuai!");
  }

  Student student1 = Student(nama: nama, kelas: kelas);

  while(quit == false){
    print("\nPilih aksi yang ingin dilakukan : ");
    print("1. Add Course");
    print("2. Delete Course");
    print("3. View Course");
    print("4. Exit");

    int? n = int.tryParse(stdin.readLineSync()!);
    if(n == null){       //null safety
      return print("Masukkan pilihan yang sesuai!");
    }

    switch (n){
      case 1 :
        student1.addCourse(allCourse);
      break;
      case 2 :
        student1.deleteCourse();
      break;
      case 3 :
        student1.viewCourse();
      break;
      case 4 :
        quit = true;
      break;
    }
  }
}