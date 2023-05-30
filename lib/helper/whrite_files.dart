import 'package:basic_utils/basic_utils.dart';
String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
String invertCapitalize(String s) => s[0].toLowerCase() + s.substring(1);
void writeFile({
  required Set<String> data,
  required String path,
  required String featureName,
  required String featureNameRaw,
  required String finalDir,
  String? modelPath,
  String? repositoryImplPath,
  String? datasourceImplPath,
  bool writeEntity = false,
  bool writeUsecase = false,
  bool writeRepository = false,
  bool writeDatasource = false,
  bool writePage = false,
  bool writeCubit = false,
  bool writeError = false,
}) {
  final capitalizedFeatureName = capitalize(featureNameRaw);
  final usecaseInterfaceFileName = '${capitalizedFeatureName}Usecase';
  final usecaseImplFileName = '${capitalizedFeatureName}UsecaseImpl';

  final repositoryInterfaceFileName = '${capitalizedFeatureName}Repository';
  final repositoryImplFileName = '${capitalizedFeatureName}RepositoryImpl';

  final datasourceInterfaceFileName = '${capitalizedFeatureName}Datasource';
  final datasourceImplFileName = '${capitalizedFeatureName}DatasourceImpl';
  final testDir = finalDir.replaceAll('/lib', '/test');
  final featureNameInCamelCase =
      StringUtils.camelCaseToLowerUnderscore(featureName);
  if (writeEntity) {
    
  }
}