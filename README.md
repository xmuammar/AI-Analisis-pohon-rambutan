# AI - Analis Rambutan

Sistem analisis perkebunan rambutan jangka panjang yang menggabungkan aplikasi
Android Flutter dan aplikasi web Python Flask dalam satu repository. Sistem
dirancang untuk pemeriksaan berbasis foto, pencatatan historis 12 pohon Rambutan
Belereng, analisis AI lokal, rule-based reasoning, explainable AI, serta
pengembangan model di masa depan.

> **© 2026 · MILIK PEMILIK SAH · AI - ANALIS RAMBUTAN**  
> Hak cipta dan seluruh data aplikasi adalah milik pemilik sah aplikasi.

## Repository dan struktur

Repository: <https://github.com/xmuammar/AI-Analisis-pohon-rambutan>

Branch default saat ini: `feature/ai-analis-rambutan-mobile`

```text
AI-Analisis-pohon-rambutan/
├── mobile/                 # Aplikasi Android Flutter
│   ├── lib/ai/             # Pemeriksaan kualitas dan fondasi AI lokal
│   ├── lib/data/database/  # SQLite/Drift dan migrasi mobile
│   ├── lib/features/       # Dashboard, pohon, kamera, inspeksi
│   ├── lib/storage/        # Penyimpanan foto privat dan checksum
│   └── test/
├── web/                    # Aplikasi web Python Flask
│   ├── app/                # Application factory, blueprint, model, AI, routes
│   ├── migrations/         # Alembic/Flask-Migrate
│   ├── model_manifests/    # Manifest model dan checksum
│   ├── templates/          # Jinja2 templates
│   └── tests/
├── AGENTS.md               # Spesifikasi induk pengembangan
└── README.md
```

Mobile dan web memiliki database lokal masing-masing. Keduanya memakai domain
data yang sama, tetapi database tidak dibagikan secara langsung.

## Fitur utama

- Photo-first agricultural inspection melalui kamera atau upload foto.
- Guided camera dengan tahapan foto pohon penuh, daun, batang, tanah, bunga,
  dan buah.
- Pemeriksaan kualitas foto: blur, brightness, exposure, framing, dan
  kelayakan analisis.
- Auto-fill field pemeriksaan dari hasil visual yang tersedia.
- Human-in-the-loop untuk konfirmasi dan koreksi hasil AI.
- Dashboard kondisi kebun, prioritas pohon, tren, timeline, dan detail pohon.
- Database longitudinal untuk:
  - kebun dan pohon,
  - sesi observasi,
  - tanah, daun, tunas, batang, pertumbuhan,
  - bunga, buah, hama, penyakit, gulma,
  - penyiraman, pemupukan, pemangkasan, cuaca,
  - panen, koreksi pengguna, label, prediksi, dan log.
- Virtual Soil Sensor berbasis kelas visual, tanpa mengarang angka kelembapan,
  pH, EC, atau NPK.
- Feature engineering, trend analysis, anomaly screening, risk scoring,
  confidence scoring, ensemble, rekomendasi, dan XAI evidence.
- Backup JSON, checksum SHA-256, restore preview, dan kesiapan migrasi.
- Developer Center untuk diagnostics, katalog runtime, model, database, dan
  data science.
- Watermark kepemilikan pada seluruh halaman web melalui shared layout.

## Algoritma dan runtime AI

Pipeline umum:

```text
Foto
→ Quality Gate
→ Feature Extraction
→ Object Detection
→ Classification
→ Embedding
→ Segmentation
→ Agricultural Screening
→ Feature Engineering
→ Rule/ML Ensemble
→ Confidence dan XAI
→ Auto-fill
→ Konfirmasi pengguna
→ Penyimpanan historis
```

Komponen yang didukung atau disiapkan:

- **Computer vision:** YOLO11 Nano, YOLO-compatible runtime, RT-DETR,
  MobileNetV3, EfficientNet-compatible family, Vision Transformer-compatible
  architecture, DeepLabV3, U-Net/SAM-compatible segmentation, embedding,
  visual anomaly, dan depth/reference measurement abstraction.
- **Classification:** Logistic Regression, Decision Tree, Random Forest,
  Gradient Boosting/XGBoost-compatible, SVM, KNN, dan Naive Bayes.
- **Regression:** Linear Regression, Random Forest Regression, dan Gradient
  Boosting Regression.
- **Anomaly dan clustering:** Isolation Forest, One-Class SVM, statistical
  deviation, historical deviation, K-Means, dan DBSCAN.
- **Time series:** moving average, EWMA, rolling statistics, trend slope,
  ARIMA-style abstraction, LSTM/GRU readiness.
- **Explainable AI:** feature importance, permutation importance, SHAP,
  SHAP-like evidence, LIME, Grad-CAM, heatmap, segmentation overlay,
  counterfactual, model agreement, confidence calibration, dan prediction
  provenance.
- **Hybrid reasoning:** rule-based expert system + visual features + model
  outputs + historical baseline + ensemble.

Runtime model yang tersedia atau dipasang pada web dapat mencakup PyTorch,
torchvision, Ultralytics, ONNX Runtime, OpenCV, scikit-learn, Transformers,
SHAP, LIME, dan Pillow. Ketersediaan aktual ditampilkan di halaman **Tentang
Algoritma** dan Developer Center.

