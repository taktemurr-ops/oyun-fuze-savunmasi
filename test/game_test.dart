import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_fuze_savunmasi/oyun_fuze_savunmasi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(fuzeConfig.title.length, 33);
    expect(fuzeConfig.tagline.length, 33);
    for (final s in fuzeConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(fuzeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: fuzeId, optionalMechanics: fuzeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(fuzeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
