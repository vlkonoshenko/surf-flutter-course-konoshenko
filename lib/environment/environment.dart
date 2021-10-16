import 'config.dart';
import 'environment_type.dart';

class Environment {
  static Environment? _instance;
  final Config buildConfig;

  final EnvironmentType buildType;

   bool get isDebug => buildType == EnvironmentType.debug;

  Environment._(
    this.buildType,
    this.buildConfig,
  );

  static Environment instance() => _instance!;

  static void init({
    required EnvironmentType buildType,
    required Config config,
  }) {
    _instance ??= Environment._(buildType, config);
  }
}
