Berikut adalah file readme.md untuk tugas PBP pasca uts Dhafin Fadhlan Kamal - 2206030861 dari kelas PBP A.

### - Tugas 7 -

## > checklist 1:

membuat program dimulai dengan menjalankan flutter create "mie_katalog_mobile" yang membuat kerangka kerja dengan bahasa pemrograman dart. Aplikasi yang dibuat akan memuat beberapa widget seperti tombol, appbar, dan title yang akan menjadi home page dari aplikasi. Aplikasi tersebut akan menjalankan scaffold dari main.dart yang memanggil widget-widget yang berada di menu.dart. Menu.dart itu mengandung widget-widget yang perlu ditampilkan pada halaman utama aplikasi.

## > checklist 4:

# checklist 4.1:

    * Stateless Widget: Stateless widget adalah widget tanpa keadaan internal (state), yang berarti tampilan widget ini tidak berubah setelah dirender untuk pertama kalinya. Biasanya digunakan untuk elemen statis seperti teks, icon, gambar, dan sebagainya.
    * Stateful Widget: Stateful widget adalah jenis widget yang mampu mengubah tampilannya. Mereka memiliki keadaan internal (state) yang dapat diperbarui, dan ketika state berubah, widget akan dirender kembali sesuai perubahan tersebut. Stateful widget digunakan untuk elemen yang memerlukan interaksi, seperti form, pembaruan item, maupun infinite scroll bar.

# checklist 4.2:

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
