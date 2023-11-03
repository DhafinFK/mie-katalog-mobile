Berikut adalah file readme.md untuk tugas PBP pasca uts Dhafin Fadhlan Kamal - 2206030861 dari kelas PBP A.

# - Tugas 7 -

## > Menjawab beberapa pertanyaan berikut pada README.md pada root folder.

### Pertanyaan 1: Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

- Stateless Widget: Stateless widget adalah widget tanpa keadaan internal (state), yang berarti tampilan widget ini tidak berubah setelah dirender untuk pertama kalinya. Biasanya digunakan untuk elemen statis seperti teks, icon, gambar, dan sebagainya.
- Stateful Widget: Stateful widget adalah jenis widget yang mampu mengubah tampilannya. Mereka memiliki keadaan internal (state) yang dapat diperbarui, dan ketika state berubah, widget akan dirender kembali sesuai perubahan tersebut. Stateful widget digunakan untuk elemen yang memerlukan interaksi, seperti form, pembaruan item, maupun infinite scroll bar.

### Pertanyaan 2: Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

1. `MaterialApp`: Widget utama yang digunakan untuk menginisialisasi aplikasi. Biasanya merupakan parent utama dari widget kita. Biasanya digunakan untuk mengatur tema dan color palette dari applikasi kita..

2. `Scaffold`: Scaffold adalah template dasar yang digunakan untuk membuat tampilan seperti applikasi pada umumnya. Scaffold memiliki parameter `appbar`, dan `drawer` sebagai navigasi utama pada applikasi kita.

3. `AppBar`: Widget yang digunakan untuk membuat AppBar (Panel yang ada di atas applikasi).

4. `SingleChildScrollView`: Widget yang memungkinkan childnya dapat discroll. Digunakan untuk membungkus konten utama.

5. `Padding`: Digunakan untuk memberikan padding pada childnya.

6. `Column`: Widget yang menampilkan elemen-elemen secara vertikal, child dari widget ini adalah list of widget / kumpulan dari widget yang akan disusun secara vertikal.

7. `Text`: Widget untuk menampilkan teks. Dapat pula diatur font, warna, dan styling text disini.

8. `Center`: Digunakan untuk mengatur childnya pada posisi ke tengah secara horizontal dan vertikal.

9. `GridView.count`: Digunakan untuk membuat grid layout dengan jumlah kolom yang diberikan.

10. `InkWell`: Digunakan untuk memberikan efek sentuhan. Ini memungkinkan untuk menangani interaksi pengguna. Biasanya diterapkan pada button.

11. `Icon`: Digunakan untuk menampilkan ikon.

12. `SnackBar`: Ini adalah widget yang digunakan untuk menampilkan pesan singkat di bagian bawah layar.

### Pertanyaan 3: Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

#### > checklist 1: Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

Membuat program dimulai dengan menjalankan

```sh
flutter create mie_katalog_mobile
```

yang membuat kerangka kerja dengan bahasa pemrograman dart. Aplikasi yang dibuat akan memuat beberapa widget seperti tombol, appbar, dan title yang akan menjadi home page dari aplikasi. Aplikasi tersebut akan menjalankan scaffold dari main.dart yang memanggil widget-widget yang berada di menu.dart. Menu.dart itu mengandung widget-widget yang perlu ditampilkan pada halaman utama aplikasi.

#### > Checklist 2: Membuat tiga tombol sederhana dengan ikon dan teks untuk:

<strong>Sebelum lanjut ke checklist ada beberapa tambahan kode yang dapat membantu penjelasan penambahan button:</strong>

<br>
<hr>
<br>
main.dart:
<br><br>

```dart
import 'package:flutter/material.dart';
import 'package:mie_katalog_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```

<br>
<hr>
<br>
dan cuplikan kode shopping item sebagai widget dan class:
<br><br>

```dart
class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}
```

```dart
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

- checklist 2.1: Melihat daftar item (`Lihat Item`): <br>
  membuat instance dari button (inkwell) dengan kode sebagai berikut

```dart
final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist, const Color(0xff739072)),
    ShopItem("Tambah Produk", Icons.add_shopping_cart, const Color(0xff4f6f52)),
    ShopItem("Logout", Icons.logout, const Color(0xff3a4d39)),
  ];
```

- checklist 2.2: Menambah item (`Tambah Item`): <br>
  membuat instance dari button (inkwell) dengan kode sebagai berikut

```dart
final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist, const Color(0xff739072)),
    ShopItem("Tambah Produk", Icons.add_shopping_cart, const Color(0xff4f6f52)),
    ShopItem("Logout", Icons.logout, const Color(0xff3a4d39)),
  ];
```

- checklist 2.3: Logout (`Logout`): <br>
  membuat instance dari button (inkwell) dengan kode sebagai berikut

```dart
final List<ShopItem> items = [
    ShopItem("Lihat Produk", Icons.checklist, const Color(0xff739072)),
    ShopItem("Tambah Produk", Icons.add_shopping_cart, const Color(0xff4f6f52)),
    ShopItem("Logout", Icons.logout, const Color(0xff3a4d39)),
  ];
```

Kemudian ketiga item dalam LIst items tersebut dijadikan widget di scaffold home dengan kode berikut:

```dart
children: items.map((ShopItem item) {
  // Iterasi untuk setiap item
  return ShopCard(item);
}).toList(),
```

Dan memasukan ketiga widget tersebut kedalam widget container parent nya hingga akhirnya tiba di body

```dart
body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  // text dan property untuk judul
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                }).toList(),
              ),
            ],
          ),
        ),
      ),
```

#### > Checklist 3: Memunculkan `Snackbar` dengan tulisan:

- checklist 3.1: "Kamu telah menekan tombol Lihat Item" ketika tombol `Lihat Item` ditekan.
- checklist 3.2: "Kamu telah menekan tombol Tambah Item" ketika tombol `Tambah Item` ditekan.
- checklist 3.3: "Kamu telah menekan tombol Logout" ketika tombol `Logout` ditekan.

Semua kemunculan snackbar sudah diimplementasikan dengan "eventlistener" kalau dalam javascript ke tiap widget button inkwell yang menampilkan snackbar sesuai dengan nama/text dari button yang ditekan tersebut. Berikut kode pada widget inkwell tersebut yang memanggil snackbar

menu.dart (pada bagian kode Shopcard Widget):

```
child: InkWell(
  // Area responsive terhadap sentuhan
  onTap: () {
    // Memunculkan SnackBar ketika diklik
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          content: Text("Kamu telah menekan tombol ${item.name}!")));
  },
```
