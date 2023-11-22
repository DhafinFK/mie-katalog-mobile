Berikut adalah file readme.md untuk tugas PBP pasca uts Dhafin Fadhlan Kamal - 2206030861 dari kelas PBP A.

# - Tugas 7 -

## Menjawab beberapa pertanyaan berikut pada README.md pada root folder.

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

#### checklist 1: Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

Membuat program dimulai dengan menjalankan

```sh
flutter create mie_katalog_mobile
```

yang membuat kerangka kerja dengan bahasa pemrograman dart. Aplikasi yang dibuat akan memuat beberapa widget seperti tombol, appbar, dan title yang akan menjadi home page dari aplikasi. Aplikasi tersebut akan menjalankan scaffold dari main.dart yang memanggil widget-widget yang berada di menu.dart. Menu.dart itu mengandung widget-widget yang perlu ditampilkan pada halaman utama aplikasi.

#### Checklist 2: Membuat tiga tombol sederhana dengan ikon dan teks untuk:

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

#### Checklist 3: Memunculkan `Snackbar` dengan tulisan:

- checklist 3.1: "Kamu telah menekan tombol Lihat Item" ketika tombol `Lihat Item` ditekan.
- checklist 3.2: "Kamu telah menekan tombol Tambah Item" ketika tombol `Tambah Item` ditekan.
- checklist 3.3: "Kamu telah menekan tombol Logout" ketika tombol `Logout` ditekan.

Semua kemunculan snackbar sudah diimplementasikan dengan "eventlistener" kalau dalam javascript ke tiap widget button inkwell yang menampilkan snackbar sesuai dengan nama/text dari button yang ditekan tersebut. Berikut kode pada widget inkwell tersebut yang memanggil snackbar

menu.dart (pada bagian kode Shopcard Widget):

```dart
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

# - Tugas 8 -

## Menjawab beberapa pertanyaan berikut pada README.md pada root folder.

### Pertanyaan 1: Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

- <strong>Navigator.push()</strong> Merupakan method untuk menambahkan page/route baru ke stack route yang kita miliki saat ini. Setelah di push, route/page yang di push akan berada di top of stack dan jika ingin kembali ke halaman sebelumnya bisa menggunakan method Navigator.pop().

  - kegunaan dari navigator.push adalah saat ingin pindah ke route/halaman baru dan dapat mengakses halaman sebelumnya dengan pop. contohnya: berpindah dari listview katalog barang kemudian Navigator.push() ke halaman detail produk. Kita masih ingin kembali ke listview katalog sehingga di push tidak perlu di replace.

- <strong>Navigator.pushReplacement()</strong> Merupakan method untuk menggantikan halaman sekarang dengan route baru. Route/halaman yang sedang diakses akan dihilangkan dari stack route dan digantikan dengan route/halaman target yang kemudian ditempatkan di top of route stack.

  - kegunaan dari NavigatorpushReplacement() ingin berpindah ke halaman lain dan halaman sebelumnya dan kita tidak ingin halaman sebelumnya dapat diakses dengan melakukan Navigator.pop(). contohnya: Berpindah halaman dari login page ke halaman utama saat berhasil login. Kita tidak ingin pengguna melakukan login dua kali saat memencet tombol back. hanya ke halaman tersebut bila seorang user logout.

### Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

Single-child layout widgets:

- Align: widget yang align child dalamnya dengan dirinya sendiri dan dapat menyesuaikan ukuran berdasarkan ukuran child, kegunaan dalam code:

```dart
Center(
  child: Container(
    height: 120.0,
    width: 120.0,
    color: Colors.blue[50],
    child: const Align(
      alignment: Alignment.topRight,
      child: FlutterLogo(
        size: 60,
      ),
    ),
  ),
)
```

- AspectRatio: widget yang menyesuaikan ukuran child nya menjadi suatu aspect ratio, kegunaan dalam code:

```dart
import 'package:flutter/material.dart';

/// Flutter code sample for [AspectRatio].

void main() => runApp(const AspectRatioApp());

class AspectRatioApp extends StatelessWidget {
  const AspectRatioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('AspectRatio Sample')),
        body: const AspectRatioExample(),
      ),
    );
  }
}

class AspectRatioExample extends StatelessWidget {
  const AspectRatioExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      alignment: Alignment.center,
      width: double.infinity,
      height: 100.0,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.green,
        ),
      ),
    );
  }
}

