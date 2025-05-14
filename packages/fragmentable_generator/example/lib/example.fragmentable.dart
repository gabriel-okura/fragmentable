// ignore_for_file: type=lint
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// FragmentableGenerator
// **************************************************************************

extension FragmentModelFragmentable on Fragment {
  FragmentModel toModel() => FragmentModel(name: name);
}

extension Fragment2ModelFragmentable on Fragment2 {
  Fragment2Model toModel() => Fragment2Model(
    model: classFragment.toModel(),
    name: name,
    isActive: isActive,
  );
}

extension Fragment2ModelFragmentableList on List<Fragment2> {
  List<Fragment2Model> toModels() =>
      map((fragment) => fragment.toModel()).toList();
}

extension Fragment2ModelFragmentableNullableList on List<Fragment2?> {
  List<Fragment2Model> toModels() {
    final result = <Fragment2Model>[];

    for (final fragment in this) {
      if (fragment == null) {
        continue;
      }

      result.add(fragment.toModel());
    }

    return result;
  }
}
