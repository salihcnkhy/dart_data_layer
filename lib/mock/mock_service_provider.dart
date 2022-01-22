import 'package:network_layer/mock/server_request.dart';
import 'package:network_layer/mock/server_response.dart';
import 'package:network_layer/network_layer.dart';
import 'package:network_layer/providers/request_provider.dart';

import 'mock_request.dart';
import 'mock_response.dart';

abstract class MockServiceProviderManagerInterface {
  SignInServiceProvider getTrySignInServiceProvider(MockRequest request);
}

class MockServiceProviderManager
    implements MockServiceProviderManagerInterface {
  @override
  SignInServiceProvider getTrySignInServiceProvider(MockRequest request) {
    return SignInServiceProvider(request);
  }
}

class SignInServiceProvider extends RequestProvider<MockResponse> {
  SignInServiceProvider(MockRequest request)
      : super(
            baseUrl: NetworkLayer.baseUrl,
            path: "/Auth/SignIn",
            mapper: (map) => MockResponse.fromMap(map),
            method: HttpMethod.post,
            requestData: request.toJson());
}
