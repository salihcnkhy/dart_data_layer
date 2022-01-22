class MockRequest {
  final String email;
  final String password;

  MockRequest({required this.email, required this.password});
  Map<String, dynamic> toJson() {
    return {"email": email, "password": password};
  }
}
