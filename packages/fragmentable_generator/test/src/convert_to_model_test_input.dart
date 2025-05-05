part of '_fragmentable_test_input.dart';

@ShouldGenerate(r'''
extension ConvertToModelClassFragmentable on Fragment2 {
  ConvertToModelClass toModel() => ConvertToModelClass(
    emptyClass: classFragment.toModel(),
    name: name,
    isActive: isActive,
  );
}
''')
@Fragmentable(fragmentType: Fragment2)
class ConvertToModelClass {
  @FragmentableKey(shouldConvertToModel: true, name: 'classFragment')
  final EmptyClass emptyClass;

  final String name;
  final bool isActive;

  ConvertToModelClass({
    required this.emptyClass,
    required this.name,
    required this.isActive,
  });
}

class Fragment2 {
  final Fragment emptyClass;
  final String name;
  final bool isActive;

  Fragment2({
    required this.emptyClass,
    required this.name,
    required this.isActive,
  });
}
