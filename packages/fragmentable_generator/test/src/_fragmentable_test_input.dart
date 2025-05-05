import 'package:fragmentable_annotation/fragmentable_annotation.dart';
import 'package:source_gen_test/source_gen_test.dart';

part 'convert_to_model_test_input.dart';

@ShouldGenerate(r'''
extension EmptyClassFragmentable on Fragment {
  EmptyClass toModel() => EmptyClass();
}
''')
@Fragmentable(fragmentType: Fragment)
class EmptyClass {}

@ShouldGenerate(r'''
extension SingleFieldClassFragmentable on Fragment {
  SingleFieldClass toModel() => SingleFieldClass(name: name);
}
''')
@Fragmentable(fragmentType: Fragment)
class SingleFieldClass {
  final String name;

  SingleFieldClass({required this.name});
}

@ShouldGenerate(r'''
extension IgnoreFieldClassFragmentable on Fragment {
  IgnoreFieldClass toModel() => IgnoreFieldClass();
}
''')
@Fragmentable(fragmentType: Fragment)
class IgnoreFieldClass {
  @FragmentableKey(ignore: true)
  final String? name;

  IgnoreFieldClass({this.name});
}

@ShouldGenerate(r'''
extension CustomFieldNameClassFragmentable on Fragment {
  CustomFieldNameClass toModel() => CustomFieldNameClass(name: customFieldName);
}
''')
@Fragmentable(fragmentType: Fragment)
class CustomFieldNameClass {
  @FragmentableKey(name: 'customFieldName')
  final String name;

  CustomFieldNameClass({required this.name});
}

class Fragment {}
