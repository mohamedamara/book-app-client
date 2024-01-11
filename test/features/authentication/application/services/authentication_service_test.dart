import 'package:books_app_client/core/models/failure.dart';
import 'package:books_app_client/core/providers/jwt_state_provider.dart';
import 'package:books_app_client/features/authentication/data/repositories/authentication_repository.dart';
import 'package:books_app_client/features/authentication/data/repositories/secure_storage_repository.dart';
import 'package:books_app_client/features/authentication/application/services/authentication_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/riverpod_test_helper.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockSecureStorageRepository extends Mock
    implements SecureStorageRepository {}

void main() {
  late AuthenticationRepository mockedAuthenticationRepository;
  late SecureStorageRepository mockedSecureStorageRepository;
  late ProviderContainer providerContainer;
  late AuthenticationService authenticationService;

  String email = "test@whatever.com";
  String password = "12345678";
  String jwt = "abcdefg";

  setUp(() {
    mockedAuthenticationRepository = MockAuthenticationRepository();
    mockedSecureStorageRepository = MockSecureStorageRepository();
    providerContainer = createContainer(
      overrides: [
        authenticationRepositoryProvider.overrideWithValue(
          mockedAuthenticationRepository,
        ),
        secureStorageRepositoryProvider.overrideWithValue(
          mockedSecureStorageRepository,
        ),
      ],
    );
    authenticationService = providerContainer.read(
      authenticationServiceProvider,
    );
  });

  group('Authentication service tests -', () {
    test(
        'When signin API call is successful Then complete the function normally',
        () async {
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

      expectLater(
        authenticationService.signIn(
          email: email,
          password: password,
          isStayLoggedInChecked: true,
        ),
        completes,
      );

      verify(
        () => mockedAuthenticationRepository.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).called(1);

      verifyNoMoreInteractions(mockedAuthenticationRepository);
      verifyNoMoreInteractions(mockedSecureStorageRepository);
    });

    test(
        'When signin API call is successful and isStayLoggedInChecked is true Then call secure storage repository to store the jwt',
        () async {
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

      await authenticationService.signIn(
        email: email,
        password: password,
        isStayLoggedInChecked: true,
      );

      verify(() => mockedSecureStorageRepository.addData(any(), any()))
          .called(1);

      verifyNoMoreInteractions(mockedSecureStorageRepository);
    });

    test(
        'When signin API call is successful and isStayLoggedInChecked is false Then no call to the secure storage repository should occur',
        () async {
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

      await authenticationService.signIn(
        email: email,
        password: password,
        isStayLoggedInChecked: false,
      );

      verifyNever(() => mockedSecureStorageRepository.addData(any(), any()));
    });

    test(
        'When signin API call is successful Then update jwt state with value gotten from API',
        () async {
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

      final listener = Listener<String>();

      providerContainer.listen<String>(
        jwtStateProvider,
        listener.call,
        fireImmediately: true,
      );

      verify(() => listener(null, '')).called(1);

      verifyNoMoreInteractions(listener);

      await authenticationService.signIn(
        email: email,
        password: password,
        isStayLoggedInChecked: true,
      );

      verify(() => listener('', jwt)).called(1);

      verifyNoMoreInteractions(listener);
    });

    test('When signin API call fails Then throw failure exception', () async {
      when(
        () => mockedAuthenticationRepository.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(
        Failure(message: 'message', stackTrace: StackTrace.empty),
      );

      expect(
        () => authenticationService.signIn(
          email: email,
          password: password,
          isStayLoggedInChecked: true,
        ),
        throwsA(isA<Failure>()),
      );
    });
  });
}
