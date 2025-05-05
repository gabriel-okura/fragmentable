import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';
import 'package:fragmentable_annotation/fragmentable_annotation.dart';
import 'package:fragmentable_generator/src/fragmentable_key_utils.dart';

class FragmentableExtensionGenerator {
  static String generate({
    required ClassElement element,
    required DartType fragmentType,
  }) {
    final extension = Extension(
      (builder) =>
          builder
            ..name = '${element.name}Fragmentable'
            ..on = refer(fragmentType.getDisplayString())
            ..methods.add(
              Method(
                (builder) =>
                    builder
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

    final emitter = DartEmitter.scoped(useNullSafetySyntax: true);

    return '${extension.accept(emitter)}';
  }

  static Code? _printFields(FieldElement field) {
    final fragmentableKey = getFragmentableKey(field) ?? FragmentableKey();

    if (fragmentableKey.ignore) {
      return null;
    }

    final propertyName = fragmentableKey.name ?? field.name;

    if (fragmentableKey.shouldConvertToModel) {
      return Code('${field.name}: $propertyName.toModel(),');
    }

    return Code('${field.name}: $propertyName,');
  }
}
