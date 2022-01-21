import 'package:data_layer_base/base/base_repository.dart';
import 'package:network_layer/mock/server_request.dart';
import 'package:network_layer/mock/server_response.dart';

import 'mock_api_remote.dart';

abstract class MockRepositoryInterface {
  Future<MockBaseResponse> trySignIn(SignInRequest request);
}

class MockRepository extends BaseRepository<MockApiRemoteInterface>
    implements MockRepositoryInterface {
  MockRepository(MockApiRemoteInterface apiRemote)
      : super(apiRemote: apiRemote);

  @override
  Future<MockBaseResponse> trySignIn(SignInRequest request) {
    return apiRemote.trySignIn(request);
  }
}
