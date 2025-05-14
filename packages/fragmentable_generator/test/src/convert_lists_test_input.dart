part of '_fragmentable_test_input.dart';

@ShouldGenerate(r'''
extension ListClassFragmentable on Fragment2 {
  ListClass toModel() => ListClass(isActive: isActive);
}

extension ListClassFragmentableList on List<Fragment2> {
  List<ListClass> toModels() => map((fragment) => fragment.toModel()).toList();
}

extension ListClassFragmentableNullableList on List<Fragment2?> {
  List<ListClass> toModels() {
    final result = <ListClass>[];

    for (final fragment in this) {
      if (fragment == null) {
        continue;
      }

      result.add(fragment.toModel());
    }

    return result;
  }
}
''')
@Fragmentable(fragment: Fragment2, generateListExtension: true)
class ListClass {
  final bool isActive;

  ListClass({
    required this.isActive,
  });
}
