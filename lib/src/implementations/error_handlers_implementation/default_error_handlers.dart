import 'package:error_handling_for_perception/error_handling_for_perception.dart';
import 'package:types_for_perception/core_types.dart';
import 'package:types_for_perception/error_handling_types.dart';
import 'package:types_for_perception/state_types.dart';

/// TODO: We need a type for [state] that has [copyWith(reports: ...]
/// and as [extends AstroState]
///
class DefaultErrorHandlers<S extends AstroState> implements ErrorHandlers<S> {
  @override
  void handleLandingError({
    required Object thrown,
    required StackTrace trace,
    required ErrorReportSettings reportSettings,
    required LandingMission mission,
    required MissionControl missionControl,
  }) {
    missionControl.land(CreateErrorReport<S>(thrown, trace,
        settings: reportSettings, details: {'While landing': '$mission'}));
  }

  @override
  void handleLaunchError({
    required Object thrown,
    required StackTrace trace,
    required ErrorReportSettings reportSettings,
    required AwayMission mission,
    required MissionControl missionControl,
  }) {
    missionControl.land(CreateErrorReport<S>(thrown, trace,
        settings: reportSettings, details: {'While launching': '$mission'}));
  }
}
