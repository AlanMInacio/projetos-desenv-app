import 'package:clinica_agendamento/View/buscar.dart';
import 'package:clinica_agendamento/View/cadastro.dart';
import 'package:clinica_agendamento/View/recursos/barraSuperio.dart';
import 'package:clinica_agendamento/View/recursos/menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  State createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new BarraSuperior(),

      drawer: new MenuDrawer(),

      body: SingleChildScrollView(
        child: Column(
          children: [

            Image.asset("img/santo.png"),

            new SizedBox(height: 25), // Espaçamento

            new Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  // Título
                  new Text(
                    "Agendar Consultas",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue
                    )
                  ),

                  new SizedBox(height: 45), // Espaçamento

                  // Botão Buscar Contatos
                  new Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              new FaIcon(
                                FontAwesomeIcons.search,
                                color: Colors.white,
                                size: 24
                              ),

                              new Text(
                                "Buscar Consultas",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24
                                )
                              ),
                            ],
                          )
                        ),
                        
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => new Busca())
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue
                        )
                      );
                    }
                  ),

                  SizedBox(height: 15),

                  // Botão Cadastrar Contato
                  new Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              new FaIcon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                                size: 24
                              ),

                              new Text(
                                "Agendar Consulta",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24
                                )
                              ),
                            ],
                          )
                        ),
                        
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => new Cadastro()
                            )
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue
                        )
                      );
                    }
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}