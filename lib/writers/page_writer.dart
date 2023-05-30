import 'dart:io';

import '../constants/constants.dart';

class PageWriter {
  static void createPage({
    required String path,
    required String featureNameInCamelCase,
    required String testDir,
    required String featureName,
    required String capitalizedFeatureName,
  }) {
    final pageFile = File(
      '$path/${featureNameInCamelCase}_page.dart',
    );
    pageFile.writeAsString(
      Constants.page(capitalizedFeatureName),
    );
  }
}
