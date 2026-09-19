import 'package:drift/drift.dart';

import '../../core/constants/app_constants.dart';

class DatabaseMigrator implements QueryExecutorUser {
  @override
  int get schemaVersion => databaseSchemaVersion;

  @override
  Future<void> beforeOpen(
    QueryExecutor executor,
    OpeningDetails details,
  ) async {
    await executor.ensureOpen(this);
    await executor.runCustom('PRAGMA foreign_keys = ON');
    final currentVersion = await _schemaVersion(executor);
    if (currentVersion < 1) {
      for (final statement in _versionOneStatements) {
        await executor.runCustom(statement);
      }
      await executor.runInsert(
        'INSERT INTO schema_migrations (version, applied_at) VALUES (?, ?)',
        [1, DateTime.now().toUtc().toIso8601String()],
      );
      await _seedInitialGarden(executor);
    }
  }

  Future<int> _schemaVersion(QueryExecutor executor) async {
    await executor.runCustom(
      'CREATE TABLE IF NOT EXISTS schema_migrations '
      '(version INTEGER PRIMARY KEY, applied_at TEXT NOT NULL)',
    );
    final rows = await executor.runSelect(
      'SELECT COALESCE(MAX(version), 0) AS version FROM schema_migrations',
      const [],
    );
    return rows.single['version']! as int;
  }

  Future<void> _seedInitialGarden(QueryExecutor executor) async {
    final now = DateTime.now().toUtc().toIso8601String();
    final gardenId = await executor.runInsert(
      'INSERT INTO gardens (garden_name, tree_count, created_at, updated_at) '
      'VALUES (?, ?, ?, ?)',
      ['Kebun Rambutan Belereng', initialTreeCodes.length, now, now],
    );
    for (var index = 0; index < initialTreeCodes.length; index++) {
      await executor.runInsert(
        'INSERT INTO trees (tree_code, garden_id, species, variety, row_number, '
        'column_number, status, active, created_at, updated_at) '
        'VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
          initialTreeCodes[index],
          gardenId,
          'Nephelium lappaceum',
          defaultVariety,
          1,
          index + 1,
          'SEHAT',
          1,
          now,
          now,
        ],
      );
    }
  }
}

