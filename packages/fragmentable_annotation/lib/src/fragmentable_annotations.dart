import 'package:meta/meta_meta.dart';

@Target({TargetKind.classType})
class Fragmentable {
  const Fragmentable({required this.fragment});

  final Type fragment;
}

@Target({TargetKind.field})
class FragmentableKey {
  /// The key to use in the JSON map when reading and writing values for the
  /// annotated field.
  ///
  /// If `null`, the field name will be used as the key.
  final String? name;

  /// `true` if the generator should ignore this field completely.
  ///
  /// If `false`, the field will be considered for
  /// serialization.
  final bool ignore;

  /// `true` if the generator should convert the annotated field to a model
  /// calling the `toModel` method on the [fragmentType].
  ///
  /// If `false`, the field will be considered for
  /// serialization.
  final bool shouldConvertToModel;

  static const displayName = 'FragmentableKey';

  const FragmentableKey({
    this.name,
    this.shouldConvertToModel = false,
    this.ignore = false,
  });
}
