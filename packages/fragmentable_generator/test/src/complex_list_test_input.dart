part of '_fragmentable_test_input.dart';

class Fragment3 {
  final String name;

  Fragment3({required this.name,});
}

@Fragmentable(fragment: Fragment3, generateListExtension: true)
class Fragment3Model {
  final String name;

  const Fragment3Model({required this.name});
}

class Fragment4 {
  final String name;
  final List<Fragment3> fragments;

  const Fragment4({required this.name, required this.fragments});
}

@ShouldGenerate(r'''
extension Fragment4ModelFragmentable on Fragment4 {
  Fragment4Model toModel() =>
      Fragment4Model(name: name, fragments: fragments.toModels());
}
''')
@Fragmentable(fragment: Fragment4)
class Fragment4Model {
  final String name;

  @FragmentableKey(shouldConvertToModel: true)
  final List<Fragment3Model> fragments;

  const Fragment4Model({required this.name, required this.fragments});
}