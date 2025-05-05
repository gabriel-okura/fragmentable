import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:fragmentable_generator/src/generators/fragmentable_generator.dart';
import 'package:source_gen/source_gen.dart';

Builder fragmentableBuilder(BuilderOptions options) => PartBuilder(
  [FragmentableGenerator()],
  '.fragmentable.dart',
  options: options,
  formatOutput:
      (code, languageVersion) =>
          DartFormatter(languageVersion: languageVersion).format(code),
  header: '// GENERATED CODE - DO NOT MODIFY BY HAND',
);
