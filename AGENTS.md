================================================================================
MASTER INSTRUCTION CODEX
PROYEK: AiAnalisRambutan
VERSI SPESIFIKASI: 2.0
BAHASA: INDONESIA
STATUS: SPESIFIKASI INDUK / MASTER PROJECT SPECIFICATION
================================================================================


================================================================================
A. IDENTITAS PROYEK
================================================================================

Nama aplikasi:
AiAnalisRambutan

Repository GitHub:
xmuammar/AI-analisis-rambutan-lapangan

Folder aplikasi Android baru:
/mobile

Platform utama:
Android

Teknologi utama:
Flutter + Dart

Arsitektur:
Local-first + Internet-enhanced + AI hybrid

Database utama:
SQLite + Drift

Target awal:
12 pohon Rambutan Belereng

Kode pohon awal:

RBT-001
RBT-002
RBT-003
RBT-004
RBT-005
RBT-006
RBT-007
RBT-008
RBT-009
RBT-010
RBT-011
RBT-012


================================================================================
B. ATURAN PENTING REPOSITORY
================================================================================

Repository ini SUDAH memiliki aplikasi web lama.

WAJIB:

1. Jangan menghapus aplikasi web lama.
2. Jangan merusak aplikasi web lama.
3. Jangan memindahkan source aplikasi web lama.
4. Jangan mengganti database aplikasi web lama.
5. Jangan menghapus commit/history lama.
6. Jangan melakukan force push.
7. Jangan mengubah file existing kecuali memang diperlukan dan aman.
8. Seluruh source Android baru wajib berada di:

/mobile

Struktur konseptual:

AI-analisis-rambutan-lapangan/
├── app/                 aplikasi web lama
├── db/                  database web lama
├── public/              aset web lama
├── ...
└── mobile/              aplikasi Android Flutter baru

Sebelum coding:

- inspeksi repository
- identifikasi batas aplikasi web lama
- catat file yang tidak boleh disentuh
- pastikan /mobile aman digunakan


================================================================================
C. PERAN CODEX
================================================================================

Bertindaklah sebagai gabungan:

- Lead Software Architect
- Senior Flutter Engineer
- Android Engineer
- Database Engineer
- Machine Learning Engineer
- Computer Vision Engineer
- Data Scientist
- MLOps Engineer
- Explainable AI Engineer
- Backend/Integration Engineer
- DevOps Engineer
- System Administrator
- QA Engineer
- Security Engineer
- Agricultural Decision Support Engineer
- Technical Documentation Engineer

Jangan perlakukan project ini sebagai:

- demo
- mockup
- CRUD sederhana
- tugas sekolah
- proof of concept kecil
- aplikasi checklist biasa

Perlakukan sebagai:

SISTEM ANALISIS PERKEBUNAN JANGKA PANJANG

yang dapat berkembang selama bertahun-tahun.


================================================================================
D. FILOSOFI PRODUK
================================================================================

Prinsip utama:

"AI tidak boleh terlihat rumit,
tetapi analisisnya harus dalam."

Pengguna biasa harus merasa:

"Saya sedang memeriksa kebun rambutan."

Bukan:

"Saya sedang mengoperasikan machine learning."

Machine Learning, Computer Vision, XAI, Ensemble, Database Engine,
Model Management, Backup Engine dan lain-lain bekerja di belakang layar.


================================================================================
E. KARAKTER PRODUK
================================================================================

AiAnalisRambutan harus berkembang menjadi gabungan:

- sistem inspeksi tanaman
- database longitudinal
- computer vision platform
- machine learning platform
- agricultural decision support system
- sistem prediksi
- sistem explainable AI
- sistem dokumentasi
- sistem laporan
- sistem monitoring pertumbuhan
- sistem monitoring perawatan
- sistem panen
- sistem backup
- sistem developer engineering console

Semuanya berada dalam satu aplikasi Android.


================================================================================
F. SKALA APLIKASI
================================================================================

Ukuran aplikasi BUKAN prioritas utama.

Aplikasi boleh:

- ratusan MB
- 1 GB
- 3 GB
- 5 GB
- lebih besar

jika memang diperlukan untuk:

- model AI
- model computer vision
- segmentation
- depth estimation
- embedding
- object detection
- inference offline
- peningkatan kualitas analisis

Namun ukuran harus dikelola secara modular.


================================================================================
G. PENGALAMAN PENGGUNA UTAMA
================================================================================

Alur ideal pengguna:

Buka aplikasi
↓
Pilih pohon
↓
Mulai pemeriksaan
↓
Kamera terbuka
↓
Foto dipandu
↓
AI menganalisis
↓
Data otomatis diekstrak
↓
Form otomatis terisi
↓
Hanya data tidak pasti yang diminta konfirmasi
↓
Simpan
↓
Database diperbarui
↓
Feature Engineering berjalan
↓
AI melakukan analisis
↓
XAI menjelaskan
↓
Dashboard diperbarui

Tujuan:

MINIMALKAN INPUT MANUAL.


================================================================================
H. PHOTO-FIRST INSPECTION
================================================================================

Pemeriksaan utama WAJIB menggunakan konsep:

PHOTO-FIRST AGRICULTURAL ANALYSIS

Ketika pengguna:

Pohon Saya
→ Pohon 01
→ Mulai Pemeriksaan

JANGAN langsung membuka form panjang.

Buka:

GUIDED CAMERA INSPECTION


================================================================================
I. URUTAN FOTO
================================================================================

Default:

1. Foto Pohon Penuh
2. Foto Daun / Tajuk
3. Foto Batang / Pangkal
4. Foto Tanah / Zona Akar
5. Foto Bunga jika ada
6. Foto Buah jika ada

Pengguna boleh:

- skip
- tambah foto
- retake
- input manual
- gunakan pemeriksaan hybrid


================================================================================
J. MODE PEMERIKSAAN
================================================================================

Support:

PHOTO_FIRST
MANUAL
HYBRID

Default:

PHOTO_FIRST


================================================================================
K. GUIDED CAMERA
================================================================================

Berikan panduan visual.

Contoh:

FOTO POHON PENUH

"Pastikan pangkal dan pucuk terlihat."

FOTO DAUN

"Ambil daun yang mewakili kondisi umum pohon."

FOTO BATANG

"Ambil batang utama dengan jelas."

FOTO TANAH

"Ambil tanah sekitar zona akar."


================================================================================
L. IMAGE QUALITY ENGINE
================================================================================

Sebelum inference:

periksa:

- blur
- fokus
- brightness
- exposure
- overexposure
- underexposure
- motion blur
- framing
- object coverage
- tree visibility
- leaf visibility
- trunk visibility
- soil visibility
- obstruction

Status:

GOOD
ACCEPTABLE
POOR
RETAKE_REQUIRED

Contoh:

"Foto terlalu gelap."

"Batang tidak terlihat utuh."

"Foto daun terlalu buram."

Jangan lanjutkan analisis berkualitas rendah tanpa peringatan.


================================================================================
M. COMPUTER VISION PIPELINE
================================================================================

Pipeline:

Foto
↓
Preprocessing
↓
Quality Assessment
↓
Scene Detection
↓
Tree Detection
↓
Object Detection
↓
Segmentation
↓
Feature Extraction
↓
Measurement Estimation
↓
Classification
↓
Anomaly Detection
↓
Historical Comparison
↓
XAI
↓
Auto Form Mapping
↓
Human Verification


================================================================================
N. ANALISIS FOTO POHON PENUH
================================================================================

Ekstrak jika memungkinkan:

- bentuk tajuk
- kepadatan tajuk
- perubahan tajuk
- distribusi daun
- cabang utama
- cabang patah
- cabang mati
- kemiringan pohon
- struktur tanaman
- kesehatan umum visual
- anomali struktur
- tinggi perkiraan
- lebar tajuk
- vigor visual


================================================================================
O. ANALISIS FOTO DAUN
================================================================================

Ekstrak:

leaf_color
leaf_color_uniformity

leaf_wilt
leaf_drop

new_leaf_present
new_leaf_count_estimate

chlorosis
necrosis

leaf_spots
leaf_holes
leaf_curl

leaf_damage_percent

leaf_cleanliness

visual_health_score

visible_pest

visible_disease_symptom


================================================================================
P. ANALISIS TUNAS
================================================================================

Ekstrak:

new_shoot_present
new_shoot_count_estimate
shoot_condition
shoot_color
shoot_vigor
shoot_length_estimate


================================================================================
Q. ANALISIS BATANG
================================================================================

Ekstrak:

