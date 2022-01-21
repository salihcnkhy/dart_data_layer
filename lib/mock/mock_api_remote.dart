import 'package:data_layer_base/base/base_api_remote.dart';
import 'package:network_layer/mock/server_request.dart';
import 'package:network_layer/mock/server_response.dart';
import 'package:network_layer/network_layer.dart';
import 'mock_service_provider.dart';

abstract class MockApiRemoteInterface {
  Future<MockBaseResponse> trySignIn(SignInRequest request);
}

class MockApiRemote extends BaseApiRemote<MockServiceProviderManagerInterface>
    implements MockApiRemoteInterface {
  MockApiRemote(MockServiceProviderManagerInterface serviceProvider)
      : super(
            serviceProvider: serviceProvider,
            networkManager: NetworkLayer.networkManager);

  @override
  Future<MockBaseResponse> trySignIn(SignInRequest request) {
    final serviceRequest = serviceProvider.getTrySignInServiceProvider(request);
    return networkManager.execute(serviceRequest);
  }
}
