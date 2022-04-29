class Currency {
  String codigo;
  String nome;

  Currency(this.codigo, this.nome);

  //Transformar os dados no formato JSON em um objeto

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(json["currencyCode"], json["currencyName"]);
  }
}
