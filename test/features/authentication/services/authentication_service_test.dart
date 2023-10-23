import 'package:books_app_client/core/models/failure.dart';
import 'package:books_app_client/core/network/jwt_state_provider.dart';
import 'package:books_app_client/features/authentication/repositories/authentication_repository.dart';
import 'package:books_app_client/features/authentication/repositories/secure_storage_repository.dart';
import 'package:books_app_client/features/authentication/services/authentication_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../core/utils/test_utils.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockSecureStorageRepository extends Mock
    implements SecureStorageRepository {}

void main() {
  late AuthenticationRepository mockedAuthenticationRepository;
  late SecureStorageRepository mockedSecureStorageRepository;

  String email = "test@whatever.com";
  String password = "12345678";

  setUp(() {
    mockedAuthenticationRepository = MockAuthenticationRepository();
    mockedSecureStorageRepository = MockSecureStorageRepository();
  });

  group('successful signin call', () {
    test('should return true', () async {
      String jwt = "abcdefg";

      when(
        () => mockedAuthenticationRepository.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Future.value(jwt),
      );

      when(
        () => mockedSecureStorageRepository.addData(any(), any()),
      ).thenAnswer(
        (_) async {},
      );

      final container = createContainer(
        overrides: [
          authenticationRepositoryProvider
              .overrideWithValue(mockedAuthenticationRepository),
          secureStorageRepositoryProvider
              .overrideWithValue(mockedSecureStorageRepository),
        ],
      );

      final authenticationService =
          container.read(authenticationServiceProvider);

      final result = await authenticationService.signIn(
        email: email,
        password: password,
      );

      expect(result, true);
    });

    test('should call secure storage to store the jwt', () async {
      String jwt = "abcdefg";

      when(
        () => mockedAuthenticationRepository.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Future.value(jwt),
      );

      when(
        () => mockedSecureStorageRepository.addData(any(), any()),
      ).thenAnswer(
        (_) async {},
      );

      final container = createContainer(
        overrides: [
          authenticationRepositoryProvider
              .overrideWithValue(mockedAuthenticationRepository),
          secureStorageRepositoryProvider
              .overrideWithValue(mockedSecureStorageRepository),
        ],
      );

      final authenticationService =
          container.read(authenticationServiceProvider);

      await authenticationService.signIn(
        email: email,
        password: password,
      );

      verify(() => mockedSecureStorageRepository.addData(any(), any()))
          .called(1);
    });

    test('should update jwtStateProvider with jwt value gotten from API',
        () async {
      String jwt = "abcdefg";

      when(
        () => mockedAuthenticationRepository.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Future.value(jwt),
      );

      when(
        () => mockedSecureStorageRepository.addData(any(), any()),
      ).thenAnswer(
        (_) async {},
      );

      final container = createContainer(
        overrides: [
          authenticationRepositoryProvider
              .overrideWithValue(mockedAuthenticationRepository),
          secureStorageRepositoryProvider
              .overrideWithValue(mockedSecureStorageRepository),
        ],
      );

      final listener = Listener<String>();

      container.listen<String>(
        jwtStateProvider,
        listener,
        fireImmediately: true,
      );

      verify(() => listener(null, '')).called(1);

      verifyNoMoreInteractions(listener);

      final authenticationService =
          container.read(authenticationServiceProvider);

      await authenticationService.signIn(
        email: email,
        password: password,
      );

      verify(() => listener('', jwt)).called(1);

      verifyNoMoreInteractions(listener);
    });

    test('but the jwt gotten from API is empty then it should return false',
        () async {
      String jwt = '';

      when(
        () => mockedAuthenticationRepository.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Future.value(jwt),
      );

      final container = createContainer(
        overrides: [
          authenticationRepositoryProvider
              .overrideWithValue(mockedAuthenticationRepository),
          secureStorageRepositoryProvider
              .overrideWithValue(mockedSecureStorageRepository),
        ],
      );

      final authenticationService =
          container.read(authenticationServiceProvider);

      final result = await authenticationService.signIn(
        email: email,
        password: password,
      );

      expect(result, false);
    });

    test(
        'but the jwt gotten from API is empty then it should be no call to secure storage or jwtStateProvider',
        () async {
      String jwt = '';

      when(
        () => mockedAuthenticationRepository.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer(
        (_) async => Future.value(jwt),
      );

      final container = createContainer(
        overrides: [
          authenticationRepositoryProvider
              .overrideWithValue(mockedAuthenticationRepository),
          secureStorageRepositoryProvider
              .overrideWithValue(mockedSecureStorageRepository),
        ],
      );

      final listener = Listener<String>();

      container.listen<String>(
        jwtStateProvider,
        listener,
        fireImmediately: true,
      );

      verify(() => listener(null, '')).called(1);

      verifyNoMoreInteractions(listener);

      final authenticationService =
          container.read(authenticationServiceProvider);

      await authenticationService.signIn(
        email: email,
        password: password,
      );

      verifyNever(() => mockedSecureStorageRepository.addData(any(), any()));

      verifyNever(() => listener('', jwt));
    });
  });

  group('failed signin call', () {
    test(
      'should throw failure exception',
      () async {
        when(
          () => mockedAuthenticationRepository.signIn(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Failure(message: 'message', stackTrace: StackTrace.empty));

        final container = createContainer(
          overrides: [
            authenticationRepositoryProvider
                .overrideWithValue(mockedAuthenticationRepository),
            secureStorageRepositoryProvider
                .overrideWithValue(mockedSecureStorageRepository),
          ],
        );

        final authenticationService =
            container.read(authenticationServiceProvider);

        expect(
          () => authenticationService.signIn(
            email: email,
            password: password,
          ),
          throwsA(isA<Failure>()),
        );
      },
    );
  });
}