```

- Baeline: widget yang menempatkan childnya ke baseline child, contoh kegunaannya dalam kode:

```dart
Baseline(
  baseline: 40.0,
  baselineType: TextBaseline.alphabetic,
  child: Container(
    width: 40.0,
    height: 40.0,
    color: Colors.blue,
  ),
),
```

- Center: container yang menempatkan child ke posisi tengah dari container tersebut

```dart
body: Center(
  child: Container(
    width: 200.0,
    height: 100.0,
    color: Colors.blue,
    child: Text(
      'Ini Tengah Layar!',
      style: TextStyle(color: Colors.white),
    ),
  ),
),
```

- ConstrainedBox: digunakan untuk menambahkan constraint/batasan kepada child didalamnya, contoh kegunaan dalam kode:

```dart
ConstrainedBox(
  constraints: const BoxConstraints.expand(),
  child: const Card(child: Text('Hello World!')),
)
```

- Container: widget yang yang menggabungkan painting, positioning, dan sizing widgets yang umum, contoh kegunaan dalam kode:

```dart
Center(
  child: Container(
    margin: const EdgeInsets.all(10.0),
    color: Colors.amber[600],
    width: 48.0,
    height: 48.0,
  ),
)
```

- CustomSingleChildLayout: layout khusus yang constraintnya berbeda dengan single child nya, contoh kegunaan dalam kode:

```dart
class MyCustomLayout extends SingleChildLayoutDelegate {
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // Menempatkan anak di tengah-tengah tata letak
    return Offset((size.width - childSize.width) / 2, (size.height - childSize.height) / 2);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // Menentukan batasan untuk anak
    return BoxConstraints.tightFor(width: 200.0, height: 100.0);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    // Jika perlu mengulang tata letak
    return false;
  }
}

class MyCustomLayout extends StatelessWidget {
  final Widget child;

  MyCustomLayout({required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: MyCustomLayoutDelegate(),
      child: child,
    );
  }
}
```

- Expanded: widget yang melakukan expand child dari row, column, atau flex. Contoh kegunaan dalam kode:

```dart
import 'package:flutter/material.dart';

/// Flutter code sample for [Expanded].

void main() => runApp(const ExpandedApp());

class ExpandedApp extends StatelessWidget {
  const ExpandedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expanded Column Sample'),
        ),
        body: const ExpandedExample(),
      ),
    );
  }
}

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          ),
          Expanded(
            child: Container(
              color: Colors.amber,
              width: 100,
            ),
          ),
          Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          ),
        ],
      ),
    );
  }
}
```

- mengatur scale dan posisi dan child dalam dirinya tergantung fit, contoh kegunaan dalam kode:

```dart
import 'package:flutter/material.dart';

/// Flutter code sample for [FittedBox].

void main() => runApp(const FittedBoxApp());

class FittedBoxApp extends StatelessWidget {
  const FittedBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FittedBox Sample')),
        body: const Center(
          child: FittedBoxExample(),
        ),
      ),
    );
  }
}

class FittedBoxExample extends StatelessWidget {
  const FittedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 300,
      color: Colors.blue,
      child: const FittedBox(
        // TRY THIS: Try changing the fit types to see how they change the way
        // the placeholder fits into the container.
        fit: BoxFit.fill,
        child: Placeholder(),
      ),
    );
  }
}
```

- FractionallySizedBox: Widget yang mengatur ukuran size dari child menjadi pecahan dari total space yang ada, contoh kegunaannya dalam kode:

```dart
import 'package:flutter/material.dart';

/// Flutter code sample for [FractionallySizedBox].

void main() => runApp(const FractionallySizedBoxApp());

class FractionallySizedBoxApp extends StatelessWidget {
  const FractionallySizedBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FractionallySizedBox Sample')),
        body: const FractionallySizedBoxExample(),
      ),
    );
  }
}

class FractionallySizedBoxExample extends StatelessWidget {
  const FractionallySizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.5,
        alignment: FractionalOffset.center,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 4,
            ),
          ),
        ),
      ),
    );
  }
}
```

- IntrinsicHeight: widget yang mengatur ukuran child menjadi intrinsic height dari child, contoh kegunaan dalam kode:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IntrinsicHeight Example'),
        ),
        body: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100.0,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Tinggi\nSesuai',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: 100.0,
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tinggi'),
                    Text('Terkecil'),
                    Text('Yang'),
                    Text('Mungkin'),
                  ],
                ),
              ),
              Container(
                width: 100.0,
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Tinggi\nSesuai',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

- IntrinsicWidth: widget yang mengatur ukuran child menjadi intrinsic width dari child, contoh kegunaan dalam kode:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IntrinsicWidth Example'),
        ),
        body: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 100.0,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Lebar\nSesuai',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 100.0,
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Lebar'),
                    Text('Terkecil'),
                    Text('Yang'),
                    Text('Mungkin'),
                  ],
                ),
              ),
              Container(
                height: 100.0,
                color: Colors.red,
                child: Center(
                  child: Text(
                    'Lebar\nSesuai',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

- LimitedBox: sebuah box yang membatasi ukurannya hanya saat dia unconstrained, contoh kegunaannya dalam kode:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LimitedBox Example'),
        ),
        body: Center(
          child: LimitedBox(
            maxWidth: 150.0,
            maxHeight: 150.0,
            child: Container(
              color: Colors.blue,
              width: 200.0,
              height: 200.0,
              child: Center(
                child: Text(
                  'LimitedBox Example',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

- Offstage: widget yang menaruh child seperti dalam tree, tapi tidak melakukan painting pada apapun, membuat child tidak dapat dilakukan hit testing, dan tanpa memakan ruang apapun dalam parent nya. contoh kegunaan dalam kode:

```dart
import 'package:flutter/material.dart';

