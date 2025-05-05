import 'package:fragmentable_generator/src/generators/fragmentable_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'package:path/path.dart' as p;

Future<void> main() async {
  initializeBuildLogTracking();

  final reader = await initializeLibraryReaderForDirectory(
    p.join('test', 'src'),
    '_fragmentable_test_input.dart',
  );

  testAnnotatedElements(reader, FragmentableGenerator());
}
