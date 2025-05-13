import 'package:fragmentable_annotation/fragmentable_annotation.dart';

part 'example.fragmentable.dart';

@Fragmentable(fragment: Fragment)
class FragmentModel {
  final String name;

  FragmentModel({required this.name});
}

@Fragmentable(fragment: Fragment2, generateListExtension: true)
class Fragment2Model {
  @FragmentableKey(name: 'classFragment', shouldConvertToModel: true)
  final FragmentModel model;
  final String name;
  final bool isActive;

  Fragment2Model({
    required this.model,
    required this.name,
    required this.isActive,
  });
}

class Fragment {
  final String name;

  Fragment({required this.name});
}

class Fragment2 {
  final Fragment classFragment;
  final String name;
  final bool isActive;

  Fragment2({
    required this.classFragment,
    required this.name,
    required this.isActive,
  });
}
