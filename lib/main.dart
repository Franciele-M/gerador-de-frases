import 'dart:math';
import 'package:flutter/material.dart';

//app de frases aleatórias utilizando array

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Gerador de Frases',
    home: frases(),
  ));
}


class frases extends StatefulWidget {
  const frases({Key? key}) : super(key: key);

  @override
  State<frases> createState() => _frasesState();
}

class _frasesState extends State<frases> {

  //Random (nome da class), random (nome da variável), Random() -> (é chamado para criar uma nova instância que é atribuída a variável random )
  //random = aleatório, intância = é um objeto que foi criado a partir de uma class
  Random random = Random();

  //gera um número aleatório que seleciona o conteúdo da lista; nextInt = próximo número/conteúdo em (Listafrases.tamanho)
  int index = 0;

  //definindo o nome da lista ("Listafrases"); aspas simples para dicionar a frase;
  //lista do tipo string chamada "Listafrases"
  List<String> Listafrases = [
    '\n  \n"A arte começa onde a imitação acaba."       \n        Oscar Wilde',
    '\n  \n“Grandes realizações não são feitas por impulso, mas por uma soma de pequenas realizações."                                                Vicent Van Gogh',
    '\n  \n"Numa galeria de arte, dizia uma senhora de idade em voz alta:\n - Que horror! Que coisa tão feia! Que mal pintado! Este retrato nem merecia estar numa exposição destas! \n Apercebendo-se dos comentários,uma funcionária da galeria aproxima-se da senhora e esclarece: \n - Isso não é uma pintura! \n -Ah, não?! Então o que é?! – Pergunta espantada a mulher. \n Responde a funcionária: \n - É um espelho',
    '\n  \n“Consciência é a bússola de um homem."                                                               Vicent Van Gogh',
    '\n  \n"Jamais o sol vê a sombra."                                                           Leonardo da Vinci',
    '\n  \n"Se você perdeu dinheiro, perdeu pouco. Se perdeu a honra, perdeu muito. Se perdeu a coragem, perdeu tudo."                                                Vicent Van Gogh',
    '\n  \n"A única maneira de fazer um bom trabalho é amar o que você faz."                                 Steve Jobs',
    '\n  \n"A beleza está nos olhos de quem vê."                                                           Oscar Wilde',
    '\n  \n"Não tenha medo de falhar. Tenha medo de não tentar."                                   Michael Jordan',
    '\n  \n"A música é a linguagem universal da humanidade."                                    Yo-Yo Ma',
    '\n  \n"Seja você mesmo, porque todos os outros já estão ocupados sendo outra pessoa."                                   Oscar Wilde',
    '\n  \nO processo é árduo, mas o resultado é revigorante',

  ];

  //tipo string "fraseAtual" (frase que aparecerá quando clicar no botão 'gerar') = vazio
  String fraseAtual = '\n  \nClique no botão para gerar uma frase';

  void gerarFrase() {
    index = random.nextInt(Listafrases.length);

    //setState = É atribuído uma nova frase (que está em Listafrases) de forma anônima para fraseAtual
    // fraseAtual recebe index (valor da variável) que está em Listafrases
    setState(() {
      fraseAtual = Listafrases[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //menu
      appBar: AppBar(
        title: Text('\nFrases Artísticas\n'),
        backgroundColor: Colors.black, //cor do appbar
      ),
      body: SingleChildScrollView(
        child: Center(//centraliza o body
          child: Container(
            //cor whitesmoke pro body
            color: Color(0xFFF5F5F5),
            //distância da imagem pro body, menu e botão
            padding: EdgeInsets.all(19), //espaçamento appbar para body
            child: Column( //deixa os elementos na vertical
              mainAxisAlignment: MainAxisAlignment.spaceAround, //spaceAround = entre os espaços//
              crossAxisAlignment: CrossAxisAlignment.center, //centraliza o espaçamento
              children: <Widget>[
                //imagem
                Image.asset('img/logo.PNG'),
                Text(
                  fraseAtual,
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 26),
                child: ElevatedButton(//botão para gerar frases
                  onPressed: gerarFrase,

                  child: Text('Gerar Frase',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                    ),
                  ),

                  //cor do botão
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                ),
                )


              ],
            ),
          ),
        ),),
    );
  }
}