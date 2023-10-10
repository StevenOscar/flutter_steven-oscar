# Summary/Resume Minggu 7 (Flutter State Management BLoC)

## Poin Pertama

Materi pada Minggu 7 pertemuan 2 membahas tentang State Management BLoC. BLoC merupakan salah satu Global State Management yang lebih Advance dibandingkan dengan Provider. Pada dasarnya, BLoC memiliki 3 buah file yang saling berkaitan yaitu event (mengatur interkasi/kejadian/trigger tertentu), state (mengatur state dan data output), dan bloc (mengatur logic aplikasi yang digunakan untuk memperbaharui state).

Sebelum masuk ke pembahasan lebih dalam mengenai BLoC, perlu dijelaskan dahulu mengenai apa itu Declarative UI dan state.

### Declarative UI dan State

Declarative UI merupakan konsep dalam flutter dimana UI pada screen akan dibangun untuk mencerminkan keadaan state saat ini.

State merupakan keadaan ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori. State sangat penting karena memungkinkan suatu aplikasi untuk dapat merespons interaksi pengguna, melakukan perubahan data dan kondisi lainnya. Karena flutter menerapkan Declarative UI, maka flutter dapat membangun ulang UI ketika ada state atau data yang berubah.

Terdapat 2 jenis State dalam flutter, yaitu :

- Ephemeral State

  Ephemeral State merupakan state yang bersifat lokal yang artinya tidak ada bagian lain pada widget tree yang membutuhkan untuk mengakses ephemeral state ini. Ephemeral State bersifat sementara karena akan hilang ketika state tersebut tidak diperlukan (misal ketika berpindah ke halaman lain yang memiliki state berbeda).

  Bila aplikasi hanya menggunakan Ephemeral State, maka tidak perlu membuat state management yang kompleks, hanya membutuhkan StatefulWidget dan fungsi setState() untuk melakukan perubahan state.

  Contoh Ephemeral State :
  - PageView
  - BottomNavigationBar
  - Switch button

- App State

  AppState merupakan state yang bersifat global yang artinya state ini ini dapat mencakup data yang harus diakses dan dikelola oleh berbagai bagian dari aplikasi.

  Untuk mengatur App State, digunakan pendekatan global state management, contohnya dengan Provider, BLoC, Cubit,dsb.

  Contoh App State :
  - Login Info
  - Preference Setting User
  - Keranjang Belanja yang muncul di banyak screen

## Poin Kedua

### Provider

( NOTE : Penjelasan mengenai Provider dibawah ini sama dengan penjelasan Provider pada summary materi sebelumnya )

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

5. Menggunakan State dari Provider -> Mengambil data Provider melalui getter (terdapat 2 cara yaitu menggunakan Provider.of() dan Consumer)

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

## Poin Ketiga

### BLoC (Business Logic Component)

#### Pengertian BLoC

BLoC merupakan State Management yang memisahkan Business Logic dan User Interface.

BLoC banyak digunakan karena :

- Simple : Membuat code menjadi lebih simple dan terorganisir
- Powerful : BLoC mampu mengelola global state dengan baik, terutama apabila menangani data asinkron eksternal yang didapat dari API.
- Testable : Karena UI sudah dipisahkan dengan Business logicnya, maka akan lebih mudah apabila ingin melakukan testing pada code. Bila dibutuhkan perubahan pada salah satu komponen, maka hanya tinggal merubah bagian komponen tersebut.

#### Cara Kerja BLoC

Seperti pada penjelasan sebelumnya, BLoC melibatkan 3 komponen utama,yaitu :

1. Event

    Event merupakan kommponen yang merepresentasikan kejadian/interaksi yang dapat terjadi/dilakukan pada aplikasi. Setiap event yang dipicu/ditrigger oleh pengguna akan diproses oleh BLoC, dan hasil pemrosesan tersebut dapat menyebabkan perubahan pada state.

2. State

    State merupakan komponen yang merepresentasikan keadaan aplikasi pada waktu tertentu. State dalam BLoC bertugas untuk mengatur bagaimana UI harus terlihat berdasarkan event yang terjadi. Saat event diproses oleh BLoC, state dapat berubah, dan UI diperbarui sesuai dengan perubahan tersebut.

