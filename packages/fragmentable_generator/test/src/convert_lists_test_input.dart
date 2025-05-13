part of '_fragmentable_test_input.dart';

@ShouldGenerate(r'''
extension ConvertListsClassFragmentable on Fragment2 {
  ConvertListsClass toModel() => ConvertListsClass(isActive: isActive);
}

extension ConvertListsClassFragmentable on List<Fragment2> {
  List<ConvertListsClass> toModels() => map((e) => e.toModel()).toList();
}
''')
@Fragmentable(fragment: Fragment2, generateListExtension: true)
class ConvertListsClass {
  final bool isActive;

  ConvertListsClass({
    required this.isActive,
  });
}
