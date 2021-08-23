import 'package:clinica_agendamento/Model/contato.dart';
import 'package:clinica_agendamento/Model/contatoService.dart';
import 'package:clinica_agendamento/View/recursos/barraSuperio.dart';
import 'package:clinica_agendamento/View/recursos/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Perfil extends StatelessWidget {
  final int id;

  Perfil({ required this.id });

  
  final ContatoService service = new ContatoService();

  @override
  Widget build(BuildContext context) {
    // Objeto da classe Contato
    Contato contato = service.listarContatos().elementAt(this.id -1);

    return Scaffold(
      // Barra de Título
      appBar: new BarraSuperior(),

      
      drawer: new MenuDrawer(),

      
      body: new Container(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [                                        
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                new Text(
                  contato.nome + " " + contato.sobrenome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: 3,
                    wordSpacing: 3
                  )
                )
              ]
            ),

            SizedBox(height: 10),

            // Fone e E-mail
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Fone
                new Text(
                  contato.fone,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  )
                ),

                // E-mail
                new Text(
                  contato.email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                  )
                )
              ]
            ),

            // Divisor
            new Container(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              child: Divider(height: 5)
            ),

            // Ações
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [                            
                new Column(
                  children: [
                    new FaIcon(
                      FontAwesomeIcons.solidCommentDots,
                      color: Colors.blue,
                      size: 28,
                    ),

                    SizedBox(height: 15),

                    new Text(
                      "Mensagem",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18
                      )
                    )
                  ]
                ),

                
               
                new Column(
                  children: [
                    new FaIcon(
                      FontAwesomeIcons.solidEnvelope,
                      color: Colors.blue,
                      size: 28,
                    ),

                    SizedBox(height: 15),

                    new Text(
                      "E-mail",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18
                      )
                    )
                  ]
                ),
              ]
            )
          ],
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.pen),
        onPressed: () {
          //
        }
      )
    );
  }
}