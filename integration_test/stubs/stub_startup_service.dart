import 'package:books_app_client/features/startup/application/services/startup_service.dart';

class StubStatupService implements StartupService {
  @override
  Future<bool> isUserSignedIn() {
    return Future.value(false);
  }
}
