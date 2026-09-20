# Pemeriksaan Photo-First

Urutan panduan adalah pohon penuh, daun/tajuk, batang/pangkal, tanah/zona akar, bunga, lalu buah. Pengguna dapat melewati langkah atau memakai mode manual/hybrid.

Kamera belakang dibuka langsung dari setiap langkah. Foto asli disalin ke penyimpanan privat aplikasi (`documents/photos/tree_<id>`) dan SQLite menyimpan metadata, checksum SHA-256, tipe pengambilan, serta path—bukan binary foto. Pengambilan ulang disimpan sebagai foto baru agar raw data tidak tertimpa.

Sebelum metadata foto dicatat, Image Quality Engine lokal menghitung resolusi, pencahayaan, eksposur ekstrem, kontras, dan detail visual dari pixel foto. Statusnya `GOOD`, `ACCEPTABLE`, `POOR`, atau `RETAKE_REQUIRED`, lengkap dengan alasan yang disimpan pada metadata foto. Ini adalah heuristik kualitas teknis, bukan inferensi kesehatan tanaman atau confidence AI. Foto berkualitas rendah tetap dipertahankan sebagai raw data, tetapi pengguna mendapat peringatan dan dapat langsung mengambil ulang.

Model visual belum terpasang. Aplikasi secara eksplisit tidak membuat prediksi atau confidence AI sampai model yang tervalidasi tersedia.
