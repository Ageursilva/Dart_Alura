void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e cítrica";
  int diasDesdeColheita = 40;
  bool? isMadura;

  if (diasDesdeColheita >= 30) {
    isMadura = true;
  } else {
    isMadura = false;
  }
  Legumes Mandioca = Legumes('Mandioca', 100, 'Marrom', true);
  Fruta Banana = Fruta('Banana', 200, 'Amarela', 'doce', 1000);
  Nozes Macadamia = Nozes('Macadamia', 10, 'Branco amarelado', 'Doce', 20, 35);
  Citricas Limao = Citricas('Limão', 5, 'Verde', 'Azedo', 5, 9);

  Mandioca.printAlimento();
  Banana.printAlimento();
  Macadamia.printAlimento();
  Limao.printAlimento();
  Mandioca.Cozinhar();
  Limao.fazerSuco();
  Banana.separarIngrediente();
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print(
        "A sua $Fruta foi colhida a $diasDesdeColheita, e precisa de $diasDesdeColheita para poder comer. Portando ela esta madura? $isMadura");
  }

  void fazerSuco() {
    print('Você fez um ótimo suco de $nome');
  }

  @override
  void separarIngrediente() {
    print("Pegar as frutas.");
  }

  @override
  void fazerMassa() {
    print('Fazer a massa');
  }

  @override
  void assar() {
    print('Levar os fonro e assar a massa.');
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;
  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print('Este(a) $Alimento pesa $peso gramas e é $cor');
  }
}

class Legumes extends Alimento implements Bolo {
  bool IsPrecisaCozinhar;
  Legumes(String nome, double peso, String cor, this.IsPrecisaCozinhar)
      : super(nome, peso, cor);
  void Cozinhar() {
    if (IsPrecisaCozinhar) {
      print('Pronto, o $nome esta cozinhando!');
    } else {
      print('Nem precisa cozinhar o $nome');
    }
  }

  @override
  void assar() {
    // TODO: implement assar
  }

  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
  }

  @override
  void separarIngrediente() {
    // TODO: implement separarIngrediente
  }
}

class Citricas extends Fruta {
  double nivelAzeda;
  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzeda)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print('Existe refri de $nome');
    } else {
      print('Não existe refri de $nome');
    }
  }
}

class Nozes extends Fruta {
  double porcetagemOleoNatural;
  Nozes(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcetagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa() {
    print('Tirar a casca');
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngrediente();

  void fazerMassa();

  void assar();
}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome não está madura.");
  }

  if (cor != null) {
    print("A $nome é $cor.");
  }
}

int funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}
