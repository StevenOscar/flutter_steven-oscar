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

//Class Calculator untuk soal 1
class Calculator {
  double num1;
  double num2;

  Calculator ({this.num1 = 0, this.num2 = 0});

  //Method penjumlahan 2 bilangan
  void addNumber(){
    print("Hasil penjumlahan kedua bilangan tersebut adalah ${num1+num2}");
  }

  //Method pengurangan 2 bilangan
  void substractNumber(){
    print("Hasil pengurangan kedua bilangan tersebut adalah ${num1-num2}");
  }

  //Method perkalian 2 bilangan
  void multiplyNumber(){
    print("Hasil perkalian kedua bilangan tersebut adalah ${num1*num2}");
  }

  //Method pembagian 2 bilangan
  void divideNumber(){
    if(num2 != 0){
      print("Hasil pembagian kedua bilangan tersebut adalah ${num1/num2}");
    } else {
      print("tidak bisa membagi dengan angka nol!");
    }
  }
}

//Class Course dan Student untuk soal nomor 2
class Course {                  //Class course merepresentasikan semua course yang dapat diambil oleh Student
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
  List<Course> listCourse = [];       //Menampung course yang diambil oleh Student

  Student ({
    required this.nama,
    required this.kelas,
  });

  //Method menambahkan course ke listCourse
  void addCourse(List<Course> allCourse){
    //Menampilkan seluruh Course yang bisa diambil (menampilkan allCourse)
    print("\nPilih kelas yang ingin anda tambahkan : ");
    for(int i=0;i<allCourse.length;i++){
      stdout.write("${i+1}. ${allCourse[i].judul} : \nDeskripsi : ${allCourse[i].deskripsi}\n");
    }
    int? n = int.tryParse(stdin.readLineSync()!);       //digunakan untuk pemilihan
    if (n == null){
      return print("Masukkan nilai yang sesuai!");
    }

    if(listCourse.contains(allCourse[n-1])){
      print("Course sudah ada");
    } else {
      listCourse.add(allCourse[n-1]);
    }
  }

  //Method menghapus course dari listCourse
  void deleteCourse(){
    if(listCourse.length == 0){
      print("Tidak ada course yang bisa dihapus!");
    } else {
      print("Pilih course yang ingin dihapus : ");
      for(int i=0; i< listCourse.length;i++){
        print("${i+1}. ${listCourse[i].judul}");
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
  }

  //Menampilkan seluruh course yang sudah diambil oleh Student (menampilkan listCourse)
  void viewCourse(){
    print("List Course yang sudah diambil : ");
    if(listCourse.length==0){
      print("Tidak ada course yang diambil");
    } else {
      for(int i=0; i< listCourse.length;i++){
        print("${i+1}. ${listCourse[i].judul}");
      }
    }
  }
}

void main(List<String> args) {
  print("SOAL PRIORITAS 2");
  print("Pilih Soal : ");
  print("1. Kalkulator 2 bilangan");
  print("2. Class Course dan Student");

  int? n = int.tryParse(stdin.readLineSync()!);   //digunakan untuk pemilihan case
  if(n == null){      //null safety
    return print("Pilihan yang dimasukkan tidak valid!");
  }

  switch (n) {
    //Case 1 : Program kalkulator 2 bilangan
    case 1:
      print("Masukkan angka pertama : ");
      double num1 = double.tryParse(stdin.readLineSync()!)!;
      print("Masukkan angka kedua : ");
      double num2 = double.tryParse(stdin.readLineSync()!)!;

      Calculator calculator = Calculator(num1 : num1, num2 : num2);

      calculator.addNumber();
      calculator.substractNumber();
      calculator.multiplyNumber();
      calculator.divideNumber();
    break;

    //Case 2 : Program class Student dan Course
    case 2 :
      List<Course> allCourse = [];    //untuk menampung seluruh course yang bisa diambil oleh Student
      bool quit = false;    //untuk parameter keluar dari loop while

      //Membuat seluruh object Course (contoh : 5 Course) dan menambahkan Course tersebut ke list allCourse
      Course course1 = Course(
        judul: "Fundamental Front-End Engineer with React",
        deskripsi: "React JS adalah library Javascript buatan Facebook yang berdiri pada tahun 2013. React JS ini mampu menggunakan komponen yang telah digunakan oleh aplikasi yang lain dengan menggunakan fungsi yang sama. Sehingga, pastinya memudahkan, menghemat waktu, dan meminimalisir kesalahan yang ada."
      );
      Course course2 = Course(
        judul: "Fundamental Quality Engineer",
        deskripsi: "Quality engineer adalah sebuah proses atau prosedur yang secara sistematis memantau berbagai aspek fasilitas hingga layanan. Biasanya quality engineer ini melakukan audit atau penilaian untuk mendeteksi, memperbaiki masalah pada bagian yang berada di luar standar yang ditetapkan."
      );
      Course course3 = Course(
        judul: "Fundamental UI/UX Designer",
        deskripsi: "Memiliki UI yang terintegrasi dan harmonis atau UX dalam aplikasi seluler tidak hanya membantu bisnis untuk menarik lebih banyak pengguna tetapi juga meningkatkan kepuasan pelanggan."
      );
      Course course4 = Course(
        judul: "Complete Front-End Engineer Career with Flutter",
        deskripsi: "Flutter adalah framework aplikasi mobile yang open source dikembangkan oleh Google di tahun 2018. Framework ini banyak digunakan oleh Google, Ebay, Grab dan sebagainya."
      );
      Course course5 = Course(
        judul: "Mastering Front-End Development with Vue JS",
        deskripsi: "Vue JS adalah framework javascript yang dibuat untuk mengembankan tampilan UI (User Interface) agar lebih menarik. Vue JS ini diciptakan pada tahun 2013 dan banyak perusahaan yang menggunakannya seperti Alibaba, Xiaomi, Reuters, dan lain-lain."
      );

      allCourse.add(course1);
      allCourse.add(course2);
      allCourse.add(course3);
      allCourse.add(course4);
      allCourse.add(course5);


      //Mengisi data untuk object Student dan membuat object Student1
      print("Masukkan nama anda : ");
      String? nama = stdin.readLineSync();
      if(nama == null){       //null safety
        return print("Masukkan nama yang sesuai!");
      }
      print("Masukkan kelas anda : ");
      String? kelas = stdin.readLineSync();
      if(kelas == null){       //null safety
        return print("Masukkan kelas yang sesuai!");
      }

      Student student1 = Student(nama: nama, kelas: kelas);
      print("\nBerhasil!! Berikut data anda : ");
      print("Nama : ${student1.nama}");
      print("Kelas : ${student1.kelas}");


      // Melakukan loop untuk pemilihan terus menerus selama belum exit/quit
      while(quit == false){
        print("\nPilih aksi yang ingin dilakukan : ");
        print("1. Add Course");
        print("2. Delete Course");
        print("3. View Course");
        print("4. Exit");

        int? n = int.tryParse(stdin.readLineSync()!);  //digunakan untuk pemilihan case
        if(n == null){       //null safety
          return print("Pilihan yang dimasukkan tidak valid!");
        }

        switch (n){
          case 1 :
            student1.addCourse(allCourse);      //menambahkan course
          break;
          case 2 :
            student1.deleteCourse();            //menghapus course
          break;
          case 3 :
            student1.viewCourse();              //melihat course yang sudah ditambah
          break;
          case 4 :
            quit = true;
          break;
          default: print("Pilihan yang dimasukkan tidak valid!");
        }
      }
    break;
  }
}