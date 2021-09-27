/// Autogenerated. Do not modify.
///
/// Profile: 21.60

import '../../data_message.dart';
import '../../definition_message.dart';
import '../../developer_field.dart';
import '../../generic_message.dart';
import 'file_id_message.dart';
import 'file_creator_message.dart';
import 'timestamp_correlation_message.dart';
import 'software_message.dart';
import 'slave_device_message.dart';
import 'capabilities_message.dart';
import 'file_capabilities_message.dart';
import 'mesg_capabilities_message.dart';
import 'field_capabilities_message.dart';
import 'device_settings_message.dart';
import 'user_profile_message.dart';
import 'hrm_profile_message.dart';
import 'sdm_profile_message.dart';
import 'bike_profile_message.dart';
import 'connectivity_message.dart';
import 'watchface_settings_message.dart';
import 'ohr_settings_message.dart';
import 'zones_target_message.dart';
import 'sport_message.dart';
import 'hr_zone_message.dart';
import 'speed_zone_message.dart';
import 'cadence_zone_message.dart';
import 'power_zone_message.dart';
import 'met_zone_message.dart';
import 'dive_settings_message.dart';
import 'dive_alarm_message.dart';
import 'dive_gas_message.dart';
import 'goal_message.dart';
import 'activity_message.dart';
import 'session_message.dart';
import 'lap_message.dart';
import 'length_message.dart';
import 'record_message.dart';
import 'event_message.dart';
import 'device_info_message.dart';
import 'training_file_message.dart';
import 'hrv_message.dart';
import 'weather_conditions_message.dart';
import 'weather_alert_message.dart';
import 'gps_metadata_message.dart';
import 'camera_event_message.dart';
import 'gyroscope_data_message.dart';
import 'accelerometer_data_message.dart';
import 'magnetometer_data_message.dart';
import 'barometer_data_message.dart';
import 'three_d_sensor_calibration_message.dart';
import 'one_d_sensor_calibration_message.dart';
import 'video_frame_message.dart';
import 'obdii_data_message.dart';
import 'nmea_sentence_message.dart';
import 'aviation_attitude_message.dart';
import 'video_message.dart';
import 'video_title_message.dart';
import 'video_description_message.dart';
import 'video_clip_message.dart';
import 'set_message.dart';
import 'jump_message.dart';
import 'course_message.dart';
import 'course_point_message.dart';
import 'segment_id_message.dart';
import 'segment_leaderboard_entry_message.dart';
import 'segment_point_message.dart';
import 'segment_lap_message.dart';
import 'segment_file_message.dart';
import 'workout_message.dart';
import 'workout_session_message.dart';
import 'workout_step_message.dart';
import 'exercise_title_message.dart';
import 'schedule_message.dart';
import 'totals_message.dart';
import 'weight_scale_message.dart';
import 'blood_pressure_message.dart';
import 'monitoring_info_message.dart';
import 'monitoring_message.dart';
import 'hr_message.dart';
import 'stress_level_message.dart';
import 'memo_glob_message.dart';
import 'ant_channel_id_message.dart';
import 'ant_rx_message.dart';
import 'ant_tx_message.dart';
import 'exd_screen_configuration_message.dart';
import 'exd_data_field_configuration_message.dart';
import 'exd_data_concept_configuration_message.dart';
import 'field_description_message.dart';
import 'developer_data_id_message.dart';
import 'dive_summary_message.dart';
import 'climb_pro_message.dart';

class MessageFactory {

