class User {
  int cardCode;
  double cnpjCpf;
  String email;

  User(int cardCode, double cnpjCpf, String email) {
    this.cardCode = cardCode;
    this.cnpjCpf = cnpjCpf;
    this.email = email;
  }

  User.fromJson(Map json)
      : cardCode = json['cardCode'],
        cnpjCpf = json['cnpjCpf'],
        email = json['email'];

  Map toJson() {
    return {'cardCode': cardCode, 'cnpjCpf': cnpjCpf, 'email': email};
  }
}