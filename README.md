# Flutter Praktek

Project latihan Flutter untuk materi dasar widget, layout, form, navigasi, toko
elektronik, dan konsumsi REST API. Aplikasi utama dimulai dari dashboard latihan;
halaman toko dan latihan dibuka melalui named route.

## Daftar isi

- [Menjalankan project](#menjalankan-project)
- [Struktur project](#struktur-project)
- [Ringkasan materi](#ringkasan-materi)
- [Materi Fetch API langkah demi langkah](#materi-fetch-api-langkah-demi-langkah)
- [Menambah halaman dan route](#menambah-halaman-dan-route)
- [Verifikasi](#verifikasi)
- [Catatan project](#catatan-project)

## Menjalankan project

Persyaratan: Flutter SDK yang mendukung Dart `^3.13.4` dan koneksi internet
untuk fitur yang mengambil data atau gambar dari jaringan.

```powershell
flutter pub get
flutter run -t lib/main.dart
```

Untuk memeriksa kode dan menjalankan tes:

```powershell
flutter analyze
flutter test
```

## Struktur project

```text
lib/
├── main.dart
├── routes/
│   └── app_routes.dart
├── pages/
│   ├── home_page.dart
│   ├── input_form.dart
│   ├── input_eskul.dart
│   ├── output_page.dart
│   ├── output_eskul.dart
│   ├── album_page.dart
│   ├── album_detail_page.dart
│   ├── post_page.dart
│   ├── post_detail_page.dart
│   └── elektronik/
├── models/
│   ├── album.dart
│   └── post.dart
├── services/
│   └── api_service.dart
├── constants/
│   └── api_constants.dart
├── Latihan/
├── list-view/
├── row_column/
├── sized_box/
└── helpers/
```

Folder platform `android/`, `ios/`, `web/`, `windows/`, `linux/`, dan `macos/`
berisi runner dan konfigurasi Flutter untuk masing-masing target. Tes otomatis
berada di `test/`.

## Ringkasan materi

### Dashboard, halaman, dan navigasi

- `main.dart` membuat `MaterialApp`, menggunakan `AppRoutes.home` sebagai
  halaman awal, dan mendaftarkan route dari `AppRoutes.routes`.
- `pages/home_page.dart` adalah dashboard **Daftar Latihan**. Kartu latihan
  membuka route masing-masing; tombol **Toko Online** membuka katalog.
- `routes/app_routes.dart` menghubungkan nama route dengan widget halaman.
- `navigator.dart` berisi contoh navigasi imperatif menggunakan
  `Navigator.push` dan `MaterialPageRoute`.

### Widget dan layout

- `Latihan/latihan_3.dart`: susunan `Row`, `Expanded`, `Container`, jarak,
  warna, border, dan teks untuk tiga kolom.
- `row_column/row_widget.dart`: menyusun beberapa anak secara horizontal dengan
  `Row` dan `mainAxisAlignment`.
- `row_column/column_widget.dart`: menyusun anak secara vertikal dengan
  `Column` dan menyisipkan `Row`.
- `row_column/row_column.dart`: menggabungkan `Row` dan `Column` untuk ikon
  Call, Message, dan Photo.
- `sized_box/expanded_widget.dart`: membagi ruang horizontal dengan
  `Expanded` dan nilai `flex`.
- `sized_box/sized_box_widget.dart`: mengatur ukuran tombol dan jarak dengan
  `SizedBox`.
- `sized_box/stack_widget.dart`: menumpuk widget dan menempatkan elemen dengan
  `Stack` serta `Positioned`.
- `sized_box/layout_satu.dart`, `layout_dua.dart`, dan `layout_empat.dart`:
  contoh layout kartu profil, gambar berbadge, dan profil dengan avatar
  bertumpuk.
- `helpers/size_helper.dart`: membaca ukuran layar melalui `MediaQuery`.
- `list-view/singlechild_scroll.dart`: konten satu kolom yang dapat digulir
  memakai `SingleChildScrollView`.

### List dan grid

- `list-view/list_view.dart`: daftar kontak dengan `ListView.builder`,
  `ListTile`, avatar, dan informasi pesan.
- `list-view/grid_view.dart`: contoh `GridView.builder`, model produk sederhana,
  kartu, gambar jaringan dengan loading/error state, dan format harga.

### Form dan pengiriman data antarhalaman

- `pages/input_form.dart`: formulir registrasi berisi nama, jenis kelamin,
  tanggal lahir, dan agama; memakai `Form`, validator, radio, dropdown,
  date picker, dan controller.
- `pages/output_page.dart`: menerima nilai form lewat constructor dan
  menampilkannya kembali.
- `pages/input_eskul.dart`: formulir pendaftaran ekstrakurikuler dengan data
  siswa, dropdown, radio, tanggal, dan validasi.
- `pages/output_eskul.dart`: kartu ringkasan hasil pendaftaran.
- `Latihan/latihan_container.dart`: latihan form eskul lain dengan controller,
  pilihan kelas, checkbox ekstrakurikuler, date picker, dan batas jumlah
  pilihan.
- `Latihan/latihan_container_2.dart`: kartu identitas menggunakan container,
  border, `Row`, dan `Column`.

Alur form umumnya: siapkan state dan controller, isi widget input di dalam
`Form`, validasi ketika tombol submit ditekan, lalu kirim data ke halaman hasil
melalui parameter constructor. Controller yang dibuat oleh `State` perlu
di-`dispose()`.

### Latihan tampilan profil dan feed

- `Latihan/latihan_4.dart`: halaman profil dengan app bar, foto/avatar,
  identitas, dan bagian layout profil.
- `Latihan/latihan_5.dart`: profil sosial dengan statistik, bio, tombol edit,
  daftar highlight horizontal, dan konten yang digulir.
- `Latihan/latihan_6.dart`: tiruan feed Instagram dengan bottom navigation,
  stories horizontal, daftar post vertikal, aksi ikon, dan caption.

### Toko elektronik

Tombol **Toko Online** di dashboard membuka `pages/elektronik/daftar_item_page.dart`.
Alurnya:

1. Katalog menampilkan produk dalam grid serta menyediakan pencarian dan filter
   kategori.
2. Kartu produk membuka `detail_item_page.dart`, yang menampilkan informasi,
   favorit, dan pengatur jumlah.
3. Tombol checkout membuka `checkout_page.dart`. Form ini mengumpulkan alamat,
   provinsi, label alamat, kurir, metode pembayaran, opsi asuransi/voucher/poin,
   lalu menghitung total.
4. Konfirmasi membuat halaman `struk_page.dart` berisi ringkasan transaksi.
5. `product_image.dart` menampilkan gambar produk dan ikon fallback jika gambar
   tidak tersedia.

Data katalog di `daftar_item_page.dart` masih berupa data contoh lokal; proses
checkout juga merupakan simulasi, bukan pembayaran sungguhan.

### API dan JSON

Implementasi API utama ada di bagian [Fetch API](#materi-fetch-api-langkah-demi-langkah).
Project memiliki model `Album` dan `Post`, layanan HTTP, halaman daftar, serta
halaman detail. Paket `http` dipakai untuk request dan izin internet Android
disiapkan di `android/app/src/main/AndroidManifest.xml`.

## Materi Fetch API langkah demi langkah

Fitur tutorial mengambil daftar post dari JSONPlaceholder, menampilkan loading,
error, dan data; item dapat dibuka ke halaman detail. Urutan pemrosesan datanya:

```text
request HTTP → response JSON → jsonDecode → model Dart → FutureBuilder → list
```

Endpoint post:

```text
https://jsonplaceholder.typicode.com/posts
```

### 1. Tambahkan package HTTP

Project sudah memakai package `http` yang dideklarasikan di `pubspec.yaml`.
Jika memulai implementasi ini pada project lain, tambahkan dengan:

```powershell
flutter pub add http
```

### 2. Izinkan koneksi internet di Android

Tambahkan permission berikut sebagai anak langsung `<manifest>` dan letakkan
sebelum `<application>` di `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

Permission ini sudah ada di project. Setelah mengubah manifest, hentikan lalu
jalankan ulang aplikasi; hot reload saja tidak cukup untuk perubahan konfigurasi
platform.

### 3. Simpan alamat API sebagai konstanta

`lib/constants/api_constants.dart` menyimpan alamat dasar serta endpoint:

```dart
class ApiConstants {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String postsEndpoint = '/posts';
}
```

URL disusun dengan menggabungkan `baseUrl` dan endpoint, bukan ditulis
berulang-ulang di widget.

### 4. Buat model dari bentuk JSON

Respons `/posts` berupa array JSON. Satu item mempunyai `userId`, `id`,
`title`, dan `body`. `lib/models/post.dart` mendefinisikan model `Post` dan
factory `Post.fromJson` untuk mengubah satu objek JSON menjadi objek Dart.

Pastikan nama key JSON sama persis, termasuk huruf besar-kecil. Endpoint album
berbeda: model `Album` hanya memiliki `userId`, `id`, dan `title`; `body` hanya
ada pada post.

### 5. Ambil dan ubah respons di service

`lib/services/api_service.dart` memisahkan request HTTP dari tampilan. Method
`fetchPosts()`:

1. Membuat `Uri` dari konstanta.
2. Memanggil `GET` dan membatasi waktu tunggu dengan timeout 10 detik.
3. Memastikan status HTTP `200`.
4. Memecahkan body memakai `jsonDecode`.
5. Mengubah setiap map menjadi `Post` dan mengembalikan `List<Post>`.
6. Mengubah timeout menjadi pesan yang bisa ditampilkan di halaman.

Method `fetchAlbums()` memakai alur GET, batas waktu, dan pemeriksaan status
yang sama untuk endpoint album. Method
`createPost(title, body)` menunjukkan request `POST`, header JSON, dan
pemeriksaan status `201`. JSONPlaceholder hanya API latihan: respons POST
berhasil, tetapi data tidak benar-benar disimpan.

### 6. Panggil fetch sekali saat halaman dibuat

`lib/pages/post_page.dart` menyimpan hasil pemanggilan sebagai
`late Future<List<Post>> _futurePosts`. Request pertama dibuat di `initState()`,
bukan di `build()`, sehingga rebuild widget tidak mengulang request.

Method `_reload()` mengganti Future dengan request baru. Tombol refresh dan
tombol **Coba lagi** sama-sama memanggil method ini.

### 7. Tangani semua keadaan dengan FutureBuilder

`FutureBuilder<List<Post>>` pada halaman daftar menangani keadaan ini secara
berurutan:

1. `snapshot.hasError`: tampilkan pesan error dan tombol **Coba lagi**.
2. Data belum tersedia: tampilkan `CircularProgressIndicator`.
3. Daftar kosong: tampilkan pesan bahwa data belum tersedia.
4. Data tersedia: bangun daftar dengan `ListView.builder`.

Jangan membaca `snapshot.data` sebelum memastikan data tersedia. `ListView`
dibuat secara lazy agar item hanya dibangun ketika diperlukan.

### 8. Buka halaman detail

Saat item post ditekan, halaman mengirim objek `Post` ke
`PostDetailPage(post: post)` melalui `Navigator.push` dan
`MaterialPageRoute`. Halaman detail menampilkan judul, isi, dan ID user.

### 9. Hubungkan ke dashboard project

Project ini tetap memakai named route agar dashboard dan halaman lain tidak
tergantikan:

1. Import `PostPage` di `lib/routes/app_routes.dart`.
2. Tambahkan konstanta route, saat ini `AppRoutes.posts` (`/posts`).
3. Daftarkan `PostPage` di map `AppRoutes.routes`.
4. Tambahkan item menu pada daftar `_latihan` di
   `lib/pages/home_page.dart`.

Detail post tidak memerlukan named route karena objek post dikirim langsung
melalui constructor. Route album menggunakan pola daftar dan detail yang sama.

### 10. Uji fitur API

```powershell
flutter analyze
flutter test
flutter run -t lib/main.dart
```

Tes `test/api_service_test.dart` memakai `MockClient`, sehingga dapat menguji
request GET dan POST beserta parsing model tanpa bergantung koneksi ke server.
Untuk uji manual, buka **Fetch API Post** dari dashboard, tunggu daftar tampil,
tekan salah satu post, lalu gunakan refresh. Jika jaringan terputus, halaman
seharusnya menampilkan error dan opsi mencoba lagi.

### Arti status HTTP yang digunakan

| Status | Arti pada tutorial |
|---|---|
| `200` | GET berhasil |
| `201` | POST berhasil membuat respons |
| `404` | Endpoint tidak ditemukan |
| `500` | Ada masalah di server |

### Troubleshooting API

| Gejala | Yang perlu diperiksa |
|---|---|
| Loading lama atau `SocketException` | Internet, izin Android, dan alamat endpoint |
| `Target of URI doesn't exist` | Path import, ejaan nama file, dan huruf besar-kecil |
| `Null` bukan tipe yang diharapkan | Key JSON dan tipe nilai pada `fromJson` |
| Fetch berulang setiap rebuild | Pastikan request dibuat di `initState()`, bukan `build()` |
| Halaman terus loading | Periksa `FutureBuilder`, koneksi, timeout, dan status response |
| Route tidak ditemukan | Pastikan nama route sama di dashboard dan `AppRoutes.routes` |
| Manifest berubah tapi aplikasi belum berubah | Stop lalu jalankan ulang aplikasi |

## Menambah halaman dan route

Ikuti pola yang sudah digunakan oleh project:

1. Buat file halaman baru dengan nama `snake_case.dart` dan widget
   `PascalCase`.
2. Import widget itu di `lib/routes/app_routes.dart`.
3. Tambahkan konstanta nama route di `AppRoutes`.
4. Daftarkan builder halaman pada `AppRoutes.routes`.
5. Jika halaman perlu dibuka dari dashboard, tambahkan `_LatihanMenu` di
   `lib/pages/home_page.dart`.
6. Jalankan `flutter analyze` dan `flutter test`.

## Verifikasi

Tes otomatis saat ini meliputi:

- `test/widget_test.dart`: dashboard, navigasi ke toko, dan membuka latihan.
- `test/api_service_test.dart`: parsing daftar post serta request POST dengan
  HTTP mock.

Perintah pemeriksaan:

```powershell
flutter analyze
flutter test
```

## Catatan project

- Skill khusus project ada di `.github/flutter-praktek/SKILL.md`, dengan
  referensi API di `.github/flutter-praktek/references/fetch-api.md` dan
  checklist di `.github/flutter-praktek/references/checklist.md`.
- `pages/about_page.dart` berisi implementasi toko elektronik alternatif
  mandiri dengan `main()` sendiri; aplikasi utama saat ini memakai halaman di
  `pages/elektronik/`.
- `pages/menu_page.dart` masih berupa `Placeholder`, dan route `/about` saat ini
  membuka `Scaffold` kosong. Keduanya belum menjadi alur utama dashboard.
- `pages/input_form.dart` dan `pages/about_page.dart` juga memiliki `main()`
  mandiri untuk percobaan. Untuk menjalankan aplikasi dashboard utama, gunakan
  `flutter run -t lib/main.dart`.