stem_visible

physical_damage
wound
crack
discoloration

stem_diameter_estimate
stem_circumference_estimate

branching_point
bark_condition


================================================================================
R. ANALISIS BUNGA
================================================================================

Ekstrak:

flower_present

flower_stage

NONE
BUD
EARLY_FLOWERING
FLOWERING
FULL_BLOOM
FINISHING

flower_cluster_count
flower_cluster_estimate

flower_abundance

flower_drop_visual


================================================================================
S. ANALISIS BUAH
================================================================================

Ekstrak:

fruit_present

fruit_stage:

NONE
FRUIT_SET
YOUNG
DEVELOPING
NEAR_RIPE
RIPE

fruit_cluster_count
fruit_count_estimate

fruit_size_estimate
fruit_average_diameter_mm

fruit_color
fruit_ripeness

fruit_damage_percent

fruit_drop_visual


================================================================================
T. ANALISIS HAMA
================================================================================

Ekstrak:

pest_visible
probable_pest_category
pest_count_estimate
affected_part
affected_percent
visual_damage_percent

Jika tidak yakin:

probable_pest_category = UNKNOWN

Jangan memaksakan diagnosis.


================================================================================
U. ANALISIS PENYAKIT
================================================================================

Ekstrak:

disease_symptom_visible
probable_disease_category
symptom_type
affected_part
affected_percent
severity_estimate

Jika tidak yakin:

disease_type = UNKNOWN


================================================================================
V. ANALISIS GULMA
================================================================================

Ekstrak:

weed_present
weed_level
weed_coverage_percent
weed_height_estimate
weed_density_estimate


================================================================================
W. ANALISIS TANAH PERMUKAAN
================================================================================

Ekstrak:

soil_surface_condition

soil_visual_wetness

visible_cracks

mud_presence

standing_water

erosion_visual

mulch_present

weed_coverage

surface_texture_visual


================================================================================
X. VIRTUAL SOIL SENSOR
================================================================================

Tidak ada sensor fisik tanah.

Tetap buat:

VIRTUAL SOIL SENSOR

Tujuan:

memperkirakan kondisi tanah zona akar menggunakan AI.


================================================================================
Y. INPUT VIRTUAL SOIL SENSOR
================================================================================

Gabungkan:

- foto tanah
- warna tanah
- tekstur visual
- retakan
- lumpur
- genangan
- kondisi gulma
- mulsa
- naungan
- paparan matahari
- penyiraman terakhir
- volume penyiraman
- frekuensi penyiraman
- waktu sejak penyiraman
- riwayat hujan
- intensitas hujan
- waktu sejak hujan
- kondisi daun
- layu
- kerontokan daun
- aktivitas tunas
- vigor pohon
- pertumbuhan
- kondisi tanah sebelumnya
- pola pengeringan historis
- drainase historis
- pola pohon tetangga
- musim
- waktu
- cuaca
- umur tanaman


================================================================================
Z. OUTPUT VIRTUAL SOIL SENSOR
================================================================================

Support:

root_zone_moisture_class

VERY_DRY
DRY
SLIGHTLY_DRY
MOIST
VERY_MOIST
SATURATED
POSSIBLE_WATERLOGGING

Tambahan:

dryness_risk
waterlogging_risk
root_stress_risk
soil_aeration_risk
drainage_estimate
estimated_drying_rate
estimated_days_until_dry
irrigation_need_probability


================================================================================
AA. PROBABILITAS VIRTUAL SOIL
================================================================================

Contoh:

Sangat kering         3%
Kering                7%
Agak kering          15%
Lembap               61%
Sangat lembap        11%
Tergenang             3%

Kesimpulan:

Zona akar diperkirakan lembap.

Confidence:
82%


================================================================================
AB. STATUS DATA
================================================================================

Semua data harus dibedakan:

OBSERVED
MEASURED
ESTIMATED
INFERRED
PREDICTED
USER_CONFIRMED
SENSOR_MEASURED


================================================================================
AC. LARANGAN FALSE PRECISION
================================================================================

Tanpa alat fisik:

JANGAN klaim:

kelembapan = 47.31%

pH = 6.42

EC = 1.17

NPK = nilai tertentu

kecuali benar-benar ada sensor/pengukuran.

Boleh:

"Zona akar diperkirakan lembap."

"Kemungkinan kekurangan air rendah."

"Risiko tanah terlalu basah sedang."


================================================================================
AD. XAI VIRTUAL SOIL
================================================================================

Contoh penjelasan:

Mengapa tanah diperkirakan lembap?

- Tanah permukaan terlihat gelap.
- Penyiraman 2 liter dilakukan 2 hari lalu.
- Hujan sedang tercatat kemarin.
- Daun tidak menunjukkan layu.
- Pola historis menunjukkan tanah biasanya mengering setelah 3 hari.

Semua alasan harus berasal dari data nyata yang tersedia.


================================================================================
AE. FUTURE SENSOR COMPATIBILITY
================================================================================

Schema harus siap menerima sensor suatu hari nanti.

Contoh:

root_zone_moisture

value
source

source:

AI_INFERRED
MANUAL
SENSOR_MEASURED

Dengan demikian dapat dibandingkan:

AI estimation
vs
sensor measurement.


================================================================================
AF. PENGUKURAN DARI FOTO
================================================================================

Support:

tree_height_cm
stem_diameter_cm
stem_circumference_cm
canopy_width_cm
canopy_height_cm
fruit_diameter_mm

Gunakan bila tersedia:

- ARCore
- Depth API
- reference marker
- known-size object
- camera geometry
- segmentation
- monocular depth
- multi-view estimation


================================================================================
AG. REFERENSI UKURAN
================================================================================

Support:

reference marker
10 cm marker
ArUco-style marker
known-size card
ruler

Digunakan untuk kalibrasi ukuran.


================================================================================
AH. DATA PENGUKURAN
================================================================================

Simpan:

measurement_value

measurement_min

measurement_max

confidence

measurement_method

source_photo_id

model_version


================================================================================
AI. AUTO FORM FILL
================================================================================

Setelah AI selesai:

JANGAN tampilkan form kosong.

Tampilkan:

21 data terisi otomatis
4 perlu konfirmasi
2 belum dapat ditentukan

Button:

[Periksa Data Tidak Pasti]

[Lihat Semua Data]


================================================================================
AJ. DYNAMIC FORM ENGINE
================================================================================

Jika:

flower_present = false

sembunyikan detail bunga.

Jika:

fruit_present = false

sembunyikan detail buah.

Jika:

pest_present = false

sembunyikan detail hama.

Jika:

disease_present = false

sembunyikan detail penyakit.

Tujuan:

mengurangi pekerjaan pengguna.


================================================================================
AK. HUMAN-IN-THE-LOOP
================================================================================

Jika AI:

leaf_color = LIGHT_GREEN

User:

GREEN

Simpan:

ai_original_value
ai_confidence
user_final_value
was_corrected
correction_datetime
correction_source


================================================================================
AL. KOREKSI SEBAGAI LABEL
================================================================================

Koreksi user dapat digunakan sebagai:

training label
validation label
human ground truth

jika kualitas label memenuhi syarat.


================================================================================
AM. DATA PROVENANCE
================================================================================

Setiap field penting harus tahu sumbernya.

Sources:

MANUAL
VISUAL_OBSERVATION
COMPUTER_VISION
LOCAL_AI
REMOTE_AI
HYBRID_AI
AR_MEASUREMENT
IMAGE_ESTIMATION
HISTORY_INFERRED
AI_INFERRED
DERIVED
USER_CONFIRMED
USER_CORRECTED
SENSOR_MEASURED


================================================================================
AN. DATABASE
================================================================================

Gunakan:

SQLite
Drift

Relational database.

Jangan simpan seluruh aplikasi sebagai satu JSON blob.


================================================================================
AO. DATABASE VERSIONING
================================================================================

Gunakan migration versioning.

Jangan pernah menyelesaikan masalah schema dengan:

hapus database.

Data historis sangat penting.


================================================================================
AP. CORE TABLE
================================================================================

Minimal:

gardens

trees

observation_sessions

soil_observations
leaf_observations
shoot_observations
branch_observations
growth_measurements

flowering_observations
fruit_observations

pest_observations
disease_observations
weed_observations

weather_observations

watering_events
fertilizer_events
organic_fertilizer_events
pruning_events
tree_events

image_capture_sessions
photos

vision_predictions
field_predictions
measurement_predictions
soil_inference_predictions

user_corrections

ml_labels
ml_predictions

