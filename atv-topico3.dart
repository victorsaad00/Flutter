/*

Heranca: Objetos abaixo na hierarquia irão herdar características e atributos de todos os objetos "acima" dele (da classe a qual o objeto esta hardando). No exemplo, temos que a classe Dog herda as caracteristicas da classe Animal, como genero, local onde vive e sua classe.

Encapsulamento: Proteger metodos e atributos de uma classe para que elas não possam ser alteradas fora da classe, no caso, evita alterações por outras partes do algoritmo. Por exemplo, na classe Tiger, temos String _breed, que esta protegida do "mundo externo".

Abstração: É o conceito e abstrair algo do mundo real para a programação, assim, cada classe tem uma identidade, propriedades e ações diferentes que retomam algo do mundo externo. É o conceito principal das linguagens Orientadas à Objetos Por exemplo, na classe Dog temos o método ( que representa uma ação por assim dizer) makeNoise que seria o latido do cachorro.

Polimorfismo: É o conceito de uma classe ter métodos que são herdados de classes superiores porém, para essa classe, o método age de forma diferente através da sobrescrição desse método. Esse método pode ter um retorno diferente (mas não tipo de retorno diferente - se a classe pai retorna String, a sobrescrição do metodo deve retornas uma String), uma aplicação diferente, etc. Por exemplo, o método makeNoise trabalha de forma diferente para todas as classes. 


fontes:
https://www.guj.com.br/t/definicoes-sobre-orientacao-a-objetos/321141
https://www.devmedia.com.br/os-4-pilares-da-programacao-orientada-a-objetos/9264
"Java OOPs Concepts | Object Oriented Programming | Java Tutorial For Beginners | Edureka" : https://www.youtube.com/watch?v=7GwptabrYyk

*/

class Animal {
  String _livelyhood;
  String _gender;
  String _aClass;

  Animal(this._livelyhood, this._gender, this._aClass);

  String makeNoise() {
    return "Every Animal makes noise!";
  }

  void setLivelyhood(String livelyhood) {
    this._livelyhood = livelyhood;
  }

  void setGender(String gender) {
    this._gender = gender;
  }

  String getLivelyhood() {
    return this._livelyhood;
  }

  String getGender() {
    return this._gender;
  }

  String setAClass(String aClass) {
    this._aClass = aClass;
  }

  String getAClass() {
    return this._aClass;
  }
}

class Dog extends Animal {
  String _name;
  String _breed;
  String _hairColor;

  Dog(String livelyhood, String gender, this._name, String aClass)
      : super(livelyhood, gender, aClass);

  @override
  String makeNoise() {
    return "Woooolf! Wooolf!";
  }
}

class Tiger extends Animal {
  String _hairColour;
  String _breed;

  Tiger(String livelyhood, String gender, this._breed, this._hairColour,
      String aClass)
      : super(livelyhood, gender, aClass);

  @override
  String makeNoise() {
    return "Grooooararrrrr";
  }
}
