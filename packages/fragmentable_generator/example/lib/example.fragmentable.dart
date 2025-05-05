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