ai_model_metadata
model_versions
model_evaluations

harvests

backup_history
restore_history

system_logs
database_logs
ai_logs
vision_logs
training_logs
backup_logs


================================================================================
AQ. GARDEN TABLE
================================================================================

Fields:

garden_id
garden_name
location_name
area_m2
tree_count
default_spacing_cm
description
created_at
updated_at


================================================================================
AR. TREE TABLE
================================================================================

Fields:

tree_id
tree_code
garden_id

variety
source

purchase_date
planting_date

row_number
column_number
spacing_cm

initial_height_cm
initial_stem_circumference_cm
initial_stem_diameter_cm
initial_canopy_ns_cm
initial_canopy_ew_cm

initial_flowering
initial_condition
root_condition_initial
planting_method

status
active

created_at
updated_at


================================================================================
AS. OBSERVATION SESSION
================================================================================

Fields:

observation_id
tree_id

observation_datetime
days_after_planting

observer

inspection_mode

PHOTO_FIRST
MANUAL
HYBRID

observation_quality

general_condition

notes

created_at
updated_at


================================================================================
AT. SOIL OBSERVATION
================================================================================

Fields:

soil_visual_condition

soil_moisture_visual

VERY_DRY
DRY
SLIGHTLY_DRY
MOIST
VERY_MOIST
WET
WATERLOGGED

soil_surface_condition
soil_check_depth_cm
soil_compaction
soil_drainage

standing_water
standing_water_depth_cm

soil_crack_level
soil_erosion

mulch_present
mulch_thickness_cm

root_zone_estimate
root_zone_confidence


================================================================================
AU. LEAF TABLE
================================================================================

Fields:

leaf_color
leaf_color_uniformity
leaf_wilt
leaf_drop
new_leaf_present
new_leaf_count_estimate

chlorosis
necrosis
leaf_spots
leaf_holes
leaf_curl

leaf_damage_percent

leaf_cleanliness

visual_health_score


================================================================================
AV. SHOOT TABLE
================================================================================

Fields:

new_shoot_present
new_shoot_count
shoot_length_cm
shoot_condition
shoot_color
vegetative_vigor


================================================================================
AW. BRANCH TABLE
================================================================================

Fields:

branch_new_count
branch_dead_count
branch_broken_count
physical_damage
physical_damage_severity
damage_description


================================================================================
AX. GROWTH TABLE
================================================================================

Fields:

height_cm

stem_circumference_cm
stem_diameter_cm

canopy_ns_cm
canopy_ew_cm
canopy_height_cm

primary_branch_count
lowest_branch_height_cm

measurement_method
measurement_confidence


================================================================================
AY. FLOWERING TABLE
================================================================================

Fields:

flower_present

flower_stage

NONE
BUD
EARLY_FLOWERING
FLOWERING
FULL_BLOOM
FINISHING

flower_cluster_count
flower_cluster_estimate

flower_abundance

flower_drop_level

pollination_activity

first_flower_date


================================================================================
AZ. FRUIT TABLE
================================================================================

Fields:

fruit_present

fruit_stage

NONE
FRUIT_SET
YOUNG
DEVELOPING
NEAR_RIPE
RIPE

fruit_cluster_count
fruit_count_estimate

fruit_drop_count
fruit_drop_level

fruit_damage_percent

fruit_average_diameter_mm
fruit_color

first_fruit_date


================================================================================
BA. PEST TABLE
================================================================================

Fields:

pest_present
pest_type
pest_severity
pest_count_estimate
affected_part
affected_percent
pest_spread
insect_visible


================================================================================
BB. DISEASE TABLE
================================================================================

Fields:

disease_present
disease_type
symptom_type
disease_severity
affected_part
affected_percent
disease_spread


================================================================================
BC. WEED TABLE
================================================================================

Fields:

weed_level
weed_height_cm
weed_coverage_percent
weed_radius_percent
weed_removed
weed_removal_method


================================================================================
BD. WEATHER TABLE
================================================================================

Data cuaca sebaiknya pada level kebun.

Fields:

weather_datetime
weather
rain_since_last_check
rain_intensity
rain_duration_estimate
sun_condition
wind_condition
extreme_weather
extreme_weather_type


================================================================================
BE. WATERING EVENT
================================================================================

Fields:

watering_event_id
tree_id
watering_datetime
watering_liter
watering_method
watering_duration_min
watering_reason
created_at


================================================================================
BF. FERTILIZER EVENT
================================================================================

Fields:

fertilizer_event_id
tree_id
fertilizer_datetime
fertilizer_category
fertilizer_product
fertilizer_amount_g
manure_kg
application_method
distance_from_trunk_cm
soil_condition_before
watering_after


================================================================================
BG. PRUNING EVENT
================================================================================

Fields:

pruning_event_id
tree_id
pruning_datetime
pruning_type
branch_removed_count
reason
wound_condition


================================================================================
BH. TREE EVENT
================================================================================

Support:

CABANG_PATAH
POHON_MIRING
LUKA_BATANG
BANJIR
KEKERINGAN
SERANGAN_HEWAN
CUACA_EKSTREM
BUNGA_PERTAMA
BUAH_PERTAMA
PANEN_PERTAMA
LAINNYA


================================================================================
BI. HARVEST TABLE
================================================================================

Fields:

harvest_id
tree_id
harvest_date
fruit_count
harvest_weight_kg
average_fruit_weight_g
damaged_fruit_count
marketable_fruit_count
quality_grade
selling_price_per_kg
revenue


================================================================================
BJ. RAW DATA POLICY
================================================================================

RAW DATA jangan diganti oleh AI.

Simpan permanen:

observations
measurements
events
user corrections
harvests
labels

AI prediction dapat dihitung ulang.

Raw historical data tidak dapat dikembalikan jika hilang.


================================================================================
BK. LAPISAN DATA
================================================================================

Empat lapisan:

1. RAW DATA
2. EVENT DATA
3. DERIVED FEATURES
4. LABEL / OUTCOME


================================================================================
BL. FEATURE ENGINEERING
================================================================================

Hitung otomatis:

days_since_planting

days_since_last_watering
days_since_last_fertilizing
days_since_last_pruning

watering_total_24h
watering_total_3d
watering_total_7d
watering_total_14d
watering_total_30d

rain_events_3d
rain_events_7d
rain_days_30d

height_growth_7d
height_growth_14d
height_growth_30d
height_growth_90d

stem_growth_30d
stem_growth_90d

canopy_growth_30d
canopy_growth_90d

new_shoot_total_7d
new_shoot_total_30d

consecutive_dry_checks
consecutive_wet_checks

consecutive_leaf_wilt
consecutive_chlorosis

pest_frequency_30d
disease_frequency_30d

days_since_first_flower
days_since_first_fruit

flower_to_fruit_days

fruit_drop_rate

leaf_damage_trend

visual_health_trend

soil_state_change_rate

historical_drying_rate

observation_frequency

measurement_age_days

photo_analysis_frequency


================================================================================
BM. PERSONALIZED BASELINE
================================================================================

Utamakan:

Pohon 07 hari ini
vs
Pohon 07 sebelumnya.

Bukan hanya:

Pohon 07
vs
Pohon 08.

Bangun baseline per pohon.


================================================================================
BN. MACHINE LEARNING ENGINE
================================================================================

Support modular architecture.


================================================================================
BO. RULE-BASED EXPERT SYSTEM
================================================================================

Tetap gunakan Expert Rules.

Berguna ketika data ML belum cukup.


================================================================================
BP. CLASSIFICATION
================================================================================

Support:

Logistic Regression
Decision Tree
Random Forest
Gradient Boosting
XGBoost-compatible runtime
SVM
KNN
Naive Bayes


================================================================================
BQ. REGRESSION
================================================================================

Support:

Linear Regression
Random Forest Regression
Gradient Boosting Regression


================================================================================
BR. ANOMALY DETECTION
================================================================================

Support:

Isolation Forest
One-Class SVM
Statistical Anomaly Detection
Historical Deviation Detection


================================================================================
BS. CLUSTERING
================================================================================

Support:

K-Means
DBSCAN


================================================================================
BT. DIMENSION REDUCTION
================================================================================

Support:

PCA

dan embedding reduction bila dibutuhkan.


================================================================================
BU. TIME SERIES
================================================================================

Support:

Moving Average
EWMA
Trend Slope
Rolling Statistics
ARIMA-style Forecasting
LSTM
GRU

Aktifkan hanya jika data cukup.


================================================================================
BV. NO FAKE ML
================================================================================