/// Flutter code sample for [Offstage].

void main() => runApp(const OffstageApp());

class OffstageApp extends StatelessWidget {
  const OffstageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Offstage Sample')),
        body: const Center(
          child: OffstageExample(),
        ),
      ),
    );
  }
}

class OffstageExample extends StatefulWidget {
  const OffstageExample({super.key});

  @override
  State<OffstageExample> createState() => _OffstageExampleState();
}

class _OffstageExampleState extends State<OffstageExample> {
  final GlobalKey _key = GlobalKey();
  bool _offstage = true;

  Size _getFlutterLogoSize() {
    final RenderBox renderLogo =
        _key.currentContext!.findRenderObject()! as RenderBox;
    return renderLogo.size;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Offstage(
          offstage: _offstage,
          child: FlutterLogo(
            key: _key,
            size: 150.0,
          ),
        ),
        Text('Flutter logo is offstage: $_offstage'),
        ElevatedButton(
          child: const Text('Toggle Offstage Value'),
          onPressed: () {
            setState(() {
              _offstage = !_offstage;
            });
          },
        ),
        if (_offstage)
          ElevatedButton(
              child: const Text('Get Flutter Logo size'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text('Flutter Logo size is ${_getFlutterLogoSize()}'),
                  ),
                );
              }),
      ],
    );
  }
}
```

- OverflowBox: widget yang menaruh beberapa constraint pada child dari yang diberikan parentnya, sehingga memungkinkan child overflow ke parent nya. contoh kegunaan dalam kode:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OverflowBox Example'),
        ),
        body: Center(
          child: OverflowBox(
            maxWidth: 200.0,
            maxHeight: 200.0,
            child: Container(
              color: Colors.blue,
              width: 300.0,
              height: 300.0,
              child: Center(
                child: Text(
                  'OverflowBox Example',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

- Padding: widget yang menempelkan inset pada child yang diberikan padding, contoh kegunaan dalam kode:

```dart
const Card(
  child: Padding(
    padding: EdgeInsets.all(16.0),
    child: Text('Hello World!'),
  ),
)
```

- SizedBox: widget yang berupa box dengan ukuran yang ditentukan, contoh kegunaan dalam kode:

```dart
const SizedBox(
  width: 200.0,
  height: 300.0,
  child: Card(child: Text('Hello World!')),
)
```

- SizedOverflowBox: widget yang memliki ukuran spesifik tetapi memprioritaskan constraintnya dibandingkan constraint parent originalnya, sehingga dapat overflow. contoh kegunaan dalam kode:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SizedOverflowBox Example'),
        ),
        body: Center(
          child: SizedOverflowBox(
            size: Size(200.0, 200.0),
            child: Container(
              color: Colors.blue,
              width: 300.0,
              height: 300.0,
              child: Center(
                child: Text(
                  'SizedOverflowBox Example',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

- Transform: widget yang menerapkan transformation pada chid nya sebelum painting, contoh kegunaan dalam kode:

```dart
ColoredBox(
  color: Colors.black,
  child: Transform(
    alignment: Alignment.topRight,
    transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
    child: Container(
      padding: const EdgeInsets.all(8.0),
      color: const Color(0xFFE8581C),
      child: const Text('Apartment for rent!'),
    ),
  ),
)
```

Multi-child layout widgets:

- Column: Widget yang menampilkan children nya dalam vertical array, contoh kegunaan dalam kode:

```dart
const Column(
  children: <Widget>[
    Text('Deliver features faster'),
    Text('Craft beautiful UIs'),
    Expanded(
      child: FittedBox(
        child: FlutterLogo(),
      ),
    ),
  ],
)
```

- CustomMultiChildLayout: Widget yang menggunakan delegate untuk mengubah size dan position beberapa children. Contoh kegunaan dalam kode:

```dart
import 'package:flutter/material.dart';

/// Flutter code sample for [CustomMultiChildLayout].

void main() => runApp(const CustomMultiChildLayoutApp());

class CustomMultiChildLayoutApp extends StatelessWidget {
  const CustomMultiChildLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Directionality(
        // TRY THIS: Try changing the direction here and hot-reloading to
        // see the layout change.
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: CustomMultiChildLayoutExample(),
        ),
      ),
    );
  }
}

