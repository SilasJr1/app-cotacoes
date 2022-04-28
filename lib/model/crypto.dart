class Crypto {
  String codigo;
  String nome;

  Crypto(this.codigo, this.nome);

  //Transformar os dados no formato JSON em um objeto

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(json["currencyCode"], json["currencyName"]);
  }
}
