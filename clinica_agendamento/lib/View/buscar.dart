import 'package:clinica_agendamento/Model/contato.dart';
import 'package:clinica_agendamento/Model/contatoService.dart';
import 'package:clinica_agendamento/View/cadastro.dart';
import 'package:clinica_agendamento/View/perfil.dart';
import 'package:clinica_agendamento/View/recursos/barraSuperio.dart';
import 'package:clinica_agendamento/View/recursos/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Busca extends StatefulWidget {
  @override
  State createState() => new BuscaState();
}

class BuscaState extends State<Busca> {
  // Objeto da classe ContatoService (Model)
  ContatoService service = new ContatoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new BarraSuperior(),

      drawer: new MenuDrawer(),

      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 75),
        itemCount: service.listarContatos().length,
        itemBuilder: (BuildContext context, int index) {
          // Guarda o retorno da lista no objeto da classe
          Contato contato = service.listarContatos().elementAt(index);

          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [                              
                  
                  new Column(
                    children: [
                      new Text(
                        contato.nome + " " + contato.sobrenome,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 24
                        )
                      ),

                      SizedBox(height: 10),

                      new Text(
                        contato.fone,
                        style: TextStyle(
                          fontSize: 18
                        )
                      )
                    ],
                  ),

                  SizedBox(width: 15)
                ]
              ),

              trailing: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.blue,
                  size: 32
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => new Perfil(id: contato.id)
                    )
                  );
                }
              )
            )
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        child: FaIcon(
          FontAwesomeIcons.plus,
          size: 32
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => new Cadastro()
            )
          );
        }
      )
    );
  }
}