Model umum tidak boleh dipresentasikan sebagai diagnosis hama/penyakit
pertanian khusus. Jika model, dataset, histori, atau kalibrasi belum cukup,
sistem menggunakan `NOT_INSTALLED`, `INSUFFICIENT_DATA`, `UNKNOWN`, atau
`NEEDS_CONFIRMATION`.

## Model pack saat ini

Manifest model berada di `web/model_manifests`:

- YOLO11 Nano: object detection umum.
- MobileNetV3 Large: klasifikasi ImageNet umum.
- MobileNetV3 Large backbone: embedding visual.
- DeepLabV3 MobileNetV3 Large: semantic segmentation umum.

Binary model disimpan di `web/instance/models` pada environment lokal dan tidak
disimpan sebagai binary besar di database. Setiap model yang digunakan harus
memiliki version, runtime, checksum, status, dan provenance.

## Menjalankan aplikasi web

Memerlukan Python 3.12+ dan dependency sistem yang sesuai.

```bash
cd web
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt
pip install -r requirements-dev.txt
cp .env.example .env
flask --app run.py run --debug
```

Buka <http://127.0.0.1:5000>, buat akun lokal, lalu pilih salah satu dari
12 pohon awal:

```text
RBT-001 sampai RBT-012
```

Konfigurasi penting:

- `SECRET_KEY`: secret runtime, jangan commit nilai produksi.
- `DATABASE_URL`: default SQLite; dapat diarahkan ke PostgreSQL.
- `AUTO_CREATE_SCHEMA`: aktif untuk development, nonaktif untuk production.
- `UPLOAD_FOLDER` dan `MODEL_FOLDER`: lokasi file foto/model di luar database.

## Database dan migration web

SQLite adalah default development. SQLAlchemy dan Flask-Migrate/Alembic
digunakan untuk versioning schema.

```bash
cd web
flask --app run.py db upgrade
flask --app run.py seed-data
flask --app run.py db check
```

Jangan menghapus database untuk menyelesaikan perubahan schema. Data mentah,
observasi, pengukuran, koreksi, label, histori perawatan, dan panen harus
dipertahankan.

## Menjalankan aplikasi mobile

Memerlukan Flutter SDK dan Android SDK.

```bash
cd mobile
flutter pub get
dart format .
flutter analyze
flutter test
flutter build apk --debug
```

Mobile menggunakan Material 3, Riverpod, `go_router`, SQLite melalui Drift,
migrasi schema, seed 12 pohon, guided camera, photo storage privat, checksum,
quality engine lokal, fallback manual, dan Developer Center skeleton.

## Pengujian dan quality gate

Web:

```bash
cd web
.venv/bin/black --check app tests
.venv/bin/ruff check app tests
PYTHONPATH=. .venv/bin/pytest -q
git diff --check
```

Mobile:

```bash
cd mobile
dart format --output=none --set-exit-if-changed .
flutter analyze
flutter test
```

Test mencakup initialization database, seed pohon, autentikasi, tree CRUD,
inspection, photo quality, field aggregation, soil/leaf screening, flower/fruit
screening, problem solver, advanced AI, training readiness, backup, model
catalog, dan provenance.

## Prinsip data dan keamanan

- UI utama menggunakan Bahasa Indonesia.
- Raw data tidak ditimpa oleh AI.
- Setiap hasil membedakan `OBSERVED`, `MEASURED`, `ESTIMATED`, `INFERRED`,
  `PREDICTED`, dan `USER_CONFIRMED`.
- Tidak ada false precision untuk kelembapan tanah, pH, EC, NPK, tinggi,
  diameter, atau ukuran buah tanpa sensor/reference calibration.
- Foto dan model binary tidak disimpan sebagai blob besar di SQLite.
- Secret, API key, token, password, OAuth credential, dan service account
  tidak boleh masuk Git.
- AI online harus opt-in; local-first tetap dapat berjalan tanpa internet.
- Kegagalan model harus jatuh ke rule/manual fallback, bukan hasil sukses palsu.
- Koreksi pengguna disimpan sebagai histori dan dapat menjadi label training
  setelah validasi.
- Watermark membantu menandai kepemilikan, tetapi bukan pengganti autentikasi,
  pembatasan akses server, lisensi, audit log, dan perlindungan repository.

## Backup dan pemulihan

Backup harus mencakup metadata schema, app version, timestamp, garden, trees,
observations, growth, care events, weather, flowering, fruit, pest, disease,
harvest, corrections, labels, prediction metadata, model metadata, dan settings.

Foto dapat dicadangkan terpisah. Restore yang aman harus melakukan validasi
format, schema version, checksum, preview, integrity check, emergency backup,
restore, dan integrity check ulang.

## Dokumentasi lanjutan

- [Spesifikasi induk](AGENTS.md)
- [Dokumentasi web](web/README.md)
- [Dokumentasi mobile](mobile/README.md)
- [Web model manifests](web/model_manifests/)

## Status pengembangan

Repository ini menggabungkan branch mobile dan Flask web ke branch default
`feature/ai-analis-rambutan-mobile`. Aplikasi siap dikembangkan secara modular;
model pertanian khusus rambutan, dataset berlabel, sensor fisik, deployment
production, dan integrasi cloud tetap memerlukan konfigurasi serta validasi
terpisah.