const List<String> _versionOneStatements = [
  '''CREATE TABLE IF NOT EXISTS gardens (
      garden_id INTEGER PRIMARY KEY AUTOINCREMENT, garden_name TEXT NOT NULL,
      location_name TEXT, area_m2 REAL, tree_count INTEGER NOT NULL DEFAULT 0,
      default_spacing_cm REAL, description TEXT, created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL, deleted_at TEXT)''',
  '''CREATE TABLE IF NOT EXISTS trees (
      tree_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_code TEXT NOT NULL UNIQUE,
      garden_id INTEGER NOT NULL REFERENCES gardens(garden_id), species TEXT NOT NULL,
      variety TEXT NOT NULL, source TEXT, purchase_date TEXT, planting_date TEXT,
      row_number INTEGER, column_number INTEGER, spacing_cm REAL,
      initial_height_cm REAL, initial_stem_circumference_cm REAL,
      initial_stem_diameter_cm REAL, initial_canopy_ns_cm REAL,
      initial_canopy_ew_cm REAL, initial_flowering INTEGER, initial_condition TEXT,
      root_condition_initial TEXT, planting_method TEXT, status TEXT NOT NULL,
      active INTEGER NOT NULL DEFAULT 1, created_at TEXT NOT NULL, updated_at TEXT NOT NULL,
      deleted_at TEXT)''',
  '''CREATE TABLE IF NOT EXISTS observation_sessions (
      observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      tree_id INTEGER NOT NULL REFERENCES trees(tree_id), observation_datetime TEXT NOT NULL,
      days_after_planting INTEGER, observer TEXT, inspection_mode TEXT NOT NULL,
      observation_quality TEXT, general_condition TEXT, notes TEXT, created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL, deleted_at TEXT)''',
  '''CREATE TABLE IF NOT EXISTS soil_observations (
      soil_observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL UNIQUE REFERENCES observation_sessions(observation_id),
      soil_visual_condition TEXT, soil_moisture_visual TEXT, soil_surface_condition TEXT,
      soil_check_depth_cm REAL, soil_compaction TEXT, soil_drainage TEXT,
      standing_water INTEGER, standing_water_depth_cm REAL, soil_crack_level TEXT,
      soil_erosion TEXT, mulch_present INTEGER, mulch_thickness_cm REAL,
      root_zone_estimate TEXT, root_zone_confidence REAL CHECK(root_zone_confidence BETWEEN 0 AND 1),
      source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS leaf_observations (
      leaf_observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL UNIQUE REFERENCES observation_sessions(observation_id),
      leaf_color TEXT, leaf_color_uniformity TEXT, leaf_wilt INTEGER, leaf_drop INTEGER,
      new_leaf_present INTEGER, new_leaf_count_estimate INTEGER, chlorosis INTEGER,
      necrosis INTEGER, leaf_spots INTEGER, leaf_holes INTEGER, leaf_curl INTEGER,
      leaf_damage_percent REAL CHECK(leaf_damage_percent BETWEEN 0 AND 100),
      leaf_cleanliness TEXT, visual_health_score REAL, source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS shoot_observations (
      shoot_observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL UNIQUE REFERENCES observation_sessions(observation_id),
      new_shoot_present INTEGER, new_shoot_count INTEGER, shoot_length_cm REAL,
      shoot_condition TEXT, shoot_color TEXT, vegetative_vigor TEXT, source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS branch_observations (
      branch_observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL UNIQUE REFERENCES observation_sessions(observation_id),
      branch_new_count INTEGER, branch_dead_count INTEGER, branch_broken_count INTEGER,
      physical_damage INTEGER, physical_damage_severity TEXT, damage_description TEXT,
      source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS growth_measurements (
      growth_measurement_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL REFERENCES observation_sessions(observation_id),
      height_cm REAL CHECK(height_cm >= 0), stem_circumference_cm REAL CHECK(stem_circumference_cm >= 0),
      stem_diameter_cm REAL CHECK(stem_diameter_cm >= 0), canopy_ns_cm REAL CHECK(canopy_ns_cm >= 0),
      canopy_ew_cm REAL CHECK(canopy_ew_cm >= 0), canopy_height_cm REAL CHECK(canopy_height_cm >= 0),
      primary_branch_count INTEGER, lowest_branch_height_cm REAL,
      measurement_method TEXT NOT NULL, measurement_confidence REAL CHECK(measurement_confidence BETWEEN 0 AND 1),
      source_photo_id INTEGER, model_version TEXT, source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS flowering_observations (
      flowering_observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL UNIQUE REFERENCES observation_sessions(observation_id),
      flower_present INTEGER, flower_stage TEXT, flower_cluster_count INTEGER,
      flower_cluster_estimate INTEGER, flower_abundance TEXT, flower_drop_level TEXT,
      pollination_activity TEXT, first_flower_date TEXT, source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS fruit_observations (
      fruit_observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL UNIQUE REFERENCES observation_sessions(observation_id),
      fruit_present INTEGER, fruit_stage TEXT, fruit_cluster_count INTEGER,
      fruit_count_estimate INTEGER, fruit_drop_count INTEGER, fruit_drop_level TEXT,
      fruit_damage_percent REAL CHECK(fruit_damage_percent BETWEEN 0 AND 100),
      fruit_average_diameter_mm REAL, fruit_color TEXT, first_fruit_date TEXT,
      source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS pest_observations (
      pest_observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL UNIQUE REFERENCES observation_sessions(observation_id),
      pest_present INTEGER, pest_type TEXT, pest_severity TEXT, pest_count_estimate INTEGER,
      affected_part TEXT, affected_percent REAL CHECK(affected_percent BETWEEN 0 AND 100),
      pest_spread TEXT, insect_visible INTEGER, source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS disease_observations (
      disease_observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL UNIQUE REFERENCES observation_sessions(observation_id),
      disease_present INTEGER, disease_type TEXT, symptom_type TEXT, disease_severity TEXT,
      affected_part TEXT, affected_percent REAL CHECK(affected_percent BETWEEN 0 AND 100),
      disease_spread TEXT, source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS weed_observations (
      weed_observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL UNIQUE REFERENCES observation_sessions(observation_id),
      weed_level TEXT, weed_height_cm REAL, weed_coverage_percent REAL CHECK(weed_coverage_percent BETWEEN 0 AND 100),
      weed_radius_percent REAL CHECK(weed_radius_percent BETWEEN 0 AND 100), weed_removed INTEGER,
      weed_removal_method TEXT, source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS weather_observations (
      weather_observation_id INTEGER PRIMARY KEY AUTOINCREMENT,
      garden_id INTEGER NOT NULL REFERENCES gardens(garden_id), weather_datetime TEXT NOT NULL,
      weather TEXT, rain_since_last_check INTEGER, rain_intensity TEXT, rain_duration_estimate TEXT,
      sun_condition TEXT, wind_condition TEXT, extreme_weather INTEGER, extreme_weather_type TEXT,
      source TEXT NOT NULL DEFAULT 'MANUAL')''',
  '''CREATE TABLE IF NOT EXISTS watering_events (
      watering_event_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_id INTEGER NOT NULL REFERENCES trees(tree_id),
      watering_datetime TEXT NOT NULL, watering_liter REAL NOT NULL CHECK(watering_liter >= 0),
      watering_method TEXT, watering_duration_min REAL, watering_reason TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS fertilizer_events (
      fertilizer_event_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_id INTEGER NOT NULL REFERENCES trees(tree_id),
      fertilizer_datetime TEXT NOT NULL, fertilizer_category TEXT, fertilizer_product TEXT,
      fertilizer_amount_g REAL CHECK(fertilizer_amount_g >= 0), manure_kg REAL CHECK(manure_kg >= 0),
      application_method TEXT, distance_from_trunk_cm REAL, soil_condition_before TEXT,
      watering_after INTEGER, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS organic_fertilizer_events (
      organic_fertilizer_event_id INTEGER PRIMARY KEY AUTOINCREMENT,
      tree_id INTEGER NOT NULL REFERENCES trees(tree_id), applied_at TEXT NOT NULL,
      product TEXT, amount_kg REAL CHECK(amount_kg >= 0), method TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS pruning_events (
      pruning_event_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_id INTEGER NOT NULL REFERENCES trees(tree_id),
      pruning_datetime TEXT NOT NULL, pruning_type TEXT, branch_removed_count INTEGER,
      reason TEXT, wound_condition TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS tree_events (
      tree_event_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_id INTEGER NOT NULL REFERENCES trees(tree_id),
      event_datetime TEXT NOT NULL, event_type TEXT NOT NULL, notes TEXT, severity TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS image_capture_sessions (
      image_capture_session_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL REFERENCES observation_sessions(observation_id),
      started_at TEXT NOT NULL, completed_at TEXT, capture_mode TEXT NOT NULL, status TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS photos (
      photo_id INTEGER PRIMARY KEY AUTOINCREMENT,
      image_capture_session_id INTEGER NOT NULL REFERENCES image_capture_sessions(image_capture_session_id),
      capture_type TEXT NOT NULL, file_path TEXT NOT NULL, thumbnail_path TEXT, captured_at TEXT NOT NULL,
      quality_status TEXT, quality_reasons TEXT, storage_policy TEXT NOT NULL, checksum TEXT,
      width_px INTEGER, height_px INTEGER, deleted_at TEXT)''',
  '''CREATE TABLE IF NOT EXISTS field_predictions (
      field_prediction_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL REFERENCES observation_sessions(observation_id), field_key TEXT NOT NULL,
      predicted_value TEXT, confidence REAL CHECK(confidence BETWEEN 0 AND 1), status TEXT NOT NULL,
      provenance TEXT NOT NULL, model_version TEXT, feature_version TEXT, input_snapshot TEXT,
      created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS vision_predictions (
      vision_prediction_id INTEGER PRIMARY KEY AUTOINCREMENT, photo_id INTEGER NOT NULL REFERENCES photos(photo_id),
      task TEXT NOT NULL, prediction TEXT, confidence REAL CHECK(confidence BETWEEN 0 AND 1),
      model_version TEXT NOT NULL, raw_output_path TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS measurement_predictions (
      measurement_prediction_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL REFERENCES observation_sessions(observation_id), metric TEXT NOT NULL,
      measurement_value REAL, measurement_min REAL, measurement_max REAL,
      confidence REAL CHECK(confidence BETWEEN 0 AND 1), measurement_method TEXT NOT NULL,
      source_photo_id INTEGER REFERENCES photos(photo_id), model_version TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS soil_inference_predictions (
      soil_inference_prediction_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL REFERENCES observation_sessions(observation_id), moisture_class TEXT NOT NULL,
      confidence REAL CHECK(confidence BETWEEN 0 AND 1), dryness_risk TEXT, waterlogging_risk TEXT,
      root_stress_risk TEXT, soil_aeration_risk TEXT, drainage_estimate TEXT,
      estimated_drying_rate TEXT, estimated_days_until_dry REAL,
      irrigation_need_probability REAL CHECK(irrigation_need_probability BETWEEN 0 AND 1),
      evidence_json TEXT NOT NULL, model_version TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS user_corrections (
      user_correction_id INTEGER PRIMARY KEY AUTOINCREMENT,
      observation_id INTEGER NOT NULL REFERENCES observation_sessions(observation_id), field_key TEXT NOT NULL,
      ai_original_value TEXT, ai_confidence REAL CHECK(ai_confidence BETWEEN 0 AND 1),
      user_final_value TEXT NOT NULL, was_corrected INTEGER NOT NULL, correction_datetime TEXT NOT NULL,
      correction_source TEXT NOT NULL, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS ml_labels (
      ml_label_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_id INTEGER REFERENCES trees(tree_id),
      observation_id INTEGER REFERENCES observation_sessions(observation_id), label_key TEXT NOT NULL,
      label_value TEXT NOT NULL, quality TEXT, source TEXT NOT NULL, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS ml_predictions (
      ml_prediction_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_id INTEGER NOT NULL REFERENCES trees(tree_id),
      prediction_type TEXT NOT NULL, prediction TEXT, confidence REAL CHECK(confidence BETWEEN 0 AND 1),
      model_version TEXT, feature_version TEXT, input_snapshot TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS ai_model_metadata (
      model_id INTEGER PRIMARY KEY AUTOINCREMENT, model_name TEXT NOT NULL, task TEXT NOT NULL,
      version TEXT NOT NULL, size_bytes INTEGER, checksum TEXT, runtime TEXT, status TEXT NOT NULL,
      installed_at TEXT, updated_at TEXT, UNIQUE(model_name, version))''',
  '''CREATE TABLE IF NOT EXISTS model_versions (
      model_version_id INTEGER PRIMARY KEY AUTOINCREMENT, model_id INTEGER NOT NULL REFERENCES ai_model_metadata(model_id),
      version TEXT NOT NULL, training_date TEXT, training_samples INTEGER, validation_samples INTEGER,
      metrics_json TEXT, checksum TEXT, status TEXT NOT NULL, previous_version TEXT, created_at TEXT NOT NULL,
      UNIQUE(model_id, version))''',
  '''CREATE TABLE IF NOT EXISTS model_evaluations (
      model_evaluation_id INTEGER PRIMARY KEY AUTOINCREMENT, model_id INTEGER NOT NULL REFERENCES ai_model_metadata(model_id),
      metrics_json TEXT NOT NULL, training_samples INTEGER, validation_samples INTEGER,
      evaluated_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS harvests (
      harvest_id INTEGER PRIMARY KEY AUTOINCREMENT, tree_id INTEGER NOT NULL REFERENCES trees(tree_id),
      harvest_date TEXT NOT NULL, fruit_count INTEGER, harvest_weight_kg REAL CHECK(harvest_weight_kg >= 0),
      average_fruit_weight_g REAL, damaged_fruit_count INTEGER, marketable_fruit_count INTEGER,
      quality_grade TEXT, selling_price_per_kg REAL, revenue REAL, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS sensor_devices (
      sensor_device_id INTEGER PRIMARY KEY AUTOINCREMENT, garden_id INTEGER REFERENCES gardens(garden_id),
      device_name TEXT NOT NULL, device_type TEXT NOT NULL, identifier TEXT UNIQUE, active INTEGER NOT NULL DEFAULT 1,
      created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS sensor_readings (
      sensor_reading_id INTEGER PRIMARY KEY AUTOINCREMENT, sensor_device_id INTEGER NOT NULL REFERENCES sensor_devices(sensor_device_id),
      tree_id INTEGER REFERENCES trees(tree_id), metric TEXT NOT NULL, value REAL NOT NULL, unit TEXT,
      recorded_at TEXT NOT NULL, source TEXT NOT NULL DEFAULT 'SENSOR_MEASURED')''',
  '''CREATE TABLE IF NOT EXISTS backup_history (
      backup_id INTEGER PRIMARY KEY AUTOINCREMENT, backup_type TEXT NOT NULL, file_path TEXT NOT NULL,
      checksum TEXT NOT NULL, schema_version INTEGER NOT NULL, status TEXT NOT NULL, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS restore_history (
      restore_id INTEGER PRIMARY KEY AUTOINCREMENT, backup_id INTEGER REFERENCES backup_history(backup_id),
      status TEXT NOT NULL, details TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS system_logs (
      log_id INTEGER PRIMARY KEY AUTOINCREMENT, category TEXT NOT NULL, level TEXT NOT NULL,
      message TEXT NOT NULL, context_json TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS database_logs (
      log_id INTEGER PRIMARY KEY AUTOINCREMENT, level TEXT NOT NULL, message TEXT NOT NULL,
      context_json TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS ai_logs (
      log_id INTEGER PRIMARY KEY AUTOINCREMENT, level TEXT NOT NULL, message TEXT NOT NULL,
      context_json TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS vision_logs (
      log_id INTEGER PRIMARY KEY AUTOINCREMENT, level TEXT NOT NULL, message TEXT NOT NULL,
      context_json TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS training_logs (
      log_id INTEGER PRIMARY KEY AUTOINCREMENT, level TEXT NOT NULL, message TEXT NOT NULL,
      context_json TEXT, created_at TEXT NOT NULL)''',
  '''CREATE TABLE IF NOT EXISTS backup_logs (
      log_id INTEGER PRIMARY KEY AUTOINCREMENT, level TEXT NOT NULL, message TEXT NOT NULL,
      context_json TEXT, created_at TEXT NOT NULL)''',
  'CREATE INDEX IF NOT EXISTS idx_trees_garden ON trees(garden_id)',
  'CREATE INDEX IF NOT EXISTS idx_observations_tree_date ON observation_sessions(tree_id, observation_datetime DESC)',
  'CREATE INDEX IF NOT EXISTS idx_watering_tree_date ON watering_events(tree_id, watering_datetime DESC)',
  'CREATE INDEX IF NOT EXISTS idx_photos_capture ON photos(image_capture_session_id, captured_at DESC)',
  'CREATE INDEX IF NOT EXISTS idx_predictions_observation ON field_predictions(observation_id, field_key)',
];
