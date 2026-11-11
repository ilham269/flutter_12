# Checklist dan error umum

## Sebelum menyatakan selesai
- [ ] Semua import benar dan file yang diimpor ada
- [ ] Nama class, route, dan konstanta konsisten di semua file
- [ ] Route baru sudah masuk `app_routes.dart` dan (kalau perlu) menu `HomePage`
- [ ] Tidak ada file lain yang diubah tanpa perlu
- [ ] `flutter analyze` bersih, atau sudah cek manual kalau tidak bisa dijalankan
- [ ] Kalau memakai internet: izin INTERNET sudah ada

## Error umum
| Gejala | Penyebab | Perbaikan |
|---|---|---|
| Loading terus / SocketException | Tidak ada internet atau izin INTERNET belum ada | Cek koneksi dan manifest, jalankan ulang |
| `type 'Null' is not a subtype...` | Key di `json['...']` salah ketik | Samakan dengan JSON asli |
| Layar memuat ulang terus | Fetch dipanggil di `build()` | Pindah ke `initState()` |
| `Could not find a generator for route` | Nilai route salah atau belum didaftarkan | Cek `app_routes.dart` |
| `Target of URI doesn't exist` | Path import atau nama file salah | Cek folder dan huruf besar kecil |
| `on` / `catch` merah | `on` ditulis di dalam blok `try` | Tutup `try` dulu, lalu tulis `on ...` |
| Error key `body` pada album | Album tidak punya `body` | Hapus field `body` dari model dan UI |
| Perubahan tidak terbaca | Hanya hot reload | Stop, lalu `flutter run` lagi |

Baca pesan error dari atas; baris pertama biasanya sudah menjelaskan masalahnya.
