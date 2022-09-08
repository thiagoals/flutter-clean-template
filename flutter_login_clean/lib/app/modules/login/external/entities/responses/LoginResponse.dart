class LoginResponse{
  late String token;

  LoginResponse();
  LoginResponse.fromToken({required this.token});

  factory LoginResponse.fromJson(Map<String,dynamic> json) => LoginResponse.fromToken(token: json["token"]);
}