  static DataMessage fromDefinition(DefinitionMessage definitionMessage, List<DeveloperField> developerFields) {
    switch (definitionMessage.globalId) {
      case FileIdMessage.ID:
        return FileIdMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case FileCreatorMessage.ID:
        return FileCreatorMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case TimestampCorrelationMessage.ID:
        return TimestampCorrelationMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SoftwareMessage.ID:
        return SoftwareMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SlaveDeviceMessage.ID:
        return SlaveDeviceMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case CapabilitiesMessage.ID:
        return CapabilitiesMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case FileCapabilitiesMessage.ID:
        return FileCapabilitiesMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case MesgCapabilitiesMessage.ID:
        return MesgCapabilitiesMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case FieldCapabilitiesMessage.ID:
        return FieldCapabilitiesMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case DeviceSettingsMessage.ID:
        return DeviceSettingsMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case UserProfileMessage.ID:
        return UserProfileMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case HrmProfileMessage.ID:
        return HrmProfileMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SdmProfileMessage.ID:
        return SdmProfileMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case BikeProfileMessage.ID:
        return BikeProfileMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ConnectivityMessage.ID:
        return ConnectivityMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case WatchfaceSettingsMessage.ID:
        return WatchfaceSettingsMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case OhrSettingsMessage.ID:
        return OhrSettingsMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ZonesTargetMessage.ID:
        return ZonesTargetMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SportMessage.ID:
        return SportMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case HrZoneMessage.ID:
        return HrZoneMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SpeedZoneMessage.ID:
        return SpeedZoneMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case CadenceZoneMessage.ID:
        return CadenceZoneMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case PowerZoneMessage.ID:
        return PowerZoneMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case MetZoneMessage.ID:
        return MetZoneMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case DiveSettingsMessage.ID:
        return DiveSettingsMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case DiveAlarmMessage.ID:
        return DiveAlarmMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case DiveGasMessage.ID:
        return DiveGasMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case GoalMessage.ID:
        return GoalMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ActivityMessage.ID:
        return ActivityMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SessionMessage.ID:
        return SessionMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case LapMessage.ID:
        return LapMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case LengthMessage.ID:
        return LengthMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case RecordMessage.ID:
        return RecordMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case EventMessage.ID:
        return EventMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case DeviceInfoMessage.ID:
        return DeviceInfoMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case TrainingFileMessage.ID:
        return TrainingFileMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case HrvMessage.ID:
        return HrvMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case WeatherConditionsMessage.ID:
        return WeatherConditionsMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case WeatherAlertMessage.ID:
        return WeatherAlertMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case GpsMetadataMessage.ID:
        return GpsMetadataMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case CameraEventMessage.ID:
        return CameraEventMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case GyroscopeDataMessage.ID:
        return GyroscopeDataMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case AccelerometerDataMessage.ID:
        return AccelerometerDataMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case MagnetometerDataMessage.ID:
        return MagnetometerDataMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case BarometerDataMessage.ID:
        return BarometerDataMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ThreeDSensorCalibrationMessage.ID:
        return ThreeDSensorCalibrationMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case OneDSensorCalibrationMessage.ID:
        return OneDSensorCalibrationMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case VideoFrameMessage.ID:
        return VideoFrameMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ObdiiDataMessage.ID:
        return ObdiiDataMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case NmeaSentenceMessage.ID:
        return NmeaSentenceMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case AviationAttitudeMessage.ID:
        return AviationAttitudeMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case VideoMessage.ID:
        return VideoMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case VideoTitleMessage.ID:
        return VideoTitleMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case VideoDescriptionMessage.ID:
        return VideoDescriptionMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case VideoClipMessage.ID:
        return VideoClipMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SetMessage.ID:
        return SetMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case JumpMessage.ID:
        return JumpMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case CourseMessage.ID:
        return CourseMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case CoursePointMessage.ID:
        return CoursePointMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SegmentIdMessage.ID:
        return SegmentIdMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SegmentLeaderboardEntryMessage.ID:
        return SegmentLeaderboardEntryMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SegmentPointMessage.ID:
        return SegmentPointMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SegmentLapMessage.ID:
        return SegmentLapMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case SegmentFileMessage.ID:
        return SegmentFileMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case WorkoutMessage.ID:
        return WorkoutMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case WorkoutSessionMessage.ID:
        return WorkoutSessionMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case WorkoutStepMessage.ID:
        return WorkoutStepMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ExerciseTitleMessage.ID:
        return ExerciseTitleMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ScheduleMessage.ID:
        return ScheduleMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case TotalsMessage.ID:
        return TotalsMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case WeightScaleMessage.ID:
        return WeightScaleMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case BloodPressureMessage.ID:
        return BloodPressureMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case MonitoringInfoMessage.ID:
        return MonitoringInfoMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case MonitoringMessage.ID:
        return MonitoringMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case HrMessage.ID:
        return HrMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case StressLevelMessage.ID:
        return StressLevelMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case MemoGlobMessage.ID:
        return MemoGlobMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case AntChannelIdMessage.ID:
        return AntChannelIdMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case AntRxMessage.ID:
        return AntRxMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case AntTxMessage.ID:
        return AntTxMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ExdScreenConfigurationMessage.ID:
        return ExdScreenConfigurationMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ExdDataFieldConfigurationMessage.ID:
        return ExdDataFieldConfigurationMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ExdDataConceptConfigurationMessage.ID:
        return ExdDataConceptConfigurationMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case FieldDescriptionMessage.ID:
        return FieldDescriptionMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case DeveloperDataIdMessage.ID:
        return DeveloperDataIdMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case DiveSummaryMessage.ID:
        return DiveSummaryMessage(definitionMessage: definitionMessage, developerFields: developerFields);
      case ClimbProMessage.ID:
        return ClimbProMessage(definitionMessage: definitionMessage, developerFields: developerFields);

      default:
        return GenericMessage(definitionMessage: definitionMessage, developerFields: developerFields);

    }
  }
}