/// Lays out the children in a cascade, where the top corner of the next child
/// is a little above (`overlap`) the lower end corner of the previous child.
///
/// Will relayout if the text direction changes.
class _CascadeLayoutDelegate extends MultiChildLayoutDelegate {
  _CascadeLayoutDelegate({
    required this.colors,
    required this.overlap,
    required this.textDirection,
  });

  final Map<String, Color> colors;
  final double overlap;
  final TextDirection textDirection;

  // Perform layout will be called when re-layout is needed.
  @override
  void performLayout(Size size) {
    final double columnWidth = size.width / colors.length;
    Offset childPosition = Offset.zero;
    switch (textDirection) {
      case TextDirection.rtl:
        childPosition += Offset(size.width, 0);
      case TextDirection.ltr:
        break;
    }
    for (final String color in colors.keys) {
      // layoutChild must be called exactly once for each child.
      final Size currentSize = layoutChild(
        color,
        BoxConstraints(maxHeight: size.height, maxWidth: columnWidth),
      );
      // positionChild must be called to change the position of a child from
      // what it was in the previous layout. Each child starts at (0, 0) for the
      // first layout.
      switch (textDirection) {
        case TextDirection.rtl:
          positionChild(color, childPosition - Offset(currentSize.width, 0));
          childPosition +=
              Offset(-currentSize.width, currentSize.height - overlap);
        case TextDirection.ltr:
          positionChild(color, childPosition);
          childPosition +=
              Offset(currentSize.width, currentSize.height - overlap);
      }
    }
  }

  // shouldRelayout is called to see if the delegate has changed and requires a
  // layout to occur. Should only return true if the delegate state itself
  // changes: changes in the CustomMultiChildLayout attributes will
  // automatically cause a relayout, like any other widget.
  @override
  bool shouldRelayout(_CascadeLayoutDelegate oldDelegate) {
    return oldDelegate.textDirection != textDirection ||
        oldDelegate.overlap != overlap;
  }
}

class CustomMultiChildLayoutExample extends StatelessWidget {
  const CustomMultiChildLayoutExample({super.key});

  static const Map<String, Color> _colors = <String, Color>{
    'Red': Colors.red,
    'Green': Colors.green,
    'Blue': Colors.blue,
    'Cyan': Colors.cyan,
  };

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _CascadeLayoutDelegate(
        colors: _colors,
        overlap: 30.0,
        textDirection: Directionality.of(context),
      ),
      children: <Widget>[
        // Create all of the colored boxes in the colors map.
        for (final MapEntry<String, Color> entry in _colors.entries)
          // The "id" can be any Object, not just a String.
          LayoutId(
            id: entry.key,
            child: Container(
              color: entry.value,
              width: 100.0,
              height: 100.0,
              alignment: Alignment.center,
              child: Text(entry.key),
            ),
          ),
      ],
    );
  }
}
```

- Flow: widget yang mengatur ukuran dan position dari child nya secara efisien sesuai dengan logic flowdelegate, contoh kegunaan dalam kode:

```dart
import 'package:flutter/material.dart';

/// Flutter code sample for [Flow].

void main() => runApp(const FlowApp());

class FlowApp extends StatelessWidget {
  const FlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flow Example'),
        ),
        body: const FlowMenu(),
      ),
    );
  }
}

class FlowMenu extends StatefulWidget {
  const FlowMenu({super.key});

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter =
        MediaQuery.of(context).size.width / menuItems.length;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RawMaterialButton(
        fillColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
        splashColor: Colors.amber[100],
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          _updateMenu(icon);
          menuAnimation.status == AnimationStatus.completed
              ? menuAnimation.reverse()
              : menuAnimation.forward();
        },
        child: Icon(
          icon,
          color: Colors.white,
          size: 45.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
      children:
          menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(
          dx * menuAnimation.value,
          0,
          0,
        ),
      );
    }
  }
}
```

- GridView: grid list yang mencakup dari beberapa pola cell yang berulang dalam vertical dan horizontal layout. contoh kegunaan dalam kode:

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
      color: Colors.teal[100],
      child: const Text("He'd have you all unravel at the"),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[200],
      child: const Text('Heed not the rabble'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[300],
      child: const Text('Sound of screams but the'),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      color: Colors.teal[400],
      child: const Text('Who scream'),
    ),
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

- IndexedStack: STack yang menunjukkan satu child dari list children, contoh kegunaan dalam kode:

```dart
import 'package:flutter/material.dart';

/// Flutter code sample for [IndexedStack].

void main() => runApp(const IndexedStackApp());

class IndexedStackApp extends StatelessWidget {
  const IndexedStackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('IndexedStack Sample')),
        body: const IndexedStackExample(),
      ),
    );
  }
}

class IndexedStackExample extends StatefulWidget {
  const IndexedStackExample({super.key});

  @override
  State<IndexedStackExample> createState() => _IndexedStackExampleState();
}

