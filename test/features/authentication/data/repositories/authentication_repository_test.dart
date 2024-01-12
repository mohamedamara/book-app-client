import 'package:books_app_client/core/exceptions/failure.dart';
import 'package:books_app_client/core/providers/dio_provider.dart';
import 'package:books_app_client/features/authentication/data/repositories/authentication_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/dio_http_client_response_test_helper.dart';
import '../../../../test_helpers/riverpod_test_helper.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio mockedDio;
  late ProviderContainer providerContainer;
  late AuthenticationRepository authenticationRepository;

  String email = "test@whatever.com";
  String password = "12345678";
  String jwt = "abcdefg";

  setUp(() {
    mockedDio = MockDio();
    providerContainer = createContainer(
      overrides: [
        dioProvider.overrideWithValue(
          mockedDio,
        ),
      ],
    );
    authenticationRepository = providerContainer.read(
      authenticationRepositoryProvider,
    );
  });

  group('Authentication repository tests -', () {
    test(
      'When signin API call is successful Then return jwt',
      () async {
        when(
          () => mockedDio.post(
            any(),
            data: any(named: 'data'),
          ),
        ).thenAnswer(
          (_) async => Future.value(
            dioClientSuccessfulHttpResponse(
              responseData: {
                'jwt': jwt,
              },
            ),
          ),
        );

        var response = await authenticationRepository.signIn(
          email: email,
          password: password,
        );

        expect(response, jwt);

        verify(
          () => mockedDio.post(
            any(),
            data: any(named: 'data'),
          ),
        ).called(1);

        verifyNoMoreInteractions(mockedDio);
      },
    );

    test(
      'When signin API call fails Then throw failure exception',
      () async {
        when(
          () => mockedDio.post(
            any(),
            data: any(named: 'data'),
          ),
        ).thenThrow(
          dioClientFailedHttpResponse(),
        );

        expect(
          () => authenticationRepository.signIn(
            email: email,
            password: password,
          ),
          throwsA(isA<Failure>()),
        );

        verify(
          () => mockedDio.post(
            any(),
            data: any(named: 'data'),
          ),
        ).called(1);

        verifyNoMoreInteractions(mockedDio);
      },
    );
  });
}
