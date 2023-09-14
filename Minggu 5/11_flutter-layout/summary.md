# Summary/Resume Minggu 5 (Flutter Layout)

## Poin Pertama

Pertemuan pada Minggu 5 pertemuan 1 membahas tentang Flutter Layout. Flutter Layout merupakan widget yang bisa digunakan untuk membungkus dan mengatur penempatan widget-widget lain di dalamnya. Layout pada flutter terdiri dari 2 jenis yaitu single child layout dan multi child layout.

## Poin Kedua

### Single Child Layout

Single Child Layout merupakan widget yang hanya dapat menampung 1 buah child didalamnya. Contoh Single Child Layout :

#### Container

Widget ini digunakan untuk menampung elemen didalamnya. Bila dibandingkan dengan widget Single Child Layout lainnya, Container memiliki properti-properti yang terbilang lengkap (contoh : padding, margin, border, width, height, decoration, transform,dll)

```dart
Container(
  width: 200.0,
  height: 200.0,
  color: Colors.blue,
  child: Center(
    child: Text(
      'Container',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
  ),
)
```

#### Center

Center merupakan widget yang digunakan untuk secara otomatis menempatkan child yang ditampungnya ke tengah. Center akan berusaha untuk memenuhi lebar dan tinggi ruang di luarnya.

```dart
Center(
  child: Text(
    'Center text',    //  teks akan berada di tengah layar
    style: TextStyle(fontSize: 20.0),
  ),
)
```

#### SizedBox

SizedBox adalah widget yang biasanya digunakan untuk menambahkan whitespace (ruang kosong) dalam layout atau antar elemen lainnya (walapun juga bisa untuk menampung widget lainnya). SizedBox mirip seperti container namun hanya memiliki properti yang lebih sedikit (tidak ada properti untuk decoration/style, hanya dapat mengatur tinggi dan lebar).

```dart
SizedBox(
  width: 20.0,
  height: 10.0,
  child : Text("Sized box")
)
```

#### Padding

Padding merupakan widget yang digunakan untuk menambahkan ruang kosong (padding) di sekitar child widget yang dimilikinya. Pada widget Padding, terdapat sebuah properti 'padding' yang wajib diisi.

```dart
Padding(
  padding: EdgeInsets.all(16.0),
  child: Text(
    'Padding text',
    style: TextStyle(fontSize: 20.0),
  ),
)
```

## Poin Ketiga

### Multi Child Layout

Multi Child Layout merupakan widget yang dapat menampung banyak child sekaligus. Karena memiliki banyak child, maka multi child layout memiliki keyword "children" yang merupakan sebuah list yang terdiri dari banyak child.

#### Column

Column merupakan widget yang digunakan untuk mengatur elemen agar bisa disusun secara vertikal (dari atas ke bawah). Column menggunakan berbagai properti, seperti mainAxisAlignment untuk mengatur bagaimana child akan diatur secara vertikal, crossAxisAlignment untuk mengontrol cara elemen-elemen anak diatur secara horizontal, dll.

```dart
Column(
  children: <Widget>[
    Text('A'),
    Text('B'),
    Text('C'),
  ],
)
```

#### Row

Row merupakan widget yang digunakan untuk mengatur elemen agar bisa disusun secara horizontal (dari kiri ke kanan). Row juga memiliki properti mainAxisAlignment dan crossAxisAlignment seperti pada Column, namun kedua properti ini memiliki sifat yang berlawanan dari properti yang ada di Column (mainAxisAlignment Row mengatur horizontal, sedangkan crossAxisAlignment mengatur vertikal)

```dart
Row(
  children: <Widget>[
    Text('1'),
    Text('2'),
    Text('3'),
  ],
)
```

#### ListView

ListView merupakan widget yang digunakan untuk membuat sebuah "scrollable list" dari elemen child yang ditampung. ListView dapat dibuat secara vertikal maupun horizontal dengan mengisi properti scrollDirection.

ListView sendiri terbagi menjadi beberapa jenis yaitu :

- ListView : ListView jenis ini biasanya digunakan apabila list yang dibuat hanya memiliki jumlah yang sedikit dan datanya bersifat statis.

```dart
ListView(
  children: <Widget>[
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
  ],
)
```

- ListView.builder : ListView jenis ini digunakan apabila data yang ingin ditampilkan ada banyak dan data yang ingin ditampilkan bersifat dinamis/berubah-ubah. Widget ini lebih efisien dari ListView biasa karena hanya membangun child yang terlihat di layar.

```dart
ListView.builder(
  itemCount: data.length,
  itemBuilder: (context, index) {
    return ListTile(title: Text(data[index]));
  },
)
```

- ListView.separated : ListView.separated mirip seperti ListView builder, namun terdapat 1 properti required tambahan yaitu separatorBuilder yang digunakan sebagai pemisah/separator dari masing-masing child ketika ditampilkan.

```dart
ListView.separated(
  itemCount: data.length,
  separatorBuilder: (context, index) => Divider(),
  itemBuilder: (context, index) {
    return ListTile(title: Text(data[index]));
  },
)
```

- ListView.custom : ListView jenis ini digunakan apabila ingin membuat list dengan tampilan yang lebih kompleks. ListView ini menggunakan sebuah custom SliverChildBuilderDelegate untuk penyusunan child.

```dart
ListView.custom(
  childrenDelegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return ListTile(title: Text(data[index]));
    },
    childCount: data.length,
  ),
)
```

#### GridView

GridView merupakan widget yang digunakan untuk menyusun child ke dalam bentuk grid (dengan baris dan kolom). GridView juga dapat menggunakan properti scrollDirection untuk mengubah arah scroll.

GridView terbagi menjadi beberapa jenis yaitu :

- GridView.count : GridView.count digunakan untuk membuat grid dengan jumlah kolom yang tetap. Terdapat properti crossAxisCount untuk emngatur jumlah kolom.

```dart
GridView.count(
  primary: false,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 2,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[500],
      child: const Text('Revolution is coming...'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[600],
      child: const Text('Revolution, they...'),
    ),
  ],
)
```

- GridView.builder : GridView ini digunakan ketika data yang ingin ditampilkan banyak dan bersifat dinamis.

```dart
GridView.builder(
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 3 / 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20),
  itemCount: myProducts.length,
  itemBuilder: (BuildContext ctx, index) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(15)),
      child: Text(myProducts[index]["name"]),
    );
  }
),
```

- GridView.extent : GridView.extent digunakan apabila grid yang dibuat memiliki width dan height dalam nilai tertentu yang sudah ditetapkan.

```dart
GridView.extent(
  maxCrossAxisExtent: 150.0,
  children: <Widget>[
    Container(
      padding: const EdgeInsets.all(16),
      color: Colors.teal[500],
      child: const Text('abcdefghij'),
    ),
  ],
)
```

- GridView.custom : GridView jenis ini digunakan apabila ingin membuat grid dengan tampilan yang lebih kompleks. GridView ini menggunakan sebuah custom SliverChildBuilderDelegate untuk penyusunan elemen/child grid.

```dart
GridView.custom(
  primary: false,
  padding: const EdgeInsets.all(20),
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
  childrenDelegate: SliverChildListDelegate(<Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('He\'d have you all unravel at the'),
      color: Colors.teal[100],
    ),
    Container(
      padding: const EdgeInsets.all(8),
      child: const Text('Heed not the rabble'),
      color: Colors.teal[200],
    ),
  ]),
)
```