Jika data tidak cukup:

status:

INSUFFICIENT_DATA

Jangan mengarang prediksi.

Fallback:

Rule Engine
Trend
Statistics
Human Verification


================================================================================
BW. MODEL STATUS
================================================================================

Status:

NOT_INSTALLED
AVAILABLE
DOWNLOADING
INSTALLED
READY
ACTIVE
DISABLED
TRAINING
INSUFFICIENT_DATA
FAILED
UPDATE_AVAILABLE


================================================================================
BX. AI HYBRID
================================================================================

Gunakan:

LOCAL-FIRST
+
INTERNET-ENHANCED


================================================================================
BY. AI PROVIDER
================================================================================

Abstraction:

AIProvider

Implement architecture:

LocalAIProvider
RemoteAIProvider
CustomAIEndpointProvider

Future providers dapat ditambahkan.


================================================================================
BZ. AI ROUTER
================================================================================

Flow:

Foto
↓
Local AI
↓
Confidence Check

Jika tinggi:
gunakan local

Jika rendah + internet tersedia:
Remote AI

Gabungkan:

local
remote
history
rules

↓
ensemble
↓
final result


================================================================================
CA. REMOTE AI
================================================================================

Support:

self-hosted model
open-source inference server
REST API
hosted inference API
specialized agriculture AI
custom endpoint


================================================================================
CB. PRIVASI ONLINE AI
================================================================================

Harus opt-in.

Settings:

Gunakan AI Online
Wi-Fi Only
Upload Crop Saja
Upload Foto Penuh
Jangan Upload Original
Hapus Data Remote Jika Didukung


================================================================================
CC. IMAGE OPTIMIZATION
================================================================================

Sebelum upload:

crop
resize
compress
WebP/JPEG

Jangan upload 10 MB jika crop 300 KB cukup.


================================================================================
CD. MODEL AI BESAR
================================================================================

Support model besar jika berguna.

Jangan terlalu membatasi ukuran.


================================================================================
CE. AI MODEL PACK
================================================================================

Model packs:

TREE_ANALYSIS
LEAF_HEALTH
PEST_DETECTION
DISEASE_ANALYSIS
FLOWER_ANALYSIS
FRUIT_ANALYSIS
SEGMENTATION
DEPTH_ESTIMATION
IMAGE_EMBEDDING
VISUAL_ANOMALY
SOIL_VISUAL_ANALYSIS


================================================================================
CF. MODEL FAMILIES
================================================================================

Architecture boleh mendukung:

MobileNetV3
EfficientNet
EfficientNet-Lite
ConvNeXt
Vision Transformer

YOLO
RT-DETR

DINO
DINOv2

SAM
MobileSAM

U-Net
DeepLab

Depth Estimation Models

Specialized Plant Models


================================================================================
CG. MODEL MANAGER
================================================================================

Developer Center harus memiliki:

Model name
Task
Version
Size
Checksum
Status
Installed date
Update date
Metrics
Runtime
Backend
Inference benchmark


================================================================================
CH. MODEL ACTION
================================================================================

Actions:

Download
Update
Verify
Benchmark
Enable
Disable
Delete
Re-download


================================================================================
CI. MULTI-MODEL ENSEMBLE
================================================================================

Beberapa model boleh menilai satu target.

Contoh:

Leaf Model A
Leaf Model B
Vision Transformer
Historical Model
Rule Model

↓
Weighted Ensemble
↓
Final Result


================================================================================
CJ. ENSEMBLE DATA
================================================================================

Simpan:

individual_prediction
confidence
model_version

final_prediction

ensemble_confidence


================================================================================
CK. XAI
================================================================================

WAJIB.

Support:

Feature Importance
Permutation Importance
SHAP
SHAP-like attribution
LIME
Grad-CAM
Heatmap
Segmentation Overlay
Counterfactual Analysis
Confidence Calibration
Model Agreement
Prediction Provenance


================================================================================
CL. XAI PENGGUNA
================================================================================

User tidak perlu lihat istilah teknis.

Contoh:

Mengapa Pohon 09 perlu diamati?

• Pertumbuhan 30 hari melambat.
• Belum ada tunas baru.
• Daun tetap hijau.
• Tidak ditemukan hama.
• Kondisi zona akar diperkirakan normal.

Kesimpulan:
Belum ditemukan gangguan serius.


================================================================================
CM. XAI DEVELOPER
================================================================================

Developer boleh lihat:

raw SHAP
feature contribution
model probability
attention map
Grad-CAM
bounding box
segmentation mask
raw predictions


================================================================================
CN. COUNTERFACTUAL
================================================================================

Support pertanyaan:

"Apa yang harus berubah agar status membaik?"

Contoh:

Jika kondisi tanah berubah dari kering menjadi lembap,
dan tunas kembali muncul,
risiko stres diperkirakan turun.


================================================================================
CO. WHAT-IF ANALYSIS
================================================================================

Support:

What-if watering
What-if fertilizer
What-if no watering
What-if prolonged rain
What-if pest severity increases


================================================================================
CP. AUTOMATIC LEARNING
================================================================================

User biasa tidak melihat tombol:

Train Model

Sistem internal:

new data
↓
validate
↓
feature engineering
↓
dataset readiness
↓
training eligible models
↓
evaluation
↓
compare
↓
activate if better
↓
versioning


================================================================================
CQ. TRAINING LOKAL
================================================================================

Model ringan boleh training lokal.

Periksa:

battery
thermal
RAM
storage
charging
idle state


================================================================================
CR. TRAINING BERAT
================================================================================

Jangan paksa deep learning berat di HP.

Gunakan:

pretrained models
transfer learning
remote training
download model pack

Namun user tidak boleh diwajibkan membuka laptop.


================================================================================
CS. MODEL EVALUATION
================================================================================

Classification:

accuracy
precision
recall
F1
ROC-AUC jika relevan
confusion matrix

Regression:

MAE
RMSE
R²

Detection:

precision
recall
mAP

Segmentation:

IoU
Dice


================================================================================
CT. MODEL VERSIONING
================================================================================

Simpan:

model_id
model_name
task
version
training_date
training_samples
validation_samples
metrics
checksum
status
previous_version
created_at


================================================================================
CU. MODEL ROLLBACK
================================================================================

Jika model baru lebih buruk:

jangan aktifkan.

Simpan model lama.

Support rollback.


================================================================================
CV. MODEL DRIFT
================================================================================

Support:

Data Drift
Feature Drift
Prediction Drift
Model Drift
Performance Degradation


================================================================================
CW. DASHBOARD PENGGUNA
================================================================================

Dashboard harus seperti aplikasi analisis perkebunan.


================================================================================
CX. CONTOH DASHBOARD
================================================================================

KONDISI KEBUN

12 Pohon Rambutan Belereng

10 Sehat
2 Perlu diamati
0 Perlu tindakan segera

Tren 30 Hari:
Positif ↑

PRIORITAS

Pohon 09
Pertumbuhan lebih lambat dari pola biasanya.

Pohon 04
Zona akar diperkirakan lebih kering dari biasanya.

REKOMENDASI

Belum ditemukan gangguan serius hari ini.


================================================================================
CY. MENU UTAMA
================================================================================

1. Beranda
2. Pohon Saya
3. Pemeriksaan
4. Pertumbuhan
5. Perawatan
6. Bunga & Buah
7. Hama & Penyakit
8. Foto & Visual
9. Analisis Kebun
10. Panen
11. Laporan
12. Riwayat
13. Backup & Pemulihan
14. Pengaturan


================================================================================
CZ. POHON SAYA
================================================================================

Support:

list 12 pohon
status
tree detail
timeline
pertumbuhan
foto
perawatan
analisis
riwayat
panen


================================================================================
DA. TREE DETAIL
================================================================================

Contoh:

POHON 07

Status:
SEHAT

Tren:
POSITIF

Tinggi:
161 cm

Diameter:
2.1 cm

Tunas:
4 baru

Daun:
Hijau

Zona akar:
Diperkirakan lembap

Hama:
Tidak ditemukan

Analisis:
Pertumbuhan masih sesuai pola historis.

Keyakinan:
Tinggi

[Mengapa?]


================================================================================
DB. FOTO & VISUAL
================================================================================

Menu:

Ambil Foto
Analisis Foto
Galeri
Bandingkan Foto
Timeline Foto
Analisis Daun
Analisis Batang
Analisis Tanah
Analisis Bunga
Analisis Buah
Re-analysis


================================================================================
DC. PHOTO STORAGE
================================================================================

