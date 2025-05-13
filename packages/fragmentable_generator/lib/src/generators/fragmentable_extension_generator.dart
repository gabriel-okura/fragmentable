import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:fragmentable_annotation/fragmentable_annotation.dart';
import 'package:fragmentable_generator/src/fragmentable_key_utils.dart';

class FragmentableExtensionGenerator {
  static String generate({
    required ClassElement element,
    required DartType fragmentType,
    required bool shouldGenerateListExtension,
  }) {
    final baseExtension = Extension(
      (builder) => builder
        ..name = '${element.name}Fragmentable'
        ..on = refer(fragmentType.getDisplayString())
        ..methods.add(
          Method(
            (builder) => builder
              ..name = 'toModel'
              ..lambda = true
              ..returns = refer(element.name)
              ..body = Block(
                (builder) => builder.statements.addAll([
                  Code('${element.name}('),
                  ...element.fields.map(_printFields).nonNulls,
                  Code(')'),
                ]),
              ),
          ),
        ),
    );

    final listExtension = Extension(
      (builder) => builder
        ..name = '${element.name}FragmentableFromList'
        ..on = refer('List<${fragmentType.getDisplayString()}>')
        ..methods.add(
          Method(
            (builder) => builder
              ..name = 'toModels'
              ..lambda = true
              ..returns = refer('List<${element.name}>')
              ..body = Block(
                (builder) => builder.statements.addAll([
                  Code('map((e) => e.toModel()).toList()'),
                ]),
              ),
          ),
        ),
    );

    final emitter = DartEmitter.scoped(useNullSafetySyntax: true);
    final result = StringBuffer();

    result.writeln(baseExtension.accept(emitter));

    if (shouldGenerateListExtension) {
      result.writeln(listExtension.accept(emitter));
    }

    return result.toString();
  }

  static Code? _printFields(FieldElement field) {
    final fragmentableKey = getFragmentableKey(field) ?? FragmentableKey();

    if (fragmentableKey.ignore) {
      return null;
    }

    final propertyName = fragmentableKey.name ?? field.name;
    final isListType = field.type.isDartCoreList;

    final propertyGetterName = isListType ? 'toModels()' : 'toModel()';

    if (fragmentableKey.shouldConvertToModel) {
      return Code('${field.name}: $propertyName.$propertyGetterName,');
    }

    return Code('${field.name}: $propertyName,');
  }
}
