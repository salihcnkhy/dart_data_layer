class MockResponse {
  final bool isSuccess;

  MockResponse({required this.isSuccess});

  factory MockResponse.fromMap(Map<String, dynamic> map) {
    return MockResponse(isSuccess: map["isSuccess"]);
  }
}
