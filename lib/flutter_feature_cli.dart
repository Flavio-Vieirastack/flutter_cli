import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:cli_script/cli_script.dart';
import 'package:path/path.dart' as p;

import 'helper/whrite_files.dart';

// Esse é para criar feature dentro do proprio projeto sem package de logica
void main(List<String> args) {
  final entityAndModelNames = <String>{};
  final currentDir = Directory.current;
  final finalDir = p.join(
    currentDir.path,
    'lib',
    'src',
    'features',
  );
  print('🚀 Type your feature name 🚀');
  final featureNameRaw = stdin.readLineSync();
  final featureName =
      StringUtils.camelCaseToLowerUnderscore(featureNameRaw ?? '');
  String exit = '';
  print(
    '🚨 Type all entity/model names for $featureNameRaw ⛔️without "Entity" or "Model" at the end⛔️, and in ⛔️CamelCase⛔️. (Obs: Type "e" to exit)🚨',
  );
  while (exit.toLowerCase() != 'e') {
    final entitieName = stdin.readLineSync();
    exit = entitieName ?? '';
    if (entitieName != null && entitieName != 'e') {
      entityAndModelNames.add(entitieName);
      print(
        '⚡️ Your entities/Models ${entityAndModelNames.toString()} ⚡️',
      );
    }
  }
  final pathToDatasource = '$finalDir/$featureName/data/datasource';
  final pathToRepositoryInterface = '$finalDir/$featureName/domain/repository';
  final pathToRepositoryImpl = '$finalDir/$featureName/data/repository';
  final pathToUsecase = '$finalDir/$featureName/domain/usecase';
  final pathToEntity = '$finalDir/$featureName/domain/entity';
  final pathToModel = '$finalDir/$featureName/data/model';
  final pathToPage = '$finalDir/$featureName/presenter/pages';
  final pathToCubit = '$finalDir/$featureName/presenter/cubits';
  final pathToError = '$finalDir/$featureName/domain/errors';
  final pathToModule = '$finalDir/$featureName/presenter/module';
  final testDir = finalDir.replaceAll('/lib', '/test');

  final mkdir = Platform.isMacOS ? 'mkdir -p' : 'mkdir';

  wrapMain(() async {
    await run(
      "$mkdir $finalDir/$featureName",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/data",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/data",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/data/datasource",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/data/datasource",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/data/repository",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/data/repository",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/data/model",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/data/model",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/domain",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/domain",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/domain/usecase",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/domain/usecase",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/domain/repository",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/domain/entity",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/domain/errors",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/domain/errors",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/presenter/pages",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/presenter/widget",
      runInShell: true,
    );
    await run(
      "$mkdir $testDir/$featureName/presenter/cubit",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/presenter/pages",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/presenter/widgets",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/presenter/cubits",
      runInShell: true,
    );
    await run(
      "$mkdir $finalDir/$featureName/domain/entity",
      runInShell: true,
    ).then((_) {
      writeFile(
        data: entityAndModelNames,
        path: pathToEntity,
        writeEntity: true,
        featureName: featureName,
        finalDir: finalDir,
        modelPath: pathToModel,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToUsecase,
        featureName: featureName,
        writeUsecase: true,
        finalDir: finalDir,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToRepositoryInterface,
        featureName: featureName,
        writeRepository: true,
        finalDir: finalDir,
        repositoryImplPath: pathToRepositoryImpl,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToDatasource,
        featureName: featureName,
        writeDatasource: true,
        finalDir: finalDir,
        datasourceImplPath: pathToDatasource,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToPage,
        featureName: featureName,
        writePage: true,
        finalDir: finalDir,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToCubit,
        featureName: featureName,
        writeCubit: true,
        finalDir: finalDir,
        featureNameRaw: featureNameRaw ?? '',
      );
      writeFile(
        data: {},
        path: pathToModule,
        featureName: featureName,
        writeModule: true,
        finalDir: finalDir,
        featureNameRaw: featureNameRaw ?? '',
      );
    }).then(
      (_) {
        entityAndModelNames.clear();
        print('✅ Feature created ✅');
        print('✅ Tests created ✅');
        print('⛔️Verify your test folder before send a pull request⛔️');
      },
    );
  });
}
