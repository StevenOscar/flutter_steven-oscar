# Summary/Resume Minggu 3 (Deep Dive into Dart Object Oriented Programming)

## Poin Dart OOP Lanjutan

Pertemuan pada Minggu 3 pertemuan 2 membahas tentang Dart Object Oriented Programming (Lanjutan). Pada materi ini, terdapat beberapa poin yaitu mengenai Constructor, Inheritance, Method Overriding, Interface, Abstract Class, Polymorphism, Generics, dan Enkapsulasi.

### Constructor

Constuctor merupakan fungsi yang dijalankan ketika object dibuat/diinisiaslisasi sehingga kita dapat memberikan nilai awal ke dalam objek tersebut saat objek tersebut dibuat. Constructor dibuat dengan nama yang sama dengan nama class tersebut. Constructor dapat diinisalisasi dengan parameter maupun tidak.

### Inheritance

Inheritance/pewarisan adalah konsep di mana Class dapat mewarisi property dan method dari Class lainnya (Class parentnya). Dalam Dart, untuk menggunakan inheritance maka kita menambahkan kata kunci 'extends' pada class yang dibuat.

### Method Overriding

Method overriding adalah mengganti perintah yang ada di metode di superclass dengan perintah yang berbeda di subclass. Method overriding bisa dilakukan pada class yang melakukan inheritance dengan menggunakan kata kunci '@override'.

### Interface

Interface memiliki konsep yang mirip dengan Inheritance menggunakan 'extends' namun pada interface, seluruh method parent wajib di @override. Interface diimplementasikan dengan menggunakan kata kunci 'implements' pada class yang dibuat.

### Abstract Class

Abstract Class merupakan class yang tidak bisa dibuat menjadi objek. Class ini berguna untuk menggambarkan framework dan kontrak kerja bagi child classnya dengan menunjukan method yang ada.

### Polymorphism

Polymorphism adalah konsep di mana objek dari Class yang berbeda dapat digunakan dengan cara yang sama (data dapat dirubah menjadi bentuk lain). Polymorphism memungkinkan fleksibilitas dalam kode dengan memungkinkan penggunaan Parent class untuk merujuk pada Child class.

### Generic

Generic adalah fitur untuk membuat Class atau fungsi yang dapat digunakan dengan berbagai jenis tipe data tanpa perlu menulis kode yang sama berulang kali.

### Enkapsulasi

Enkapsulasi adalah teknik untuk pembungkusan/penyembunyian data dari satu class dengan class lainnya. Enkapsulasi berguna untuk meningkatkan integritas data dan mempermudah perubahan kode. Dalam enkapsulasi Dart, terdapat access modifier yang dapat digunakan yaitu public dan private. Properti private dapat diakses menggunakan Getter dan dapat diubah dengan menggunakan Setter.
