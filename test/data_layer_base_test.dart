import 'package:data_layer_base/mock/mock_api_remote.dart';
import 'package:data_layer_base/mock/mock_repository.dart';
import 'package:data_layer_base/mock/mock_request.dart';
import 'package:data_layer_base/mock/mock_response.dart';
import 'package:data_layer_base/mock/mock_service_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_layer/network_layer.dart';

void main() {
  final serviceProviderManager = MockServiceProviderManager();
  final apiRemote = MockApiRemote(serviceProviderManager);
  final repository = MockRepository(apiRemote);

  test('success response', () async {
    NetworkLayer.baseUrl = "https://hesabinibil.azurewebsites.net/api";
    final request = MockRequest(email: "test@test.com", password: "123456");
    final result = await repository.trySignIn(request);
    expect(true, result.isSuccess);
  });

  test('failed response', () async {
    NetworkLayer.baseUrl = "https://hesabinibil.azurewebsites.net/api";
    final request = MockRequest(email: "test@test.com", password: "");
    final result = await repository.trySignIn(request);
    expect(false, result.isSuccess);
  });

  test('throw error response', () async {
    NetworkLayer.baseUrl = "";
    final request = MockRequest(email: "test@test.com", password: "");
    final result = await repository.trySignIn(request).catchError((error) {
      return MockResponse(isSuccess: false);
    });
    expect(false, result.isSuccess);
  });
}