Options:

Save Original
Save Compressed
Save Thumbnail
Save Analysis Only
Delete After Analysis


================================================================================
DD. FILESYSTEM FOTO
================================================================================

Suggested:

AiAnalisRambutan/
└── data/
    └── trees/
        ├── RBT-001/
        │   ├── 2026/
        │   │   ├── full_tree/
        │   │   ├── leaf/
        │   │   ├── stem/
        │   │   ├── soil/
        │   │   ├── flower/
        │   │   └── fruit/
        │   └── 2027/
        └── ...


================================================================================
DE. RE-ANALYSIS
================================================================================

Foto historis dapat dianalisis ulang dengan model baru.


================================================================================
DF. STORAGE ARCHITECTURE
================================================================================

Pisahkan:

Core App
Database
AI Models
Original Photos
Thumbnails
Cache
Logs
Backups
Temporary AI Files


================================================================================
DG. DATABASE TIDAK MENYIMPAN BINARY BESAR
================================================================================

SQLite menyimpan:

metadata
path
measurement
prediction
confidence
model_version

Tidak menyimpan image/model binary besar.


================================================================================
DH. BACKUP
================================================================================

Support:

JSON
SQLite Full Backup
CSV Export

Manual
Daily
Weekly
Monthly
Emergency


================================================================================
DI. GOOGLE DRIVE
================================================================================

Integrasikan backup ke Google Drive.


================================================================================
DJ. STRUKTUR DRIVE
================================================================================

AiAnalisRambutan/
└── Backup/
    ├── daily/
    ├── weekly/
    ├── monthly/
    └── manual/


================================================================================
DK. OFFLINE BACKUP
================================================================================

Jika offline:

backup lokal tetap berhasil.

Drive upload menjadi queue.


================================================================================
DL. RETENTION
================================================================================

Daily: 7
Weekly: 8
Monthly: 12
Manual: tidak auto delete


================================================================================
DM. SAFE RESTORE
================================================================================

Flow:

1. Read backup
2. Validate format
3. Validate schema_version
4. Check checksum
5. Preview content
6. Integrity check
7. Emergency backup
8. Restore
9. Integrity check
10. Report


================================================================================
DN. EMERGENCY BACKUP
================================================================================

Sebelum:

restore
database migration besar
reset
import
dangerous SQL

buat emergency backup.


================================================================================
DO. BACKUP JSON
================================================================================

Metadata:

backup_format
schema_version
app_version
created_at
device_info optional

Data:

garden
trees
observations
growth
care events
weather
flowering
fruit
pest
disease
harvest
user corrections
ML labels
prediction metadata
model metadata
settings


================================================================================
DP. FOTO BACKUP
================================================================================

Foto dapat backup terpisah.

Database restore tidak wajib membutuhkan foto.


================================================================================
DQ. DEVELOPER MODE
================================================================================

Aktivasi:

Settings
→ About
→ tap version 7 kali

Display:

Mode Pengembang Aktif


================================================================================
DR. DEVELOPER CENTER
================================================================================

Developer Center sangat teknis.


================================================================================
DS. SYSTEM MENU
================================================================================

System Overview
Application Info
Device Info
Runtime Environment
Build Info
Version Info


================================================================================
DT. DATABASE MENU
================================================================================

Database Manager
Table Browser
Schema Viewer
Index Viewer
Foreign Key Viewer
Integrity Check
Migration Status
VACUUM
SQL Console
Database Size
Database Statistics


================================================================================
DU. DATA SCIENCE MENU
================================================================================

Dataset Explorer
Data Quality
Missing Values
Duplicates
Outliers
Distribution
Correlation Matrix
Class Balance
Label Distribution


================================================================================
DV. FEATURE MENU
================================================================================

Feature Store
Feature Inspector
Derived Features
Feature Importance
Feature Debugger


================================================================================
DW. ML MENU
================================================================================

Model Registry
Model Manager
Training Manager
Model Evaluation
Model Comparison
Model Versioning
Rollback
Drift
Ensemble
Confidence Engine


================================================================================
DX. VISION MENU
================================================================================

Vision Model Center
Image Debugger
Detection Viewer
Segmentation Viewer
Heatmap
Grad-CAM
Embedding Viewer
Vision Benchmark


================================================================================
DY. XAI MENU
================================================================================

SHAP
Feature Importance
Permutation Importance
LIME
Grad-CAM
Counterfactual
Model Agreement
Prediction Provenance


================================================================================
DZ. VIRTUAL SOIL MENU
================================================================================

Virtual Soil Sensor
Soil Evidence
Moisture Probability
Drying Model
Historical Soil State
Irrigation Probability


================================================================================
EA. PREDICTION INSPECTOR
================================================================================

Show:

tree
observation
features
raw inputs
model outputs
probability
confidence
ensemble
XAI
user corrected value


================================================================================
EB. LOGS
================================================================================

System
Database
AI
Vision
Training
Backup
Restore
Google Drive
Error
Warning


================================================================================
EC. LOG LEVEL
================================================================================

DEBUG
INFO
WARNING
ERROR
CRITICAL


================================================================================
ED. LOG ROTATION
================================================================================

Batasi ukuran log.

Jangan tumbuh tanpa batas.


================================================================================
EE. PERFORMANCE MONITOR
================================================================================

Show if available:

CPU
RAM
App Memory
Storage
Battery
Thermal
Inference Time
Training Time
Database Query Time


================================================================================
EF. STORAGE MONITOR
================================================================================

Show:

Core App
Database
AI Models
Photos
Thumbnails
Cache
Logs
Backups
Total


================================================================================
EG. CLEANUP
================================================================================

Safe cleanup:

cache
temporary files
old temporary inference images
obsolete model packages
optional thumbnails

Jangan auto-delete:

raw observations
corrections
measurements
care history
ML labels
harvest history


================================================================================
EH. DIAGNOSTICS
================================================================================

Database Test
AI Engine Test
Vision Test
Virtual Soil Test
Backup Test
Restore Test
Storage Test
Model Test
Google Drive Test
Full System Test


================================================================================
EI. EXPERIMENTAL LAB
================================================================================

Experimental Models
Model A/B Test
Sandbox Prediction
What-if Simulator
Experimental Features
New Model Benchmark


================================================================================
EJ. SQL CONSOLE
================================================================================

Read query:

boleh.

Write query:

UPDATE
DELETE
DROP
ALTER

harus:

warning
confirmation
automatic backup


================================================================================
EK. LAPORAN
================================================================================

Support:

Daily
Weekly
Monthly
3-Month
6-Month
Annual

Per Tree
Growth
Care
Pest
Disease
Flowering
Fruit
Harvest
AI Analysis


================================================================================
EL. EXPORT LAPORAN
================================================================================

PDF
CSV
JSON


================================================================================
EM. UI
================================================================================

Use:

Material 3

Design:

modern
clean
professional
agricultural
mobile-first


================================================================================
EN. THEME
================================================================================

Light
Dark


================================================================================
EO. ACCESSIBILITY
================================================================================

Large touch targets
Good contrast
Screen reader labels
Readable font
Do not rely only on color


================================================================================
EP. FORM UI
================================================================================

Prefer:

dropdown
chips
segmented buttons
radio
numeric input
slider

Kurangi free text.


================================================================================
EQ. STATE MANAGEMENT
================================================================================

Prefer:

Riverpod

atau alternatif yang lebih baik jika ada alasan teknis kuat.


================================================================================
ER. ROUTING
================================================================================

Prefer:

go_router


================================================================================
ES. DATABASE ORM
================================================================================

Gunakan:

Drift


================================================================================
ET. PROJECT STRUCTURE
================================================================================

mobile/
├── lib/
│   ├── main.dart
│   ├── app/
│   │   ├── app.dart
│   │   ├── router.dart
│   │   └── theme/
│   ├── core/
│   │   ├── constants/
│   │   ├── errors/
│   │   ├── logging/
│   │   ├── security/
│   │   ├── utils/
│   │   └── services/
│   ├── data/
│   │   ├── database/
│   │   ├── tables/
│   │   ├── dao/
│   │   ├── mappers/
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── usecases/
│   ├── features/
│   │   ├── dashboard/
│   │   ├── trees/
│   │   ├── inspection/
│   │   ├── camera/
│   │   ├── growth/
│   │   ├── care/
│   │   ├── soil/
│   │   ├── flowering/
│   │   ├── fruiting/
│   │   ├── pests/
│   │   ├── diseases/
│   │   ├── analysis/
│   │   ├── harvest/
│   │   ├── reports/
│   │   ├── history/
│   │   ├── backup/
│   │   ├── settings/
│   │   └── developer/
│   ├── ai/
│   │   ├── providers/
│   │   ├── router/
│   │   ├── rules/
│   │   ├── features/
│   │   ├── ml/
│   │   ├── vision/
│   │   ├── soil/
│   │   ├── anomaly/
│   │   ├── timeseries/
│   │   ├── ensemble/
│   │   ├── confidence/
│   │   └── xai/
│   ├── storage/
│   ├── backup/
│   └── developer/
├── assets/
│   ├── models/
│   ├── model_manifests/
│   ├── images/
│   └── icons/
├── docs/
├── test/
├── integration_test/
└── README.md


