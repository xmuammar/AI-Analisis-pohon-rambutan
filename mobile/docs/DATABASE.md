# Database

Database SQLite dikelola dengan Drift executor dan migrasi eksplisit di `lib/data/database/schema.dart`. Migrasi tidak menghapus database. V1 membuat tabel relasional untuk kebun, pohon, observasi, perawatan, prediksi, model, sensor, backup, dan log.

Foto disimpan sebagai berkas privat aplikasi. Tabel `photos` hanya menyimpan path, checksum, tipe pengambilan, ukuran piksel, serta status dan alasan kualitas teknis. Kolom kualitas tersebut sudah menjadi bagian schema V1 sehingga penambahan Image Quality Engine tidak melakukan migrasi destruktif atau mengubah tabel aplikasi web.
