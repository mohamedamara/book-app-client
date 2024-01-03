import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String baseUrl = _Env.baseUrl;
}