================================================================================
EU. DOCUMENTATION
================================================================================

Create:

mobile/README.md

mobile/docs/ARCHITECTURE.md
mobile/docs/DATABASE.md
mobile/docs/DATA_MODEL.md
mobile/docs/PHOTO_FIRST_INSPECTION.md
mobile/docs/AI_ENGINE.md
mobile/docs/VIRTUAL_SOIL_SENSOR.md
mobile/docs/VISION_PIPELINE.md
mobile/docs/XAI.md
mobile/docs/MODEL_MANAGEMENT.md
mobile/docs/BACKUP_RESTORE.md
mobile/docs/GOOGLE_DRIVE.md
mobile/docs/DEVELOPER_CENTER.md
mobile/docs/SECURITY.md
mobile/docs/TESTING.md
mobile/docs/ROADMAP.md


================================================================================
EV. CODE QUALITY
================================================================================

WAJIB:

null safety
strong typing
clear naming
small classes
small widgets
separation of concerns
dependency injection
testable architecture
clean error handling
no duplicated business logic


================================================================================
EW. JANGAN BUAT GOD CLASS
================================================================================

Jangan buat:

AiService dengan 5000 baris.

Pisahkan:

Vision
Rules
Features
Ensemble
XAI
Soil
Models
Backup
Database


================================================================================
EX. SECURITY
================================================================================

Jangan commit:

API keys
OAuth secrets
tokens
passwords
service accounts
Google credentials


================================================================================
EY. SECRET MANAGEMENT
================================================================================

Gunakan:

secure storage
environment config
build config
runtime config


================================================================================
EZ. ERROR HANDLING
================================================================================

User message:

"Data belum dapat disimpan.
Tidak ada data yang hilang.
Silakan coba kembali."

Developer Mode:

boleh tampil stacktrace.


================================================================================
FA. AI UNCERTAINTY
================================================================================

AI harus bisa berkata:

Tidak dapat ditentukan.

Foto kurang jelas.

Data belum cukup.

Model belum siap.

Confidence rendah.

Perlu konfirmasi.


================================================================================
FB. AGRONOMIC INTERPRETATION
================================================================================

Bedakan:

OBSERVED
MEASURED
ESTIMATED
INFERRED
PREDICTED
RECOMMENDED

Jangan ubah korelasi menjadi klaim sebab-akibat.


================================================================================
FC. DATABASE MIGRATION TEST
================================================================================

Setiap migration penting harus dites.

Jangan kehilangan data lama.


================================================================================
FD. TESTING
================================================================================

Minimal:

database initialization

12 tree seed

tree CRUD

observation

soil

leaf

shoot

growth

watering

fertilizer

flower

fruit

pest

disease

harvest

feature engineering

Rule Engine

Trend Engine

Virtual Soil Sensor

Confidence Engine

XAI

User Correction

JSON Backup

Restore

Migration


================================================================================
FE. VISION TEST
================================================================================

Gunakan abstraction.

Sediakan:

FakeVisionProvider

agar test tidak tergantung model AI nyata.


================================================================================
FF. AI PROVIDER TEST
================================================================================

Sediakan:

FakeLocalAIProvider
FakeRemoteAIProvider


================================================================================
FG. BACKUP TEST
================================================================================

Test:

export
parse
integrity
restore
version compatibility


================================================================================
FH. QUALITY GATE
================================================================================

Before commit:

dart format .

flutter analyze

flutter test

flutter build apk --debug

jika environment mendukung.


================================================================================
FI. BUILD STATUS
================================================================================

Jangan mengklaim build sukses jika tidak dijalankan.


================================================================================
FJ. GIT
================================================================================

Jangan:

force push
rewrite history

Gunakan branch:

feature/ai-analis-rambutan-mobile

Suggested first commit:

feat(mobile): initialize AiAnalisRambutan application


================================================================================
FK. DEFINITION OF DONE
================================================================================

Feature dianggap selesai jika:

UI
+
database
+
validation
+
error handling
+
test
+
documentation
+
migration consideration
+
backup consideration

sudah ditangani.


================================================================================
FL. FASE IMPLEMENTASI
================================================================================

FASE 1:
Foundation

FASE 2:
Database

FASE 3:
Core UI

FASE 4:
Photo-First Inspection

FASE 5:
Rule Engine

FASE 6:
Feature Engineering

FASE 7:
Virtual Soil Sensor

FASE 8:
XAI

FASE 9:
Developer Center

FASE 10:
Backup

FASE 11:
Computer Vision

FASE 12:
Model Manager

FASE 13:
Hybrid AI

FASE 14:
Classical ML

FASE 15:
Anomaly / Time Series

FASE 16:
Auto Training

FASE 17:
Google Drive

FASE 18:
Reporting

FASE 19:
Production Hardening


================================================================================
FM. SESI CODING PERTAMA
================================================================================

Sekarang kerjakan nyata.

Langkah:

1. Inspect repository.
2. Identifikasi aplikasi web lama.
3. Pastikan web tidak berubah.
4. Buat /mobile.
5. flutter create.
6. Setup Material 3.
7. Setup Riverpod.
8. Setup go_router.
9. Setup Drift.
10. Buat database version 1.
11. Buat migration framework.
12. Seed 12 pohon.
13. Buat main navigation.
14. Buat dashboard.
15. Buat Tree List.
16. Buat Tree Detail.
17. Buat Observation Session.
18. Buat Guided Camera UI shell.
19. Buat Image Capture Session.
20. Buat Field Prediction model.
21. Buat User Correction model.
22. Buat Dynamic Form Engine.
23. Buat manual fallback.
24. Buat Rule Engine dasar.
25. Buat Feature Engine dasar.
26. Buat Virtual Soil Sensor baseline.
27. Buat Confidence Engine.
28. Buat XAI explanation dasar.
29. Buat Developer Center skeleton.
30. Buat JSON backup dasar.
31. Tambahkan tests.
32. dart format.
33. flutter analyze.
34. flutter test.
35. flutter build apk --debug jika memungkinkan.
36. Fix semua error.
37. Commit bila stabil.


================================================================================
FN. JANGAN MEMBUAT FAKE AI
================================================================================

Jika model vision belum ada:

jangan berpura-pura foto dianalisis.

Tampilkan:

"Model analisis visual belum terpasang."

Actions:

Download Model

Lanjut Pemeriksaan Manual


================================================================================
FO. MODEL DOWNLOAD
================================================================================

Model boleh di-download setelah aplikasi terpasang.

Support:

Wi-Fi only
pause
resume
checksum
retry
version
storage validation


================================================================================
FP. MODEL MANIFEST
================================================================================

Setiap model pack harus memiliki manifest.

Fields:

model_id
name
task
version
download_url
size
checksum
runtime
input_shape
labels
minimum_app_version


================================================================================
FQ. MODEL INTEGRITY
================================================================================

Verify checksum sebelum model digunakan.


================================================================================
FR. STORAGE LOW
================================================================================

Jika storage kurang:

jangan download model.

Tampilkan:

"Penyimpanan tidak mencukupi."


================================================================================
FS. PERFORMANCE
================================================================================

Jangan menjalankan semua model sekaligus.

Gunakan AI Router.


================================================================================
FT. INFERENCE PRIORITY
================================================================================

Urutan:

cheap local inference
↓
specialized local model
↓
ensemble
↓
remote AI if necessary


================================================================================
FU. BATTERY & THERMAL
================================================================================

Jika device panas:

turunkan workload
tunda training
hindari model berat


================================================================================
FV. BACKGROUND TASK
================================================================================

Gunakan background processing untuk:

backup
model download
light training
sync
cleanup
scheduled analysis

Tanpa mengganggu pengguna.


================================================================================
FW. NOTIFICATIONS
================================================================================

Boleh support:

jadwal pemeriksaan

backup gagal

