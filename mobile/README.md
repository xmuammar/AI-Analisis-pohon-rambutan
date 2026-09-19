# AiAnalisRambutan Mobile

Aplikasi Android Flutter local-first untuk pemeriksaan dan catatan longitudinal pohon Rambutan Belereng. Semua source aplikasi baru berada di direktori ini dan tidak berbagi database dengan aplikasi web lama.

## Status fondasi

- Material 3, Riverpod, dan `go_router`.
- SQLite melalui Drift dengan migrasi skema v1 dan seed `RBT-001` sampai `RBT-012`.
- Dashboard, daftar/detail pohon, pemeriksaan terpandu, fallback manual, dan Developer Center skeleton.
- Model computer vision belum disertakan. UI menyatakan keadaan tersebut secara eksplisit dan tidak membuat hasil analisis palsu.

## Menjalankan

Memerlukan Flutter SDK dan Android SDK. Dari direktori `mobile`:

```bash
flutter pub get
dart format .
flutter analyze
flutter test
flutter build apk --debug
```
