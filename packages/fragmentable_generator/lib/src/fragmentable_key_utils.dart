import 'package:analyzer/dart/element/element.dart';
import 'package:collection/collection.dart';
import 'package:fragmentable_annotation/fragmentable_annotation.dart';

FragmentableKey? getFragmentableKey(FieldElement field) {
  final metadata = field.metadata.firstWhereOrNull(
    (annotation) =>
        annotation.element?.displayName == FragmentableKey.displayName,
  );

  if (metadata == null) {
    return null;
  }

  final ignore =
      metadata.computeConstantValue()?.getField('ignore')?.toBoolValue();
  final name =
      metadata.computeConstantValue()?.getField('name')?.toStringValue();
  final shouldConvertToModel =
      metadata
          .computeConstantValue()
          ?.getField('shouldConvertToModel')
          ?.toBoolValue();

  return FragmentableKey(
    ignore: ignore ?? false,
    name: name,
    shouldConvertToModel: shouldConvertToModel ?? false,
  );
}
