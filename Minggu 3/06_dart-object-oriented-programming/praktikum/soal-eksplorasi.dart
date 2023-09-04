/*
SOAL :

1. Sebuah toko buku ingin mengembangkan sebuah sistem untuk mengelola data buku. Data buku tersebut terdiri dari ID, judul, penerbit, harga dan kategori. Sistem tersebut dapat menambahkan, mendapatkan semua data buku dan menghapus data buku. Buatlah program berdasarkan skenario tersebut.
*/

import 'dart:io';

class Book {
  int ID;
  String judul;
  String penerbit;
  int harga;
  String kategori;

  Book ({
    required this.ID,
    required this.judul,
    required this.penerbit,
    required this.harga,
    required this.kategori
  });
}

class Bookstore {
  List<Book> bookList = [];

  //Method menambahkan data buku
  void addBook(){
    //Mengisi data sesuai dengan properti buku
    print("Masukkan ID buku : ");
    int? ID = int.tryParse(stdin.readLineSync()!);
    if(ID == null){       //null safety
      return print("Masukkan ID yang sesuai!");
    }
    print("Masukkan judul buku : ");
    String? judul = stdin.readLineSync();
    if(judul == null){       //null safety
      return print("Masukkan judul yang sesuai!");
    };
    print("Masukkan nama penerbit buku : ");
    String? penerbit = stdin.readLineSync();
    if(penerbit == null){       //null safety
      return print("Masukkan nama penerbit yang sesuai!");
    };
    print("Masukkan harga buku : ");
    int? harga = int.tryParse(stdin.readLineSync()!);
    if(harga == null){       //null safety
      return print("Masukkan harga yang sesuai!");
    }
    print("Masukkan kategori buku : ");
    String? kategori = stdin.readLineSync();
    if(kategori == null){       //null safety
      return print("Masukkan kategori yang sesuai!");
    };

    //Memasukkan seluruh data yang sudah diinput ke dalam bookList
    bookList.add(Book(
      ID: ID,
      judul: judul,
      penerbit: penerbit,
      harga: harga,
      kategori: kategori
    ));
  }

  //Method untuk menghapus data buku
  void deleteBook(){
    //Menghapus data buku berdasarkan ID buku
    print("Pilih ID Buku yang ingin dihapus dari toko: ");
    for(int i=0; i< bookList.length;i++){
      print("ID = ${bookList[i].ID}, Judul : ${bookList[i].judul}");
    }

    int? n = int.tryParse(stdin.readLineSync()!);
    if (n == null){
      return print("Masukkan ID yang sesuai!");
    }
    for(int i = 0; i< bookList.length; i++){
      if(bookList[i].ID == n){
        bookList.remove(bookList[i]);
        print("Buku dengan ID = ${n} sudah terhapus");
      }
    }
  }

  //Method untuk melihat seluruh data buku
  void viewBook(){
    if(bookList.length == 0 ){
      print("\nTidak ada buku di toko!");
    } else {
      for (int i = 0; i < bookList.length; i++) {
        print("\nID: ${bookList[i].ID}, Judul: ${bookList[i].judul}, Penerbit: ${bookList[i].penerbit}, Harga: ${bookList[i].harga}, Kategori: ${bookList[i].kategori}");
      }
    }
  }
}

void main(List<String> args) {
  Bookstore store = Bookstore();;
  bool quit = false;

  //Sebagai buku-buku awal


  // Melakukan loop untuk pemilihan terus menerus selama belum exit/quit
  while (quit == false ){
    print("\nSOAL EKSPLORASI");
    print("Program toko Buku \n");
    print("Pilih aksi yang ingin dilakukan : ");
    print("1. Menambahkan Buku");
    print("2. Menghapus Buku");
    print("3. Melihat semua data Buku");
    print("4. Keluar");

    int? n = int.tryParse(stdin.readLineSync()!);  //digunakan untuk pemilihan case
    if(n == null){       //null safety
      return print("Pilihan yang dimasukkan tidak valid!");
    }

    switch (n){
      case 1 :
        store.addBook();      //Menambahkan Buku ke toko
      break;
      case 2 :
        store.deleteBook();   //Menghapus Buku di toko
      break;
      case 3 :
        store.viewBook();     //Melihat Buku yang sudah ditambah ke toko
      break;
      case 4 :
        quit = true;
      break;
      default: print("Pilihan yang dimasukkan tidak valid!");
    }
  }
}

/* Contoh data Buku yang bisa diinput :
    ID: 1,
    judul: "Atomic Habits Edisi Hardcover",
    penerbit: "Gramedia Pustaka Utama",
    harga: 108000,
    kategori: "Nonfiksi"

    ID: 2,
    judul: "Jujutsu Kaisen 05",
    penerbit: "Elex Media Komputindo",
    harga: 40000,
    kategori: "Fiksi"

    ID: 3,
    judul: "The Secret : Rahasia",
    penerbit: "Gramedia Pustaka Utama",
    harga: 93500,
    kategori: "Nonfiksi"

    ID: 4,
    judul: "Sang Alkemis",
    penerbit: "Gramedia Pustaka Utama",
    harga: 55250,
    kategori: "Nonfiksi"
*/