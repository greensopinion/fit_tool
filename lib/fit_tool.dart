/// A library for reading and writing Garmin FIT files.
///
library fit_tool;

export 'src/base_type.dart';
export 'src/constants.dart';
export 'src/data_message.dart';
export 'src/definition_message.dart';
export 'src/developer_field.dart';
export 'src/developer_field_definition.dart';
export 'src/field.dart';
export 'src/field_component.dart';
export 'src/field_definition.dart';
export 'src/fit_decoder.dart';
export 'src/fit_file.dart';
export 'src/fit_file_builder.dart';
export 'src/fit_file_header.dart';
export 'src/generic_message.dart';
export 'src/record.dart';
export 'src/sub_field.dart';
export 'src/utils/conversions.dart';
export 'src/utils/crc.dart';
export 'src/utils/type_sizes.dart';

export 'src/profile/profile_type.dart';

export 'src/profile/messages/common_fields.dart';
export 'src/profile/messages/accelerometer_data_message.dart';
export 'src/profile/messages/activity_message.dart';
export 'src/profile/messages/ant_channel_id_message.dart';
export 'src/profile/messages/ant_rx_message.dart';
export 'src/profile/messages/ant_tx_message.dart';
export 'src/profile/messages/aviation_attitude_message.dart';
export 'src/profile/messages/barometer_data_message.dart';
export 'src/profile/messages/bike_profile_message.dart';
export 'src/profile/messages/blood_pressure_message.dart';
export 'src/profile/messages/cadence_zone_message.dart';
export 'src/profile/messages/camera_event_message.dart';
export 'src/profile/messages/capabilities_message.dart';
export 'src/profile/messages/climb_pro_message.dart';
export 'src/profile/messages/connectivity_message.dart';
export 'src/profile/messages/course_message.dart';
export 'src/profile/messages/course_point_message.dart';
export 'src/profile/messages/developer_data_id_message.dart';
export 'src/profile/messages/device_info_message.dart';
export 'src/profile/messages/device_settings_message.dart';
export 'src/profile/messages/dive_alarm_message.dart';
export 'src/profile/messages/dive_gas_message.dart';
export 'src/profile/messages/dive_settings_message.dart';
export 'src/profile/messages/dive_summary_message.dart';
export 'src/profile/messages/event_message.dart';
export 'src/profile/messages/exd_data_concept_configuration_message.dart';
export 'src/profile/messages/exd_data_field_configuration_message.dart';
export 'src/profile/messages/exd_screen_configuration_message.dart';
export 'src/profile/messages/exercise_title_message.dart';
export 'src/profile/messages/field_capabilities_message.dart';
export 'src/profile/messages/field_description_message.dart';
export 'src/profile/messages/file_capabilities_message.dart';
export 'src/profile/messages/file_creator_message.dart';
export 'src/profile/messages/file_id_message.dart';
export 'src/profile/messages/goal_message.dart';
export 'src/profile/messages/gps_metadata_message.dart';
export 'src/profile/messages/gyroscope_data_message.dart';
export 'src/profile/messages/hr_message.dart';
export 'src/profile/messages/hr_zone_message.dart';
export 'src/profile/messages/hrm_profile_message.dart';
export 'src/profile/messages/hrv_message.dart';
export 'src/profile/messages/jump_message.dart';
export 'src/profile/messages/lap_message.dart';
export 'src/profile/messages/length_message.dart';
export 'src/profile/messages/magnetometer_data_message.dart';
export 'src/profile/messages/memo_glob_message.dart';
export 'src/profile/messages/mesg_capabilities_message.dart';
export 'src/profile/messages/message_factory.dart';
export 'src/profile/messages/met_zone_message.dart';
export 'src/profile/messages/monitoring_info_message.dart';
export 'src/profile/messages/monitoring_message.dart';
export 'src/profile/messages/nmea_sentence_message.dart';
export 'src/profile/messages/obdii_data_message.dart';
export 'src/profile/messages/ohr_settings_message.dart';
export 'src/profile/messages/one_d_sensor_calibration_message.dart';
export 'src/profile/messages/power_zone_message.dart';
export 'src/profile/messages/record_message.dart';
export 'src/profile/messages/schedule_message.dart';
export 'src/profile/messages/sdm_profile_message.dart';
export 'src/profile/messages/segment_file_message.dart';
export 'src/profile/messages/segment_id_message.dart';
export 'src/profile/messages/segment_lap_message.dart';
export 'src/profile/messages/segment_leaderboard_entry_message.dart';
export 'src/profile/messages/segment_point_message.dart';
export 'src/profile/messages/session_message.dart';
export 'src/profile/messages/set_message.dart';
export 'src/profile/messages/slave_device_message.dart';
export 'src/profile/messages/software_message.dart';
export 'src/profile/messages/speed_zone_message.dart';
export 'src/profile/messages/sport_message.dart';
export 'src/profile/messages/stress_level_message.dart';
export 'src/profile/messages/three_d_sensor_calibration_message.dart';
export 'src/profile/messages/timestamp_correlation_message.dart';
export 'src/profile/messages/totals_message.dart';
export 'src/profile/messages/training_file_message.dart';
export 'src/profile/messages/user_profile_message.dart';
export 'src/profile/messages/video_clip_message.dart';
export 'src/profile/messages/video_description_message.dart';
export 'src/profile/messages/video_frame_message.dart';
export 'src/profile/messages/video_message.dart';
export 'src/profile/messages/video_title_message.dart';
export 'src/profile/messages/watchface_settings_message.dart';
export 'src/profile/messages/weather_alert_message.dart';
export 'src/profile/messages/weather_conditions_message.dart';
export 'src/profile/messages/weight_scale_message.dart';
export 'src/profile/messages/workout_message.dart';
export 'src/profile/messages/workout_session_message.dart';
export 'src/profile/messages/workout_step_message.dart';
export 'src/profile/messages/zones_target_message.dart';
