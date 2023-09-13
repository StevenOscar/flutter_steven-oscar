# Summary/Resume Minggu 4 (Platform Widget)

## Poin Pertama

Pertemuan pada Minggu 4 pertemuan 2 membahas tentang Platform Widget. Platform Widget terdiri dari Material Design dan Cupertino Design. 2 design ini memiliki template design yang berbeda, Material design biasanya digunakan oleh aplikasi pada platform Android, sedangkan Cupertino design digunakan oleh aplikasi pada platform iOS.

## Poin Kedua

### MaterialApp

MaterialApp merupakan Widget yang digunakan apabila ingin membuat aplikasi berdasarkan template Material design (biasanya digunakan pada aplikasi Android). MaterialApp akan mengemas seluruh widget pada aplikasi yang dibuat. Untuk dapat menggunakan MaterialApp, tuliskan "```import 'package:flutter/material.dart```".

Pada MaterialApp, terdapat properti home yang menunjukan class yang akan dijalankan pertama kali, Theme yang digunakan untuk mengatur tema, title untuk menulis judul aplikasi,dll.

```dart
MaterialApp(
    title: 'Material App',
    theme: ThemeData.dark(),
    home : HomePage()
),
```

Selain cara diatas, terdapat cara lainnya untuk navigasi menggunakan routes dan initialRoute.

```dart
MaterialApp(
    title: 'Material App',
    theme: ThemeData.dark(),
    initialRoute: '/',
    routes: {
      '/': () => HomePage(),
      '/setting': () => Settings(),
    },
);
```

Seluruh Widget Material dapat dilihat pada :

<https://docs.flutter.dev/ui/widgets/material>

<https://api.flutter.dev/flutter/material/material-library.html>

### Scaffold

Scaffold merupakan widget dasar untuk membuat sebuah halaman pada MaterialApp. Scaffold dapat diibaratkan seperti "tanah" pada sebuah bangunan yang digunakan untuk menempatkan element UI lainnya seperti appBar, Drawer, BottomNavigationBar,dll.

Contoh properti Scaffold :

#### - AppBar

AppBar digunakan untuk membuat tampilan bar pada bagian atas aplikasi. Pada bagian ini dapat dihias dengan judul, backgroundColor, iconButton, dll.

```dart
AppBar(
  backgroundColor: const Color(0xFF6200EE),
  centerTitle: true,
  elevation: 0,
  title: const Text("My Flutter App"),
  actions: [
    IconButton(
    onPressed: () {},
    icon: const Icon(Icons.search,
    color: Colors.white70,)
    )
  ],
)
```

#### - body

Body merupakan tempat utama untuk menaruh isi konten dari aplikasi yang dibuat. Body memiliki banyak sekali widget-widget yang bisa digunakan secara fleksibel.

```dart
body : const Center(
 child: Text("Nama saya adalah Steven Oscar"),
)
```

#### - drawer

Drawer merupakan bagian yang digunakan untuk membuat menu navigasi pada bagian samping halaman.

```dart
drawer: Drawer(
 child: ListView(
  children: const [
   ListTile(
     title : Text("Home"),
   ),
   ListTile(
     title : Text("Settings"),
   )
  ],
 ),
)
```

#### - bottomNavigationBar

BottomNavigationBar digunakan untuk membuat menu navigasi pada bagian bawah halaman.

```dart
bottomNavigationBar: BottomNavigationBar(
 items: const [
   BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: "Home"
   ),
   BottomNavigationBarItem(
    icon: Icon(Icons.settings),
    label: "Settings"
   ),
 ],
)
```

#### - floatingActionButton

FloatingActionButton merupakan sebuah tombol yang secara default terletak di bagian kanan bawah layar, diatas bottom navigation bar. FloatingActionButton dapat melakukan sesuatu apabila kita memberikan perintah pada properti onPressed.

```dart
floatingActionButton: FloatingActionButton(
 onPressed: () {},
 backgroundColor: const Color(0xFF03DAC5),
 child: const Icon(Icons.add, color: Colors.black)
),
```

## Poin Ketiga

### CupertinoApp

cupertinoApp merupakan Widget yang digunakan apabila ingin membuat aplikasi berdasarkan template Cupertino design (biasanya digunakan pada aplikasi iOS). CupertinoApp akan mengemas seluruh widget pada aplikasi yang dibuat. Untuk dapat menggunakan MaterialApp, tuliskan "```import 'package:flutter/cupertino.dart```".

Pada CupertinoApp, sama seperti MaterialApp, terdapat properti home yang menunjukan class yang akan dijalankan pertama kali, Theme yang digunakan untuk mengatur tema (Untuk mengatur tema dark mode sedikit berbeda dari MaterialApp karena Cupertino tidak menyediakan ThemeData.dark), title untuk menulis judul aplikasi,dll.

```dart
CupertinoApp(
    title: 'Cupertino App',
    theme: CupertinoThemeData.raw(Brightness.dark, null, null, null, null, null),
    home : HomePage()
),
```

Seluruh Widget Cupertino dapat dilihat pada :

<https://docs.flutter.dev/ui/widgets/cupertino>

<https://api.flutter.dev/flutter/cupertino/cupertino-library.html>

### CupertinoPageScaffold

CupertinoPageScaffold merupakan widget dasar untuk membuat sebuah halaman pada CupertinoApp. CupertinoPageScaffold memiliki prinsip yang sama dengan Scaffold pada material, namun memiliki perbedaan design yang cukup signifikan. Contohnya pada Scaffold, terdapat properti bottomNavigationBar untuk membuat navigation bar pada bagian bawah, sedangkan dalam CupertinoPageScaffold digunakan properti navigationBar untuk membuat navigation bar pada bagian atas halaman.

```dart
CupertinoPageScaffold(
 navigationBar: CupertinoNavigationBar(
  middle : Text("CupertinoApp"),
 ),
 child: Center(
  child: Text("This is CupertinoApp"),
 )
);
```
