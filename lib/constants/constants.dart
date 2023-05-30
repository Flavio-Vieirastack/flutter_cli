import 'package:basic_utils/basic_utils.dart';

import '../helper/whrite_files.dart';

class Constants {
  static String entity(String entityName) {
    return '''
base class $entityName {
  
}
''';
  }

  static String entityTest() {
    return '''

import 'package:test/test.dart';

void main() {
  test('Shoud return a correct value for ...', () {

  });
}
 ''';
  }

  static String usecaseInterface(String usecaseInterfaceFileName) {
    return '''
abstract interface class $usecaseInterfaceFileName {
  
}
''';
  }

  static String usecaseImpl(
    String featureNameInCamelCase,
    String usecaseImplFileName,
    String usecaseInterfaceFileName,
  ) {
    return '''
import '${featureNameInCamelCase}_usecase.dart';

final class $usecaseImplFileName implements $usecaseInterfaceFileName {
  
}
''';
  }

  static String usecaseTest(
    String repositoryInterfaceFileName,
    String usecaseInterfaceFileName,
    String usecaseImplFileName,
  ) {
    final mockName = '${repositoryInterfaceFileName}Mock';
    final mockVariableName = invertCapitalize(mockName);
    final usecaseVariableName = invertCapitalize(usecaseInterfaceFileName);
    return ''' 

import 'package:test/test.dart';

class $mockName extends Mock implements $repositoryInterfaceFileName {}

void main() {
  late $mockName $mockVariableName;
  late $usecaseInterfaceFileName $usecaseVariableName;

  setUp(() {
    $mockVariableName = $mockName();
    $usecaseVariableName = $usecaseImplFileName();
  });

  test('Shoud return a correct value for ...', () async {
    when(() => $mockVariableName. )// TODO Add
        .thenAnswer((_) async => const Right(null));
    final sut = await $usecaseVariableName.

    expect(sut, const Right(null));

    verify(() => $mockVariableName. )// TODO Add
        .called(greaterThanOrEqualTo(1));
  });

  test('Shoud return a correct error value for ...', () async {
    when(() => $mockVariableName. )// TODO Add
        .thenAnswer((_) async => const Left(null));
    
    final sut = await $usecaseVariableName.// TODO Add

    expect(sut, const Left(null));
  });
}

    ''';
  }

  static String repositoryInterface(
    String repositoryInterfaceFileName,
  ) {
    return '''
abstract interface class $repositoryInterfaceFileName {
  
}

''';
  }

  static String repositoryImpl(
    String repositoryImplFileName,
    String repositoryInterfaceFileName,
    String datasourceInterfaceFileName,
    String featureName,
  ) {
    final datasourceVariable = invertCapitalize(datasourceInterfaceFileName);
    final snackcaseFeatureName =
        StringUtils.camelCaseToLowerUnderscore(featureName);
    return '''
import '../../domain/repository/${snackcaseFeatureName}_repository.dart';
import '../../domain/repository/${snackcaseFeatureName}_datasource.dart';

final class $repositoryImplFileName
    implements $repositoryInterfaceFileName {
  final $datasourceInterfaceFileName _$datasourceVariable;

  $repositoryImplFileName(
      {required $datasourceInterfaceFileName
          $datasourceVariable,})
      : _$datasourceVariable = $datasourceVariable;
}
 ''';
  }

  static String repositoryTest(
    String datasourceInterfaceFileName,
    String repositoryInterfaceFileName,
    String repositoryImplFileName,
  ) {
    final mockName = '${datasourceInterfaceFileName}Mock';
    final mockVariableName = invertCapitalize(mockName);
    final repositoryVariableName =
        invertCapitalize(repositoryInterfaceFileName);
    return '''
import 'package:test/test.dart';

class $mockName extends Mock implements $datasourceInterfaceFileName {}

void main() {
  late $mockName $mockVariableName;
  late $repositoryInterfaceFileName $repositoryVariableName;

  setUp(() {
    $mockVariableName = $mockName();
     $repositoryVariableName = $repositoryImplFileName();
  });

  test(
      'Shoud return the correct value for ...',
      () async {

    when(() => $mockVariableName.) //TODO add
        .thenAnswer((_) async => null);//TODO add

    final sut = await $repositoryVariableName.;//TODO add
    expect(sut, Right(null));//TODO add
    verify(() => $mockVariableName. )// TODO Add
        .called(greaterThanOrEqualTo(1));
  });

  test('Shoud return the correct error value for ...', () async {
    when(() => $mockVariableName.)// TODO Add
        .thenThrow(null);// TODO Add

    final sut = await $repositoryVariableName.;//TODO add

    expect(sut, Left(null));//TODO add
  });
}
''';
  }

