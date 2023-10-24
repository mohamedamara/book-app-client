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
  String jwt = "abcdefg";

  setUp(() {
    mockedAuthenticationRepository = MockAuthenticationRepository();
    mockedSecureStorageRepository = MockSecureStorageRepository();
  });

  group('Given successful API call When signin', () {
    test('Then complete the function normally', () async {
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

      final authenticationService = container.read(
        authenticationServiceProvider,
      );

      expectLater(
        authenticationService.signIn(
          email: email,
          password: password,
        ),
        completes,
      );
    });

    test('Then call secure storage repository to store the jwt', () async {
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

      final authenticationService = container.read(
        authenticationServiceProvider,
      );

      await authenticationService.signIn(
        email: email,
        password: password,
      );

      verify(() => mockedSecureStorageRepository.addData(any(), any()))
          .called(1);
    });

    test('Then update jwt state with value gotten from API', () async {
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

      final authenticationService = container.read(
        authenticationServiceProvider,
      );

      await authenticationService.signIn(
        email: email,
        password: password,
      );

      verify(() => listener('', jwt)).called(1);

      verifyNoMoreInteractions(listener);
    });
  });

  group('Given failed API call When signin', () {
    test(
      'Then throw failure exception',
      () async {
        when(
          () => mockedAuthenticationRepository.signIn(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(
          Failure(message: 'message', stackTrace: StackTrace.empty),
        );

        final container = createContainer(
          overrides: [
            authenticationRepositoryProvider
                .overrideWithValue(mockedAuthenticationRepository),
            secureStorageRepositoryProvider
                .overrideWithValue(mockedSecureStorageRepository),
          ],
        );

        final authenticationService = container.read(
          authenticationServiceProvider,
        );

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
