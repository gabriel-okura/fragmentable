part of '_fragmentable_test_input.dart';

@ShouldGenerate(r'''
extension ListClassFragmentable on Fragment2 {
  ListClass toModel() => ListClass(isActive: isActive);
}

extension ListClassFragmentableFromList on List<Fragment2> {
  List<ListClass> toModels() => map((e) => e.toModel()).toList();
}
''')
@Fragmentable(fragment: Fragment2, generateListExtension: true)
class ListClass {
  final bool isActive;

  ListClass({
    required this.isActive,
  });
}
