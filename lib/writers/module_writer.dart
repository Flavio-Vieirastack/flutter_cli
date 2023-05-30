
import 'dart:io';

import '../constants/constants.dart';

class ModuleWriter {
  static void createModule({
    required String path,
    required String featureNameInCamelCase,
    required String testDir,
    required String featureName,
    required String capitalizedFeatureName,
  }) {
    final moduleFile = File(
      '$path/${featureNameInCamelCase}_module.dart',
    );
    moduleFile.writeAsString(
      Constants.module(capitalizedFeatureName),
    );
  }
}