class _IndexedStackExampleState extends State<IndexedStackExample> {
  List<String> names = <String>['Dash', 'John', 'Mary'];
  int index = 0;
  final TextEditingController fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 300,
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter the name for a person to track',
            ),
            onSubmitted: (String value) {
              setState(() {
                names.add(value);
              });
              fieldText.clear();
            },
            controller: fieldText,
          ),
        ),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  if (index == 0) {
                    index = names.length - 1;
                  } else {
                    index -= 1;
                  }
                });
              },
              child: const Icon(Icons.chevron_left, key: Key('gesture1')),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IndexedStack(
                  index: index,
                  children: <Widget>[
                    for (final String name in names) PersonTracker(name: name)
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (index == names.length - 1) {
                    index = 0;
                  } else {
                    index += 1;
                  }
                });
              },
              child: const Icon(Icons.chevron_right, key: Key('gesture2')),
            ),
          ],
        )
      ],
    );
  }
}

class PersonTracker extends StatefulWidget {
  const PersonTracker({super.key, required this.name});
  final String name;
  @override
  State<PersonTracker> createState() => _PersonTrackerState();
}

class _PersonTrackerState extends State<PersonTracker> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(widget.name),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 248, 255),
        border: Border.all(color: const Color.fromARGB(255, 54, 60, 244)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Text('Name: ${widget.name}'),
          Text('Score: $counter'),
          TextButton.icon(
            key: Key('increment${widget.name}'),
            icon: const Icon(Icons.add),
            onPressed: () {
              setState(() {
                counter += 1;
              });
            },
            label: const Text('Increment'),
          )
        ],
      ),
    );
  }
}
```

- LayoutBuilder: Membuat widget tree yang dapat bergantung pada ukuran parent widget, contoh kegunaan dalam kode:

```dart
import 'package:flutter/material.dart';

/// Flutter code sample for [LayoutBuilder].

void main() => runApp(const LayoutBuilderExampleApp());

class LayoutBuilderExampleApp extends StatelessWidget {
  const LayoutBuilderExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LayoutBuilderExample(),
    );
  }
}

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('LayoutBuilder Example')),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideContainers();
          } else {
            return _buildNormalContainer();
          }
        },
      ),
    );
  }

  Widget _buildNormalContainer() {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.red,
      ),
    );
  }

  Widget _buildWideContainers() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red,
          ),
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}
```

ListBody: widget yang mengatur childrennya secara sequentially sepanjang sumbu yang diberikan, memaksa children ke dalam dimensi dari parent yang di sumbu lain. contoh kegunaan dalam kode:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListBody Example'),
        ),
        body: ListBody(
          mainAxis: Axis.vertical,
          reverse: false,
          children: [
            Text('Item 1'),
            Text('Item 2'),
            Text('Item 3'),
            // Tambahkan lebih banyak widget sesuai kebutuhan
          ],
        ),
      ),
    );
  }
}
```

- ListView: Widget yang dapat di scroll dan disusun secara linear, contoh kegunaan dalam kode

```dart
ListView(
  padding: const EdgeInsets.all(8),
  children: <Widget>[
    Container(
      height: 50,
      color: Colors.amber[600],
      child: const Center(child: Text('Entry A')),
    ),
    Container(
      height: 50,
      color: Colors.amber[500],
      child: const Center(child: Text('Entry B')),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),
  ],
)
```

- Row: Widget yang menampilkan children dalam array horizontal, contoh penggunaan dalam kode:

```dart
const Row(
  children: <Widget>[
    Expanded(
      child: Text('Deliver features faster', textAlign: TextAlign.center),
    ),
    Expanded(
      child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
    ),
    Expanded(
      child: FittedBox(
        child: FlutterLogo(),
      ),
    ),
  ],
)
```

- Stack: Widget yang mengatur posisi children relatif terhadap ujung-ujung box, contoh penggunaan dalam kode:

```dart
Stack(
  children: <Widget>[
    Container(
      width: 100,
      height: 100,
      color: Colors.red,
    ),
    Container(
      width: 90,
      height: 90,
      color: Colors.green,
    ),
    Container(
      width: 80,
      height: 80,
      color: Colors.blue,
    ),
  ],
)
```

- Table: widget yang menggunakan table layout algo untuk children didalamnya, kegunaan dalam kode

```dart
import 'package:flutter/material.dart';

/// Flutter code sample for [Table].

void main() => runApp(const TableExampleApp());

class TableExampleApp extends StatelessWidget {
  const TableExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Table Sample')),
        body: const TableExample(),
      ),
    );
  }
}

class TableExample extends StatelessWidget {
  const TableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: IntrinsicColumnWidth(),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(64),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              height: 32,
              color: Colors.green,
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Container(
                height: 32,
                width: 32,
                color: Colors.red,
              ),
            ),
            Container(
              height: 64,
              color: Colors.blue,
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: <Widget>[
            Container(
              height: 64,
              width: 128,
              color: Colors.purple,
            ),
            Container(
              height: 32,
              color: Colors.yellow,
            ),
            Center(
              child: Container(
                height: 32,
                width: 32,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
```