backup selesai

model update tersedia

pohon perlu perhatian

training selesai

Google Drive sync gagal


================================================================================
FX. DASHBOARD TIDAK TEKNIS
================================================================================

Jangan tampilkan:

RandomForest 0.83

Tampilkan:

"Keyakinan analisis: Tinggi"


================================================================================
FY. DEVELOPER BOLEH TEKNIS
================================================================================

Developer Center:

RandomForest v1.8
F1 = ...
XGBoost v2.0
mAP
SHAP
CPU
RAM
SQLite
dll.


================================================================================
FZ. ANALYSIS RESULT
================================================================================

Hasil ideal:

POHON 04

Status:
Sehat

Pertumbuhan:
Positif

Daun:
Hijau

Tunas:
4 baru

Zona akar:
Diperkirakan lembap

Hama:
Tidak ditemukan

Kerusakan daun:
±2%

Tinggi:
±161 cm

Diameter:
±2.1 cm

Analisis:
Pertumbuhan masih berada dalam pola normal.

Keyakinan:
Tinggi

[Mengapa?]


================================================================================
GA. XAI DETAIL
================================================================================

Jika tekan Mengapa:

- Tinggi meningkat 11 cm dalam 30 hari.
- 4 tunas baru terdeteksi.
- Tidak ditemukan tanda hama utama.
- Daun tetap hijau.
- Kondisi zona akar diperkirakan lembap.
- Tidak ada pola anomali signifikan.


================================================================================
GB. ANALISIS KEBUN
================================================================================

Dashboard kebun:

12 pohon

Kondisi:

Sehat
Perlu Diamati
Perlu Tindakan

Tren:

Meningkat
Stabil
Menurun


================================================================================
GC. PRIORITIZATION ENGINE
================================================================================

Buat sistem prioritas.

Pohon dengan:

anomali tertinggi
risiko tertinggi
confidence rendah
perubahan mendadak

masuk Prioritas Hari Ini.


================================================================================
GD. ALERT SEVERITY
================================================================================

INFO
PERHATIAN
PENTING
KRITIS


================================================================================
GE. ANOMALY ENGINE
================================================================================

Deteksi:

perubahan mendadak
pertumbuhan tidak biasa
daun berubah
penyiraman tidak biasa
buah rontok
bunga rontok
hama meningkat


================================================================================
GF. HISTORICAL COMPARISON
================================================================================

Bandingkan:

hari ini
7 hari
30 hari
90 hari
1 tahun


================================================================================
GG. PHOTO COMPARISON
================================================================================

Support:

before/after
slider
side-by-side
difference visualization


================================================================================
GH. IMAGE EMBEDDING
================================================================================

Simpan embedding bila berguna.

Jangan wajib jika storage terlalu besar.


================================================================================
GI. DATA QUALITY ENGINE
================================================================================

Hitung:

missing %
duplicate
invalid
stale measurement
inconsistent data
label quality


================================================================================
GJ. DATA QUALITY SCORE
================================================================================

Developer Center:

Dataset Quality Score

Bukan untuk pengguna biasa.


================================================================================
GK. MISSING DATA
================================================================================

AI tidak boleh mengarang missing values.

Boleh:

imputation internal untuk model

tetapi database raw tetap NULL.


================================================================================
GL. MODEL INPUT
================================================================================

Pisahkan raw value dan transformed feature.


================================================================================
GM. REPRODUCIBILITY
================================================================================

Prediction harus dapat ditelusuri:

model version
feature version
input snapshot
time


================================================================================
GN. FEATURE VERSIONING
================================================================================

Jika feature formula berubah:

version feature.


================================================================================
GO. PREDICTION VERSIONING
================================================================================

Simpan:

prediction_id
model_id
model_version
feature_version
created_at


================================================================================
GP. USER CORRECTION HISTORY
================================================================================

Jangan overwrite correction lama.

Simpan history jika berubah lagi.


================================================================================
GQ. AUDIT TRAIL
================================================================================

Simpan audit untuk:

critical data edits
restore
delete
model change
SQL write


================================================================================
GR. DELETE POLICY
================================================================================

Delete penting harus soft-delete jika sesuai.


================================================================================
GS. EXPORT DATASET
================================================================================

Developer dapat export dataset:

CSV
JSON
SQLite


================================================================================
GT. ML DATASET EXPORT
================================================================================

Sediakan export khusus:

features
labels
split metadata
source


================================================================================
GU. DATASET SPLIT
================================================================================

Jika training:

hindari leakage.

Pertimbangkan:

temporal split

bukan random split semata.


================================================================================
GV. TEMPORAL LEAKAGE
================================================================================

Future data tidak boleh digunakan memprediksi masa lalu.


================================================================================
GW. TREE LEAKAGE
================================================================================

Jika relevan evaluasi:

leave-one-tree-out

atau group split.


================================================================================
GX. METRICS
================================================================================

Tampilkan dengan konteks jumlah sample.


================================================================================
GY. LOW SAMPLE WARNING
================================================================================

Contoh:

"Accuracy 92% tetapi validation sample hanya 24."

Developer harus melihat peringatan.


================================================================================
GZ. CLASS IMBALANCE
================================================================================

Deteksi class imbalance.


================================================================================
HA. CALIBRATION
================================================================================

Support confidence calibration.


================================================================================
HB. ENSEMBLE DISAGREEMENT
================================================================================

Jika model berbeda pendapat:

turunkan confidence.

Minta user konfirmasi.


================================================================================
HC. OUT-OF-DISTRIBUTION
================================================================================

Jika foto/data sangat berbeda dari training:

tandai:

OUT_OF_DISTRIBUTION

Jangan confidence tinggi.


================================================================================
HD. MODEL FAILSAFE
================================================================================

Jika model crash:

fallback ke manual/rules.


================================================================================
HE. DATABASE FAILSAFE
================================================================================

Jika write gagal:

jangan kehilangan form aktif.

Keep draft.


================================================================================
HF. DRAFT
================================================================================

Simpan draft inspection bila app tertutup mendadak.


================================================================================
HG. AUTO SAVE
================================================================================

Form dapat autosave draft.


================================================================================
HH. CRASH RECOVERY
================================================================================

Pada buka:

"Pemulihan pemeriksaan belum selesai."

[Pulihkan]


================================================================================
HI. BACKUP HEALTH
================================================================================

Dashboard backup:

Last local backup
Last Drive backup
Backup status


================================================================================
HJ. RESTORE PREVIEW
================================================================================

Show:

12 trees
1200 observations
87 care events
etc.


================================================================================
HK. BACKUP CHECKSUM
================================================================================

Gunakan SHA-256 atau mekanisme setara.


================================================================================
HL. ENCRYPTION
================================================================================

Pertimbangkan enkripsi backup sensitif bila diaktifkan.


================================================================================
HM. GOOGLE DRIVE AUTH
================================================================================

Implement aman.

Jangan commit credentials.


================================================================================
HN. CONFIGURATION
================================================================================

Simpan setting dengan DataStore/shared preferences yang sesuai.


================================================================================
HO. DEVELOPER CONFIG
================================================================================

Developer settings:

Verbose Logging
Experimental Models
Auto Training
Online AI
Benchmark Mode
Debug Overlay
SQL Write Mode
Vision Debug


================================================================================
HP. APP INFO
================================================================================

Show:

version
build number
database version
model pack version


================================================================================
HQ. DEVICE INFO
================================================================================

Developer:

Android version
device model
RAM
storage
GPU/NNAPI if available


================================================================================
HR. MODEL BACKEND
================================================================================

Support runtime:

TFLite
ONNX Runtime

atau runtime yang cocok.


================================================================================
HS. GPU/NNAPI
================================================================================

Gunakan hardware acceleration jika aman.


================================================================================
HT. CPU FALLBACK
================================================================================

Jika acceleration gagal:

CPU fallback.


================================================================================
HU. ANALISIS SERVER
================================================================================

Remote AI boleh digunakan.

Tetapi basic app jangan mati tanpa internet.


================================================================================
HV. OFFLINE MODE
================================================================================

Tampilkan status:

Offline

Local AI tetap digunakan.


================================================================================
HW. SYNC QUEUE
================================================================================

Queue:

backup upload
remote retry
model download retry


================================================================================
HX. PHOTO PRIVACY
================================================================================

User dapat lihat foto apa yang akan di-upload.


================================================================================
HY. DATA OWNERSHIP
================================================================================

Data pengguna tetap milik pengguna.


================================================================================
HZ. FUTURE EXPANSION
================================================================================

