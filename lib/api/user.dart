class Autogenerated {
  String cardCode;
  String cardName;
  String cardFName;
  String dataCadastro;
  String cnpjCpf;
  String dataNascimento;
  String email;
  String telefone1;
  String telefone2;
  String tipoLogradouro;
  String logradouro;
  String numero;
  String complemento;
  String pontoReferencia;
  String cep;
  String bairro;
  String cidade;
  String uf;

  Autogenerated(
      {this.cardCode,
        this.cardName,
        this.cardFName,
        this.dataCadastro,
        this.cnpjCpf,
        this.dataNascimento,
        this.email,
        this.telefone1,
        this.telefone2,
        this.tipoLogradouro,
        this.logradouro,
        this.numero,
        this.complemento,
        this.pontoReferencia,
        this.cep,
        this.bairro,
        this.cidade,
        this.uf});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    cardCode = json['cardCode'];
    cardName = json['cardName'];
    cardFName = json['cardFName'];
    dataCadastro = json['dataCadastro'];
    cnpjCpf = json['cnpjCpf'];
    dataNascimento = json['dataNascimento'];
    email = json['email'];
    telefone1 = json['telefone1'];
    telefone2 = json['telefone2'];
    tipoLogradouro = json['tipoLogradouro'];
    logradouro = json['logradouro'];
    numero = json['numero'];
    complemento = json['complemento'];
    pontoReferencia = json['pontoReferencia'];
    cep = json['cep'];
    bairro = json['bairro'];
    cidade = json['cidade'];
    uf = json['uf'];
  }

}