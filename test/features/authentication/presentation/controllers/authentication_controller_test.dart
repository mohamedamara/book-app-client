import 'package:books_app_client/core/models/failure.dart';
import 'package:books_app_client/features/authentication/presentation/controllers/authentication_controller.dart';
import 'package:books_app_client/features/authentication/presentation/enums/authentication_status.dart';
import 'package:books_app_client/features/authentication/application/services/authentication_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../core/utils/test_utils.dart';

class MockAuthenticationService extends Mock implements AuthenticationService {}

void main() {
  late AuthenticationService mockedAuthenticationService;
  late ProviderContainer providerContainer;

  String email = "test@whatever.com";
  String password = "12345678";
  bool isStayLoggedInChecked = true;

  setUp(() {
    mockedAuthenticationService = MockAuthenticationService();
    providerContainer = createContainer(
      overrides: [
        authenticationServiceProvider.overrideWithValue(
          mockedAuthenticationService,
        ),
      ],
    );
  });

  group('Authentication controller tests -', () {
    test(
        "Controller's initial state should be AsyncValue.data(AuthenticationStatus.unauthenticated)",
        () async {
      final listener = Listener<AsyncValue<AuthenticationStatus>>();

      providerContainer.listen<AsyncValue<AuthenticationStatus>>(
        authenticationControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      verify(() => listener(
            null,
            const AsyncValue.data(AuthenticationStatus.unauthenticated),
          )).called(1);

      verifyNoMoreInteractions(listener);
    });

    test(
        'When signin function completes normally Then the state should be in this order : AsyncValue.loading() -> AsyncValue.data(AuthenticationStatus.authenticated)',
        () async {
      final listener = Listener<AsyncValue<AuthenticationStatus>>();

      providerContainer.listen<AsyncValue<AuthenticationStatus>>(
        authenticationControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      verify(() => listener(
            null,
            const AsyncValue.data(AuthenticationStatus.unauthenticated),
          )).called(1);

      verifyNoMoreInteractions(listener);

      when(
        () => mockedAuthenticationService.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
          isStayLoggedInChecked: isStayLoggedInChecked,
        ),
      ).thenAnswer(
        (_) async {},
      );

      await providerContainer
          .read(authenticationControllerProvider.notifier)
          .signIn(
            email: email,
            password: password,
            isStayLoggedInChecked: isStayLoggedInChecked,
          );

      verify(
        () => mockedAuthenticationService.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
          isStayLoggedInChecked: isStayLoggedInChecked,
        ),
      ).called(1);

      verifyInOrder([
        () => listener(
              const AsyncValue.data(AuthenticationStatus.unauthenticated),
              const AsyncValue.loading(),
            ),
        () => listener(
              const AsyncValue.loading(),
              const AsyncValue.data(AuthenticationStatus.authenticated),
            ),
      ]);

      verifyNoMoreInteractions(listener);
    });

    test(
        'When signin function throws an exception Then the state should be in this order : AsyncValue.loading() -> AsyncValue.error(failure, failure.stackTrace)',
        () async {
      final listener = Listener<AsyncValue<AuthenticationStatus>>();

      providerContainer.listen<AsyncValue<AuthenticationStatus>>(
        authenticationControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      verify(() => listener(
            null,
            const AsyncValue.data(AuthenticationStatus.unauthenticated),
          )).called(1);

      verifyNoMoreInteractions(listener);

      Failure failure = Failure(
        message: 'message',
        stackTrace: StackTrace.empty,
      );

      when(
        () => mockedAuthenticationService.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
          isStayLoggedInChecked: isStayLoggedInChecked,
        ),
      ).thenThrow(failure);

      await providerContainer
          .read(authenticationControllerProvider.notifier)
          .signIn(
            email: email,
            password: password,
            isStayLoggedInChecked: isStayLoggedInChecked,
          );

      verify(
        () => mockedAuthenticationService.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
          isStayLoggedInChecked: isStayLoggedInChecked,
        ),
      ).called(1);

      verifyInOrder([
        () => listener(
              const AsyncValue.data(AuthenticationStatus.unauthenticated),
              const AsyncValue.loading(),
            ),
        () => listener(
              const AsyncValue.loading(),
              AsyncValue.error(failure, failure.stackTrace),
            ),
      ]);

      verifyNoMoreInteractions(listener);
    });
  });
}