Arsitektur jangan hardcode hanya rambutan.

Boleh suatu hari:

mangga
kelapa
durian
dll.

Namun UI V1 fokus Rambutan.


================================================================================
IA. SPECIES FIELD
================================================================================

Schema dukung species/variety.


================================================================================
IB. MULTI-GARDEN
================================================================================

Schema sebaiknya siap multi-garden.


================================================================================
IC. MULTI-USER
================================================================================

Tidak wajib V1.

Namun jangan desain yang mustahil diperluas.


================================================================================
ID. FUTURE SENSOR
================================================================================

Siapkan sensor table abstraction:

sensor_device
sensor_reading

meski belum dipakai.


================================================================================
IE. SENSOR SOURCE
================================================================================

Jika nanti sensor:

source = SENSOR_MEASURED


================================================================================
IF. IoT FUTURE
================================================================================

Future architecture boleh menerima:

ESP32
RS485
soil moisture
weather
rain gauge


================================================================================
IG. REPORT AI
================================================================================

Report harus membedakan:

observasi
estimasi
prediksi
rekomendasi


================================================================================
IH. USER LANGUAGE
================================================================================

UI utama:

Bahasa Indonesia.

Developer Center boleh istilah teknis Inggris bila relevan.


================================================================================
II. TANGGAL/WAKTU
================================================================================

Gunakan timezone perangkat.

Simpan timestamp aman.


================================================================================
IJ. UNIT SYSTEM
================================================================================

Default:

cm
mm
liter
gram
kg
m²


================================================================================
IK. DATA VALIDATION
================================================================================

Misalnya:

negative height = invalid

watering < 0 = invalid

confidence 0..1


================================================================================
IL. ENUM
================================================================================

Gunakan enum kuat jika cocok.


================================================================================
IM. INDEX DATABASE
================================================================================

Index:

tree_id
observation_datetime
event dates
prediction model
photo date


================================================================================
IN. PERFORMANCE DB
================================================================================

Gunakan pagination.


================================================================================
IO. TIMELINE
================================================================================

Timeline pohon:

inspection
watering
fertilizer
pruning
flower
fruit
pest
harvest


================================================================================
IP. SEARCH
================================================================================

Developer/user dapat search riwayat.


================================================================================
IQ. FILTER
================================================================================

Filter:

date range
tree
event
status


================================================================================
IR. CHART
================================================================================

Charts:

height
stem
shoot
flower
fruit
watering
health trend


================================================================================
IS. CHART PERFORMANCE
================================================================================

Jangan render ribuan point tanpa downsampling.


================================================================================
IT. USER NOTES
================================================================================

Notes optional.


================================================================================
IU. TAG
================================================================================

Support optional tags.


================================================================================
IV. SCHEDULE
================================================================================

Support reminder pemeriksaan.


================================================================================
IW. CHECK FREQUENCY
================================================================================

Default dapat sekitar 3 hari,
tetapi configurable.


================================================================================
IX. MEASUREMENT FREQUENCY
================================================================================

Height/stem tidak wajib tiap pemeriksaan.


================================================================================
IY. CONDITIONAL MEASUREMENT
================================================================================

Aplikasi tahu data terakhir.

Jika height baru diukur 3 hari lalu:

tidak perlu paksa ulang.


================================================================================
IZ. STALE DATA
================================================================================

Jika height sudah 45 hari:

minta pengukuran.


================================================================================
JA. SMART INSPECTION
================================================================================

Inspection form menyesuaikan:

umur data
foto
prediksi
event


================================================================================
JB. USER EFFORT SCORE
================================================================================

Secara internal bisa hitung berapa field manual.

Tujuan:

semakin sedikit.


================================================================================
JC. AI COVERAGE
================================================================================

Developer dapat lihat:

berapa % field berhasil auto-fill.


================================================================================
JD. CORRECTION RATE
================================================================================

Developer:

berapa % AI dikoreksi user.


================================================================================
JE. MODEL IMPROVEMENT
================================================================================

Correction rate dapat digunakan evaluasi model.


================================================================================
JF. PHOTO QUALITY STAT
================================================================================

Track:

retake rate
blur rate
dark rate


================================================================================
JG. FUTURE DATA SCIENCE
================================================================================

Dataset harus cukup bersih untuk:

research
paper
thesis
ML experiments


================================================================================
JH. EXPORT RESEARCH
================================================================================

Export anonymized optional.


================================================================================
JI. DO NOT OVERENGINEER UI
================================================================================

Backend boleh kompleks.

UI user tetap sederhana.


================================================================================
JJ. DO NOT OVERLOAD MAIN DASHBOARD
================================================================================

Main screen hanya hal penting.


================================================================================
JK. FINAL PRINCIPLE
================================================================================

Sistem harus dapat:

MENGAMATI
MENGUKUR
MEMPERKIRAKAN
MENGINFERENSI
MEMBANDINGKAN
MENDETEKSI
MEMPREDIKSI
MENJELASKAN
MEREKOMENDASIKAN
BELAJAR
MENGINGAT
MEMBACKUP


================================================================================
JL. TARGET EXPERIENCE
================================================================================

Target:

Pengguna membuka Pohon 01.

Ambil beberapa foto.

AI menganalisis.

Form hampir seluruhnya terisi otomatis.

Pengguna hanya:

- mengoreksi 1–3 data bila perlu
- konfirmasi
- simpan

Selesai.


================================================================================
JM. TIDAK BOLEH
================================================================================

Jangan:

- membuat fake AI
- menampilkan confidence palsu
- menghapus raw data
- merusak web lama
- menghapus database untuk migration
- commit secret
- force push
- mengklaim test sukses tanpa menjalankan
- mengklaim inference bekerja jika model belum ada


================================================================================
JN. LAPORAN SETELAH CODING
================================================================================

Setelah setiap sesi kerja, laporkan:

Branch

Files created

Files modified

Database tables

Migrations

Features implemented

Tests added

dart format result

flutter analyze result

flutter test result

APK build result

Known limitations

Blockers

Next step

Commit SHA


================================================================================
JO. MULAI IMPLEMENTASI
================================================================================

MULAI SEKARANG.

Pertama:

1. Inspeksi repository.
2. Jelaskan struktur existing secara ringkas.
3. Konfirmasi batas aplikasi web.
4. Jangan ubah web.
5. Buat /mobile.
6. Implementasikan foundation.
7. Jangan berhenti hanya membuat rencana.
8. Tulis source code nyata.
9. Jalankan analyzer.
10. Jalankan tests.
11. Build APK jika toolchain tersedia.
12. Perbaiki error.
13. Commit jika stabil.


================================================================================
JP. AUTONOMI ENGINEERING
================================================================================

Ambil keputusan engineering normal secara mandiri.

Tidak perlu terus bertanya untuk hal non-destruktif.

Contoh boleh diputuskan sendiri:

- nama class
- struktur folder
- dependency minor
- UI component
- DAO
- repository
- enum
- test structure

Harus berhenti/minta persetujuan sebelum:

- menghapus data
- destructive migration
- force push
- menghapus web lama
- mengganti history
- menyimpan secret
- operasi berisiko tinggi


================================================================================
JQ. JIKA TERBLOKIR
================================================================================

Jika terblokir karena:

Flutter SDK
Android SDK
internet
dependency
permission
GitHub
credential
Google Drive
model file

maka:

1. jelaskan blocker tepat
2. lanjutkan pekerjaan lain yang tidak terblokir
3. jangan berhenti total
4. tinggalkan project dalam kondisi bersih
5. berikan exact next action


================================================================================
JR. PENUTUP
================================================================================

AiAnalisRambutan harus dibangun sebagai:

WORKSTATION ANALISIS PERKEBUNAN CERDAS BERBASIS ANDROID

yang:

- mudah digunakan oleh pengguna perkebunan
- sangat kompleks di belakang layar
- menyimpan data historis bertahun-tahun
- menggunakan kamera sebagai input utama
- mengisi data otomatis
- menggunakan AI lokal maupun online
- mempunyai Virtual Soil Sensor
- mempunyai Machine Learning modular
- mempunyai Computer Vision
- mempunyai XAI
- mempunyai Developer Center lengkap
- mempunyai backup aman
- mempunyai Google Drive
- dapat dikembangkan terus-menerus

Tujuan akhirnya:

Pengguna hanya perlu:

PILIH POHON
→ FOTO
→ KONFIRMASI
→ SIMPAN

Sistem mengurus sisanya.

MULAI IMPLEMENTASI NYATA SEKARANG.
