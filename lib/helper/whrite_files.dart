import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_feature_cli/writers/module_writer.dart';

import '../writers/cubit_writer.dart';
import '../writers/datasource_writer.dart';
import '../writers/entity_and_model_writer.dart';
import '../writers/page_writer.dart';
import '../writers/repository_whriter.dart';
import '../writers/usecase_whriter.dart';

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
  bool writeModule = false,
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
    EntityAndModelWriter.createEntity(
      data: data,
      path: path,
      modelPath: modelPath ?? '',
      testDir: testDir,
      featureName: featureName,
    );
  } else if (writeUsecase) {
    UsecaseWriter.createUsecase(
      featureNameInCamelCase: featureNameInCamelCase,
      path: path,
      testDir: testDir,
      featureName: featureName,
      usecaseInterfaceFileName: usecaseInterfaceFileName,
      usecaseImplFileName: usecaseImplFileName,
      repositoryInterfaceFileName: repositoryInterfaceFileName,
    );
  } else if (writeRepository) {
    RepositoryWriter.createRepository(
      path: path,
      featureNameInCamelCase: featureNameInCamelCase,
      repositoryImplPath: repositoryImplPath ?? '',
      testDir: testDir,
      featureName: featureName,
      repositoryInterfaceFileName: repositoryInterfaceFileName,
      repositoryImplFileName: repositoryImplFileName,
      datasourceInterfaceFileName: datasourceInterfaceFileName,
    );
  } else if (writeDatasource) {
    DatasourceWriter.createDatasource(
      datasourceImplPath: datasourceImplPath ?? '',
      featureNameInCamelCase: featureNameInCamelCase,
      testDir: testDir,
      featureName: featureName,
      datasourceInterfaceFileName: datasourceInterfaceFileName,
      datasourceImplFileName: datasourceImplFileName,
    );
  } else if (writePage) {
    PageWriter.createPage(
      path: path,
      featureNameInCamelCase: featureNameInCamelCase,
      testDir: testDir,
      featureName: featureName,
      capitalizedFeatureName: capitalizedFeatureName,
    );
  } else if (writeCubit) {
    CubitWriter.createCubit(
      path: path,
      featureNameInCamelCase: featureNameInCamelCase,
      testDir: testDir,
      featureName: featureName,
      capitalizedFeatureName: capitalizedFeatureName,
    );
  } else if (writeModule) {
    ModuleWriter.createModule(
      path: path,
      featureNameInCamelCase: featureNameInCamelCase,
      testDir: testDir,
      featureName: featureName,
      capitalizedFeatureName: capitalizedFeatureName,
    );
  }
}
