# Summary/Resume Minggu 7 (Flutter State Management Provider)

## Poin Pertama

Materi pada Minggu 7 pertemuan 1 membahas tentang State Management Provider. State merupakan keadaan suatu objek/sistem beserta dengan data-datanya yang dibaca dan digunakan pada saat melakukan pembuatan/build widget. Jika tidak menggunakan State Management apapun, biasanya digunakan sebuah Stateful Widget dengan method setState() untuk dapat memperbaharui Widget sesuai dengan data terbaru secara realtime.

Contoh penggunaan setState :

```dart
class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Counter Value:',
              ),
              Text(
                counter,
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _increment,
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

Stateful Widget dan method setState() terbilang kesulitan dalam mengatur state aplikasi apabila aplikasi yang dibuat sangat kompleks dan memiliki banyak perubahan data di banyak halaman. Oleh karena itu, diperlukan Global State Management untuk memudahkan widget-widget mengakses state yang sama.

## Poin Kedua

### Global State Management

Global State merupakan State yang bisa digunakan oleh seluruh widget pada aplikasi. Sehingga seluruh builder widget dapat mengakses dan memperbaharui berbagai bagian/komponen dalam aplikasi tanpa terkait langsung dengan hierarki class atau bagian-bagian tertentu dari code.

Global State Management merupakan package-package yang digunakan untuk membuat mengatur Global state.

Contoh Global State Management :

- Provider
- BLoC
- Cubit
- Riverpod
- getX
- Redux

## Poin Ketiga

### Provider

#### Pengertian Provider

Provider merupakan salah satu Global state management yang paling simple dan mudah dipelajari. Dengan menggunakan Provider, penggunaan setState yang berlebihan yang mengakibatkan rebuild yang tidak perlu pada widget-tree dapat dihindari, sehingga aplikasi akan lebih efisien dan cepat.

Class yang perlu diperhatikan dalam penggunaan Provider yaitu :

- ChangeNotifierProvider

  Merupakan widget yang membungkus sebuah class, memanfaatkan ChangeNotifier dan child untuk Widget UInya. Menyediakan dan mengelola instance dari class yang mengimplementasikan ChangeNotifier

- MultiProvider

  Memungkinkan untuk memakai beberapa provider secara bersamaan. Berguna ketika terdapat beberapa model atau instance yang perlu diakses oleh widget tertentu.

- Consumer

  Widget yang mendengarkan perubahan class yang mengimplementasikan ChangeNotifier, membuild ulang widget yang dibungkus saja, consumer harus diletakkan pada bagian terkecil komponen yang melakukan perubahan.

- ChangeNotifier (built-in Flutter SDK)

  Class yang menambah dan menghapus listeners, digunakan dengan extends, memberi tahu listeners ketika ada perubahan data dan harus melakukan build ulang (menggunakan notifylisteners().).

#### Cara Menggunakan Provider

1. Menambahkan Package Provider di pubspec.yaml pada bagian dependencies

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      provider: ^6.0.5
    ```

2. Mengimport Package provider pada semua file yang akan menggunakan Provider

    ```dart
    import 'package:provider/provider.dart';
    ```

3. Buat model data yang mengextend ChangeNotifier

    ```dart
    class MyModel with ChangeNotifier {
      // Definisikan state dan method untuk memperbarui state
    }
    ```

4. Menambahkan State Provider di file main dengan MultiProvider

    ```dart
    void main() {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => MyModel()),
          ],
          child: MyApp(),
        ),
      );
    }
    ```

5. Menggunakan State dari Provider -> Mengambil data Providermelalui getter (terdapat 2 cara yaitu menggunakan Provider.of() dan Consumer)

    ```dart

    //Contoh Consumer
    return Consumer<MyModel>(
      builder: (context, myModel, child) {
        // Gunakan data dari myModel di sini
      },
    );

    //Contoh Provider.of
    final myModel = Provider.of<MyModel>(context, listen: false);

    //Kalau ingin mengakses/mendapatkan data, pakai myModel.namaProperti

    ```
