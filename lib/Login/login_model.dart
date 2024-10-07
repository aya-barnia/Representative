class ModelLogin{

  late String email;
  late String password;
  Future<Map<String,dynamic>>logintojson()async {
    print("jsonn ");
    return {
      'email': email,
      'password': password,
    };
  }


}
