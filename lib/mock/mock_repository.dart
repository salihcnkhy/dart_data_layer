import 'package:data_layer_base/base/base_repository.dart';
import 'package:data_layer_base/mock/mock_request.dart';
import 'package:network_layer/mock/server_request.dart';
import 'package:network_layer/mock/server_response.dart';

import 'mock_api_remote.dart';
import 'mock_response.dart';

abstract class MockRepositoryInterface {
  Future<MockResponse> trySignIn(MockRequest request);
}

class MockRepository extends BaseRepository<MockApiRemoteInterface>
    implements MockRepositoryInterface {
  MockRepository(MockApiRemoteInterface apiRemote)
      : super(apiRemote: apiRemote);

  @override
  Future<MockResponse> trySignIn(MockRequest request) {
    return apiRemote.trySignIn(request);
  }
}
