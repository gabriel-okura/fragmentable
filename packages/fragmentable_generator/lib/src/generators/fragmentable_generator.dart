import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:fragmentable_annotation/fragmentable_annotation.dart';
import 'package:fragmentable_generator/src/generators/fragmentable_extension_generator.dart';
import 'package:source_gen/source_gen.dart';

class FragmentableGenerator extends GeneratorForAnnotation<Fragmentable> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Fragmentable can only be applied to classes.',
        element: element,
      );
    }

    final fragmentType = annotation.read('fragment').typeValue;
    final shouldGenerateListExtension =
        annotation.read('generateListExtension').boolValue;

    return FragmentableExtensionGenerator.generate(
      element: element,
      fragmentType: fragmentType,
      shouldGenerateListExtension: shouldGenerateListExtension,
    );
  }
}