- Wrap: Widget yang menampilkan children dalam beberapa susunan horizontal atau vertikal. Contoh kegunaan dalam kode:

```dart
Wrap(
  spacing: 8.0, // gap between adjacent chips
  runSpacing: 4.0, // gap between lines
  children: <Widget>[
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('AH')),
      label: const Text('Hamilton'),
    ),
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('ML')),
      label: const Text('Lafayette'),
    ),
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('HM')),
      label: const Text('Mulligan'),
    ),
    Chip(
      avatar: CircleAvatar(backgroundColor: Colors.blue.shade900, child: const Text('JL')),
      label: const Text('Laurens'),
    ),
  ],
)
```

Sliver Widgets:

- SliverAppBar: Material design appbar yang berintegrasi dengan CustomScrollView, contoh penggunaannya dalam kode:

```dart
SliverAppBar(
  expandedHeight: 150.0,
  flexibleSpace: const FlexibleSpaceBar(
    title: Text('Available seats'),
  ),
  actions: <Widget>[
    IconButton(
      icon: const Icon(Icons.add_circle),
      tooltip: 'Add new entry',
      onPressed: () { /* ... */ },
    ),
  ]
)
```

- SliverGrid: sliver yang menempatkan beberapa box clidren dalam susunan dua dimensi. contoh penggunaannya dalam kode:

```dart
SliverGrid(
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200.0,
    mainAxisSpacing: 10.0,
    crossAxisSpacing: 10.0,
    childAspectRatio: 4.0,
  ),
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      return Container(
        alignment: Alignment.center,
        color: Colors.teal[100 * (index % 9)],
        child: Text('grid item $index'),
      );
    },
    childCount: 20,
  ),
)
```

