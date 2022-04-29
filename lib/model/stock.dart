class Stock {
  String codigo;
  String nome;

  Stock(this.codigo, this.nome);

  //Transformar os dados no formato JSON em um objeto

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(json["ticker"], json["name"]);
  }
}
