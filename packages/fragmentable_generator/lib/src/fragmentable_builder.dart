import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:source_gen/source_gen.dart';

Builder convertableBuilder(BuilderOptions options) => PartBuilder(
  [],
  '.fragmentable.dart',
  options: options,
  formatOutput:
      (code, languageVersion) =>
          DartFormatter(languageVersion: languageVersion).format(code),
);
