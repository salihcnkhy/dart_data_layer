import 'package:network_layer/mock/server_request.dart';
import 'package:network_layer/mock/server_response.dart';
import 'package:network_layer/network_layer.dart';
import 'package:network_layer/providers/request_provider.dart';

abstract class MockServiceProviderManagerInterface {
  SignInServiceProvider getTrySignInServiceProvider(SignInRequest request);
}

class MockServiceProviderManager
    implements MockServiceProviderManagerInterface {
  @override
  SignInServiceProvider getTrySignInServiceProvider(SignInRequest request) {
    return SignInServiceProvider(request);
  }
}

class SignInServiceProvider extends RequestProvider<MockBaseResponse> {
  SignInServiceProvider(SignInRequest request)
      : super(
            baseUrl: NetworkLayer.baseUrl,
            path: "/Auth/SignIn",
            mapper: (map) => MockBaseResponse.fromMap(map),
            method: HttpMethod.post,
            requestData: request.toJson());
}