  static String model(String modelName) {
    return '''
base class $modelName {

}
''';
  }

  static String modelTest() {
    return '''

import 'package:test/test.dart';

void main() {
  test('Shoud return a correct value for ...', () {

  });
}
 ''';
  }

  static String datasource(String datasourceInterfaceFileName) {
    return '''
abstract interface class $datasourceInterfaceFileName {
  
}
''';
  }

  static String datasourceImpl(
    String datasourceInterfaceFileName,
    String datasourceImplFileName,
    String featureNameInCamelCase,
  ) {
    final datasourcePath = '${featureNameInCamelCase}_datasource.dart';
    return '''
import '$datasourcePath';

final class $datasourceImplFileName
    implements $datasourceInterfaceFileName {
  final DioRestClient _dioRestClient;

  $datasourceImplFileName({required DioRestClient dioRestClient,})
      : _dioRestClient = dioRestClient;

}
''';
  }

  static String datasourceTest(
    String datasourceInterfaceFileName,
    String datasourceImplFileName,
  ) {
    final datasourceVariable = invertCapitalize(datasourceInterfaceFileName);
    return '''
import 'package:test/test.dart';

class MockRestClientGet extends Mock implements RestClientGet {}

void main() {
  late MockRestClientGet mockRestClientGet;
  late $datasourceInterfaceFileName $datasourceVariable;

  setUp(() {
    mockRestClientGet = _MockRestClientGet();
    $datasourceVariable =
        $datasourceImplFileName();
  });

  whenRestClientGet() => when(() => restClientGet.get(
    path: any(named: 'path'),
    queryParams: any(named: 'queryParams'),
    headers: any(named: 'headers')));

  test('should return a correct value for ...', () async {
    whenRestClientGet().thenAnswer((invocation) async => RestClientResponse(
        data: json.decode(_responseMock()), statusCode: 200));

    final sut = await $datasourceVariable.;//TODO add
    expect(result, isA<null>());//TODO add
    verify(() => mockRestClientGet. )// TODO Add
        .called(greaterThanOrEqualTo(1));
  });

  test(
      'should return a correct error value for ...',
      () async {
    
    whenRestClientGet().thenThrow(Exception());//TODO add

    final sut = $datasourceVariable.;//TODO add

    expect(sut, throwsA(isA<null>()));//TODO add
    
  });
 
}
''';
  }

  static String page(String capitalizedFeatureName) {
    return '''
import 'package:flutter/material.dart';

class $capitalizedFeatureName extends StatelessWidget {

  const $capitalizedFeatureName({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(),
       );
  }
}
''';
  }

  static String cubit(
    String capitalizedFeatureName,
    String featureNameInCamelCase,
  ) {
    final usecaseVariableName = invertCapitalize(capitalizedFeatureName);
    return '''
import 'package:flutter_getit/flutter_getit.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecase/${featureNameInCamelCase}_usecase.dart';

part '${featureNameInCamelCase}_state.dart';

class ${capitalizedFeatureName}Bloc extends FlutterGetItBloc<${capitalizedFeatureName}State> {
  final ${capitalizedFeatureName}Usecase _${usecaseVariableName}Usecase;

  ${capitalizedFeatureName}Bloc({
    required ${capitalizedFeatureName}Usecase ${usecaseVariableName}Usecase,
  })  : _${usecaseVariableName}Usecase = ${usecaseVariableName}Usecase;

}
''';
  }

  static String state(
    String capitalizedFeatureName,
    String featureNameInCamelCase,
  ) {
    return '''
part of '${featureNameInCamelCase}_cubit.dart';

sealed class ${capitalizedFeatureName}State extends Equatable {
  const ${capitalizedFeatureName}State();

  @override
  List<Object> get props => [];
}

base class ${capitalizedFeatureName}Initial extends ${capitalizedFeatureName}State {}


''';
  }

  static String error(
    String capitalizedFeatureName,
  ) {
    return '''

class ${capitalizedFeatureName}Error {
  final String message;
  ${capitalizedFeatureName}Error({required this.message});
}
''';
  }

  static String errorTest() {
    return '''
import 'package:test/test.dart';

void main() {
  test('description', () {

  });
}
''';
  }

  static String module(
    String capitalizedFeatureName,
  ) {
    return '''
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import '../presenter/page/${capitalizedFeatureName}_page';

class ${capitalizedFeatureName}Module extends FlutterGetItPageRoute {
  const ${capitalizedFeatureName}Module({super.key});

  @override
  WidgetBuilder get page => (context) => const ${capitalizedFeatureName}Page();
  }
''';
  }
}