- SliverList: sliver yang menempatkan beberapa box children dalam array linear sepanjang main axis. contoh penggunaannya dalam kode:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SliverList Example'),
                background: Image.network(
                  'https://example.com/image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 20, // Jumlah total item dalam daftar
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

- SliverPadding: sliver yang menerapkan padding untuk tiap sisi dari sliver lain. contoh penggunaan dalam kode:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SliverPadding Example'),
                background: Image.network(
                  'https://example.com/image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Pertanyaan 3: Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Saya menggunakan TextFormField untuk input nama, harga, amount, dan deskripsi produk. Sedangkan untuk save atau submit saya menggunakan elevated button. Alasan saya menggunakan. Terakhir saya menggunakan DropDownButtonField dengan datatype string untuk menambahkan input sesuai dengan model indomie saya di django yaitu jenis indomie antara mie goreng atau mie kuah:

- TextFormField: Karena saya butuh input field pada form dan jenis input yang akan dilakukan oleh pengguna adalah dalam bentuk teks. Setelah itu hanya perlu dilakukan validasi isi input saat menekan submit elevated button.
- EleveatedButton: Saya menggunakan elevated button karena design dan fungsionalitas bawaannya yang sudah lebih dari cukup untuk memicu validasi input pada form.

### pertanyaan 4: Bagaimana penerapan clean architecture pada aplikasi Flutter?

Implementasi Clean Architecture pada aplikasi Flutter melibatkan pemisahan kode menjadi lapisan-lapisan yang bersifat independen dan memiliki tanggung jawab spesifik. Clean Architecture terdiri dari tiga lapisan utama:

1. <strong>Lapisan Presentasi (Presentation Layer):</strong><br>Berisi UI, widget, dan logika tampilan.
   Pada Flutter, ini bisa menjadi bagian yang mengandung widget-widget UI, tata letak, dan manajemen state (menggunakan provider, bloc, atau pendekatan manajemen state lainnya).
   Kode di lapisan ini harus bebas dari logika bisnis dan akses langsung ke data.

2. <strong>Lapisan Domain (Domain Layer):</strong><br>Berisi aturan bisnis, model, dan logika bisnis inti.
   Pada Flutter, ini bisa mencakup kelas model yang mewakili entitas bisnis, logika bisnis, dan kontrak repositori atau use case.
   Tidak bergantung pada detail implementasi seperti database atau framework UI.

3. <strong>Lapisan Data (Data Layer):</strong> <br>Berisi implementasi repositori, pemanggilan API, dan akses ke sumber data eksternal.
   Pada Flutter, ini bisa mencakup kode untuk mengambil data dari API, menyimpan data ke database lokal, atau melakukan tugas-tugas lain yang berhubungan dengan akses data.
   Harus mengimplementasikan kontrak yang didefinisikan di lapisan domain.

<strong>Prinsip-prinsip Clean Architecture pada Flutter:</strong>

1. <strong>Dependency Rule:</strong> <br>Lapisan dalam (domain) tidak boleh bergantung pada lapisan luar (presentation dan data).
   Lapisan presentasi dan data bergantung pada lapisan domain.

2. <strong>Model Entities:</strong> <br>Model di lapisan domain adalah representasi universal dari entitas bisnis.
   Model di lapisan presentasi dan data adalah representasi yang spesifik untuk kebutuhan UI atau data.

3. <strong>Contracts (Interfaces):</strong> <br>Lapisan domain mendefinisikan kontrak (interface) untuk repositori, use case, dsb.
   Lapisan data mengimplementasikan kontrak yang didefinisikan di lapisan domain.

4. <strong>Tata Letak dan Logika Tampilan:</strong> <br> Logika tampilan dan tata letak berada di lapisan presentasi.
   Presenter/BLoC menghubungkan tampilan dengan logika bisnis dari lapisan domain.

### Pertanyaan 5: Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

- <strong>checklist</strong> 1: <br>
  Saya membuat file baru yang merupakan halaman untuk form input barang baru pada projek saya bernama `shopping.dart` dan kemudian saya

  - checklist 1.1: saya menempatkan beberapa input pada file `shopping.dart` yang menggunakan `TextFormField` sebagai tempat input dari user. Bagian kode yang menerapkan input tersebut adalah sebagai berikut:

  ```dart
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Nama Produk",
        labelText: "Nama Produk",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _name = value!;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Nama tidak boleh kosong!";
        }
        return null;
      },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Harga",
        labelText: "Harga",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _price = int.parse(value!);
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Harga tidak boleh kosong!";
        }
        if (int.tryParse(value) == null) {
          return "Harga harus berupa angka!";
        }
        return null;
      },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Amount",
        labelText: "Amount",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _amount = int.parse(value!);
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Amount tidak boleh kosong!";
        }
        if (int.tryParse(value) == null) {
          return "Amount harus berupa angka!";
        }
        return null;
      },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: "Tipe Indomie",
        labelText: "Tipe Indomie",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      value: _indomieType,
      items: ["mie goreng", "mie kuah"]
          .map((indomieType) => DropdownMenuItem(
                value: indomieType,
                child: Text(indomieType),
              ))
          .toList(),
      onChanged: (String? value) {
        setState(() {
          _indomieType = value!;
        });
      },
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        hintText: "Deskripsi",
        labelText: "Deskripsi",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onChanged: (String? value) {
        setState(() {
          _description = value!;
        });
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Deskripsi tidak boleh kosong!";
        }
        return null;
      },
    ),
  ),
  ```

  - checklist 1.2: <br>Saya menambahkan tombol dengan layout widget align agar posisi tombol tersebut selalu ditengah. Pemasangan tombol ada pada bagian kode berikut:

  ```dart
  Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff482121)),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: const Color(0xff4f6f52),
                          title: const Text('Produk berhasil tersimpan',
                              style: TextStyle(color: Colors.white)),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama: $_name \nHarga: $_price \nDescription:\n$_description',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text(
                                'OK',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                    _formKey.currentState!.reset();
                  }
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
  ```

  - checklist 1.3:
    - checklist 1.3.1 dan 1.3.2: <br> validasi dilakukan saat user menecet tombol submit yang kemudian menjalankan function call memeriksa apakah isi input sudah benar pada input-input. penulisan kode yang terkait adalah sebagai berikut:

  ```dart
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Deskripsi tidak boleh kosong!";
    }
    return null;
  },
  ```

  ```dart
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Harga tidak boleh kosong!";
    }
    if (int.tryParse(value) == null) {
      return "Harga harus berupa angka!";
    }
    return null;
  },
  ```

  ```dart
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Nama tidak boleh kosong!";
    }
    return null;
  },
  ```

- checklist 2: <br>
  Saat tombol `Tambah Item` ditekan, tombol tersebut memiliki "eventlistener" yang membuat flutter melakukan navigator push ke halaman form. Kode yang terkait adalah sebagai berikut:

  ```dart
  if (item.name == "Tambah Produk") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ShopFormPage()));
  }
  ```

- checklist 3: <br>
  drawer dibuat melalui file dart tersendiri yang memiliki tampilan-tampilan sesuai permintaan tugas. file bernama `left_drawer.dart`.

  - checklist 3.1, 3.2, 3.3:<br> opsi ditambahkan sesuai permintaan tugas dalam bentuk 2 widget list title yang masing-masing melakukan navigator push saat ditekan. kode adalah sebagai berikut:

  ```dart
  ListTile(
    leading: const Icon(Icons.home_outlined),
    title: const Text('Halaman Utama'),
    // Bagian redirection ke MyHomePage
    onTap: () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ));
    },
  ),
  ListTile(
    leading: const Icon(Icons.add_shopping_cart),
    title: const Text('Tambah Produk'),
    // Bagian redirection ke ShopFormPage
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ShopFormPage()));
    },
  ),
  ```

- checklist 4: sudah dijawab di readme.md

# - Tugas 9 -

## Menjawab beberapa pertanyaan berikut pada README.md pada root folder.

### Pertanyaan 1: Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, dalam pengembangan aplikasi menggunakan Flutter (untuk frontend) dan Django (untuk backend), Anda bisa melakukan pengambilan data JSON tanpa harus membuat model khusus terlebih dahulu. Untuk sekala aplikasi yang bertujuan untuk prototyping cepat ini approach yang baik dan dapat ditolerir, namun tidak jika skala aplikasi lebih besar dan kompleks serta banyak data yang perlu di passing

### Pertanyaan 2: Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Cookie request dipakai untuk menyimpan informasi yang sudah di passing oleh django sebagai cookie ke client, sehingga penting untuk digunakan pada flutter agar frontend atau tampilan pada flutter selaras dengan informasi backend pada django

### Pertanyaan 3: Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

Pengambilan data dari json sehingga ditampilkan pada flutter mirip seperti ajax pada web application dimana kita melakukan akses pada suatu url dan menerima response data dari server atau url yang kita akses. Kemudian data-data JSON tersebut kita parse menjadi string dan dimasukkan ke dalam list baru sebagai instance dari suatu model yang telah kita selaraskan dengan django model. Sehingga item-item tersebut hanya perlu diakses melalui list yang disediakan dalam class yang telah di define.

### Pertanyaan 4: Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Flutter mem passing data ke authentication app di django yang khusus untuk external app nya. Flutter melakukan passing untuk username dan password yang di input di flutter. Kemudian django melakukan login pada string-string yang telah di passing oleh flutter dan apabila berhasil login maka akan memberikan success response dan menyiapkan cookie untuk penggunaan user pada lain waktu. Setelah berhasil login flutter akan melakukan navigation ke page berikutnya. Apabila user gagal untuk melakukan login maka django akan mengembalikan response error yang dapat dideteksi oleh flutter yang menandakan login gagal dan memunculkan popup.

### Pertanyaan 5: Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.

1. `MaterialApp`: Widget utama yang digunakan untuk menginisialisasi aplikasi. Biasanya merupakan parent utama dari widget kita. Biasanya digunakan untuk mengatur tema dan color palette dari applikasi kita..

2. `Scaffold`: Scaffold adalah template dasar yang digunakan untuk membuat tampilan seperti applikasi pada umumnya. Scaffold memiliki parameter `appbar`, dan `drawer` sebagai navigasi utama pada applikasi kita.

3. `AppBar`: Widget yang digunakan untuk membuat AppBar (Panel yang ada di atas applikasi).

4. `SingleChildScrollView`: Widget yang memungkinkan childnya dapat discroll. Digunakan untuk membungkus konten utama.

5. `Column`: Widget yang menampilkan elemen-elemen secara vertikal, child dari widget ini adalah list of widget / kumpulan dari widget yang akan disusun secara vertikal.

6. `Text`: Widget untuk menampilkan teks. Dapat pula diatur font, warna, dan styling text disini.

7. `GridView.count`: Digunakan untuk membuat grid layout dengan jumlah kolom yang diberikan.

8. `InkWell`: Digunakan untuk memberikan efek sentuhan. Ini memungkinkan untuk menangani interaksi pengguna. Biasanya diterapkan pada button.

### Pertanyaan 6 Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

- checklist 1: gagal :(
- checklist 2: <br>
  halaman login dibuat dengan dua input textfield yang satunya password yang kemudian melakukan passing data ke django untuk ke login view externalnya. Bila berhasil akan melakukan navigation push replacement ke main page dan bila login response gagal dari django akan melakukan popup tanpa menghilangkan input yang sudah tertulis
- checklist 3: <br>
  Integrasi dilanjutkan di django dengan menyediakan login view baru yang menerima request dari app external dari web app nya dan melakukan login terhadap data-data yang diberikan oleh reqest post method flutter.
- checklist 4: <br>
  model custom saya hanya perlu menambahkan tipe indomie serta kuantitas dari indomie nya. hal tersebut saya lakukan dengan menyalin json dari model saya dan convert di quicktype
- checklist 5: <br>
  flutter kali ini mengakses link yang melakukan return terhadap seluruh data json dari database django dan memberikan keterangan saat menampilkan sesuai dengan atribut-atribut model yang sudah di define di django
- checklist 6: <br>
  setiap item pada listview checklist 5 saya jadikan inkwell yang melakukan navigation ke detail page sesuai dengan konteks yang di passing ke detail page. Untuk detail page saya tampilkan seluruh atribut dari indomie yang diakses dengan mengakses seluruh atribut yang menempel apda context yang di passing melalui flutter. Selain itu. Seluruh bagian screen yang ada deskripsi mie saya jadikan tombol untuk kembali ke daftar item dengan navigation pop
