# Summary/Resume Minggu 3 (Introduction Flutter Widget)

## Poin Pertama

Pertemuan pada Minggu 3 pertemuan 3 membahas tentang Introduction Flutter and Flutter Widget.

### Flutter

Flutter adalah alat pengembangan User Interface Cross-platform yang dikembangkan oleh Google yang bisa digunakan untuk mendevelop aplikasi mobile, desktop, dan web (Pada saat ini lebih populer dalam pengembangan aplikasi mobile). Flutter terbagi menjadi 2 bagian, yaitu : Flutter SDK untuk membantu proses pengembangan aplikasi, dan Flutter framework yang digunakan untuk membentuk aplikasi yang dapat di customize.

### Keunggulan Flutter

- Mudah digunakan dan dipelajari : Flutter menggunakan bahasa pemrograman Dart yang relatif mudah dipelajari dan menyediakan widget-widget yang mampu mempermudah pembuatan UI aplikasi.
- Produktivitas tinggi : Flutter memiliki fitur Hot Reload yang membolehkan kita untuk melihat perubahan aplikasi secara langsung dan realtime tanpa melakukan compile ulang. Selain itu, Flutter juga menggunakan single codebase yang memungkinkan aplikasi digunakan dalam berbagai platform sekaligus sehingga mampu mengurangi waktu dan resource pengembangan aplikasi.
- Dokumentasi lengkap : Flutter memiliki dokumentasi yang lengkap pada website [docs.flutter.dev](docs.flutter.dev). Di website tersebut kita dapat melihat tutorial penggunaan widget dan contoh code yang bisa digunakan.

- Komunitas yang berkembang : Komunitas flutter berkembang seiring dengan kepopuleran bahasa ini. Terdapat banyak developer yang membagikan resource dan packages mereka melalui website [pub.dev](pub.dev) yang bisa memudahkan kita dalam mengembangkan aplikasi (karena tidak perlu repot-repot membangun aplikasi dari nol).

## Poin Kedua

### Project Flutter

#### - Membuat Project Flutter

Ketika ingin membuat project flutter, kita bisa menjalankan perintah dibawah ini menggunakan terminal (atau bisa juga menggunakan command pallete di VS Code dengan shortcut Ctrl+Shift+p lalu pilih flutter:New Project -> Application)

``` cmd
flutter create <nama_project>
```

#### - Menjalankan Project Flutter

Ketika ingin menjalankan project flutter, jalankan perintah dibawah ini di directory project :

``` cmd
flutter run
```

#### - Struktur Project Flutter

Struktur Project Flutter terdiri dari : platform directory (android, ios, macos, linux, web, windows) dan project directory (build untuk mem-build aplikasi, test untuk pengujian, lib untuk ruang kerja utama). Terdapat pula tambahan file lainnya seperti README.md, pubspec, gitignore, dll.

#### - File utama

File utama merupakan file yang pertama kali dibaca dan dijalankan. File ini berada dalam directory lib. Secara default, file ini bernama main.dart dan memiliki fungsi main.

## Poin Ketiga

### Widget

Widget digunakan untuk membuat UI. Widget ini berupa class dan biasanya dapat menampung berbagai widget lainnya, sehingga dapat disimpulkan Widget memiliki konsep seperti hirarki/tree.

### Stateless dan Stateful Widget

#### - Stateless Widget

Stateless Widget adalah komponen UI yang hanya berfokus pada tampilan dan tidak bergantung pada perubahan data (bersifat statis). Stateless Widget dibuat dengan melakukan extends pada class StatelessWidget. Contoh Stateless Widget pada default flutter project :

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

#### Stateful Widget

Stateful Widget adalah komponen UI yang memiliki state internal yang dapat berubah selama aplikasi berjalan. Stateful Widget memungkinkan user untuk berinteraksi secara dinamis. Stateful widget dibuat dengan melakukan extends pada class StatefulWidget. Stateful Widget memiliki 2 class terpisah yaitu Widget dan State. Contoh Stateful Widget pada default flutter project :

``` dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### Built-in Widget

Built-in Widget merupakan widget-widget yang dapat langsung digunakan dan sudah terinstall bersama dengan Flutter secara default. Widget-widget ini memudahkan kita karena tidak perlu membuat komponen secara custom dari awal.

Contoh Built-in Widget :

#### - MaterialApp

Widget ini digunakan untuk membuat aplikasi sesuai dengan desain dari Material Design pada library material.dart. Contoh :

```dart
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: const MyHomePage(title: 'Flutter Demo Home Page')
);
```

#### - Scaffold

Widget ini digunakan untuk membentuk sebuah halaman. Scaffold digunakan untuk membungkus widget-widget lainnya. Contoh :

```dart
Scaffold(
  appBar: AppBar(
    title: Text(widget.title),
  ),
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'You have pushed the button this many times:',
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    ),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: _incrementCounter,
    tooltip: 'Increment',
    child: const Icon(Icons.add),
  ),
);
```

#### - AppBar

AppBar merupakan Widget yang digunakan untuk membuat application bar yang terletak pada bagian atas halaman. Contoh :

```dart
AppBar(
  title: Text('Contoh AppBar'),
  backgroundColor: Colors.blue,
)
```

#### - Text

Text merupakan Widget yang digunakan untuk menampilkan teks. Text juga dapat dihias dengan berbagai Style (warna, font, ukuran, italic, bold, underline, dsb). Contoh :

```dart
Text('Styling Text',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold, font
    color: Colors.blue,
    fontStyle: FontStyle.italic,
    decoration: TextDecoration.underline,
    letterSpacing: 2.0
  )
),
```
