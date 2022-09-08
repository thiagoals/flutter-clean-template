class Credentials{
  final String username;
  final String password;

  Credentials({required this.username, required this.password});

  Credentials from(String username, String password){
    return Credentials(username: username, password: password);
  }
}