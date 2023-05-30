import 'dart:io';

import '../constants/constants.dart';

class CubitWriter {
  static void createCubit({
    required String path,
    required String featureNameInCamelCase,
    required String testDir,
    required String featureName,
    required String capitalizedFeatureName,
  }) {
    final cubitFile = File('$path/${featureNameInCamelCase}_bloc.dart');
    final stateFile = File('$path/${featureNameInCamelCase}_state.dart');
    cubitFile.writeAsString(
      Constants.cubit(
        capitalizedFeatureName,
        featureNameInCamelCase,
      ),
    );
    stateFile.writeAsString(
      Constants.state(
        capitalizedFeatureName,
        featureNameInCamelCase,
      ),
    );
    
  }
}