3. BLoC

    BLoC merupakan komponen yang bertugas untuk mengelola logika bisnis aplikasi. BLoC berfungsi sebagai perantara yang menjembatani Event dan State. Ketika suatu event terjadi, BLoC akan memproses event tersebut. Berdasarkan event, BLoC dapat memodifikasi state yang sesuai. State yang sudah diperbarui kemudian diumumkan ke UI untuk di rebuild.

BLoC menggunakan Stream sebagai actor utama. Stream merupakan aliran data yang dapat dikirim dan diterima secara asynchronous. Stream memungkinkan Listener untuk dapat menerima data ketika terdapat data baru pada aliran tersebut.

#### Cara Menggunakan BLoC

1. Menambahkan Package flutter_bloc dan equatable di pubspec.yaml pada bagian dependencies, setelah itu lakukan `flutter pub get`

    ```yaml
    dependencies:
      flutter:
        sdk: flutter
      flutter_bloc: ^8.1.3
      equatable: ^2.0.5
    ```

2. Membuat Folder BLoC menggunakan extension BLoC pada VSCode/Android Studio, bisa dibuat secara manual juga dengan name file : (filename)_bloc, (filename)_event, (filename)_state

3. Mendefinisikan Event yang dapat terjadi pada aplikasi

    ```dart
    // file: counter_event.dart
    abstract class CounterEvent extends Equatable{
      const CounterEvent();

      @override
      List<Object> get props => [];
    }

    class Increment extends CounterEvent {}

    class Decrement extends CounterEvent {}
    ```

4. Mendefinisikan State yang akan dihasilkan oleh BLoC

    ```dart
    // file: counter_state.dart
    class CounterState extends Equatable {
      int value = 0;
      CounterState(this.value);

      @override
      List<Object> get props => [value];
    }
    ```

5. Mendefinisikan logika bisnis pada BLoC

    ```dart
    // file: counter_bloc.dart
    import 'dart:async';
    import 'package:bloc/bloc.dart';
    import './counter_event.dart';
    import './counter_state.dart';

    class CounterBloc extends Bloc<CounterEvent, CounterState> {
      CounterBloc() : super(CounterState(0)) {
        on<Increment>((event,emit)) => emit(CounterState(state.value + 1));
        on<Decrement>((event,emit)) => emit(CounterState(state.value - 1));
      }
    }
    ```

6. Mendaftarkan BLoC tersebut di file main dengan MultiBlocProvider

    ```dart
    class MyApp extends StatelessWidget {
      const MyApp({super.key});

      @override
      Widget build(BuildContext context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
          child: MaterialApp();
          ]
        )
      }
    }
    ```

7. Mengimport Package flutter_bloc pada semua file yang akan menggunakan BLoC

    ```dart
    import 'package:flutter_bloc/flutter_bloc.dart';
    ```

8. Menggunakan BLoC yang sudah dibuat ke dalam Widget yang membutuhkannya. (bisa menggunakan BlocBuilder jika ingin merebuild bila ada perubahan atau menggunakan context.read() agar tidak melakukan rebuild)

    ```dart
    //Contoh BlocBuilder
    BlocBuilder<CounterBloc,CounterState>(
      builder : (context, state){
        return Column(
          children : [
            Text('${state.value}')
          ]
        )
      }
    )

    //Contoh context.read 1  (untuk ambil data state)
    Column(
      children : [
        Text('${context.read<CounterBloc>().state.value}')
      ]
    )

    //Contoh context.read 2 (untuk trigger event)
    ElevatedButton(
      onPressed : (){
        context.read<CounterBloc>().add(Increment());
      },
      child : Text('Increment'),
    ),
    ElevatedButton(
      onPressed : (){
        context.read<CounterBloc>().add(Decrement());
      },
      child : Text('Decrement'),
    ),

    //Terdapat cara-cara menggunakan BLoC lainnya seperti menggunakan BlocConsumer, BlocListener, context.watch yang tidak dijelaskan pada summary ini
    ```
