import 'package:clinica_agendamento/Model/contato.dart';
import 'package:clinica_agendamento/Model/contatoService.dart';
import 'package:clinica_agendamento/View/buscar.dart';
import 'package:clinica_agendamento/View/recursos/barraSuperio.dart';
import 'package:clinica_agendamento/View/recursos/menu.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  State createState() => new CadastroState();
}

class CadastroState extends State<Cadastro> {
  // Controladores dos campos Input
  final nome = TextEditingController();
  final sobrenome = TextEditingController();
  final email = TextEditingController();
  final fone = TextEditingController();
  final consulta = TextEditingController();
  final horario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new BarraSuperior(),
      drawer: new MenuDrawer(),
      body: SingleChildScrollView(
        
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 35),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
              new Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 15),
                child: Text(
                  "Agendar Consulta",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  )
                )
              ),

              
              campoInput("Nome", nome),
              campoInput("Sobrenome", sobrenome),
              campoInput("E-mail", email),
              campoInput("Telefone", fone),
              campoInput("Consulta", consulta),
              campoInput("Horário", horario),

              SizedBox(height: 15),

              
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  new Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10
                          ),
                          child: Text(
                            "Cadastrar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            )
                          )
                        ),

                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade300
                        ),
                        
                        onPressed: () {
                          cadastrar();
                        }
                      );
                    }
                  ),

                  // Botão Limpar
                  new Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10
                          ),
                          child: Text(
                            "Limpar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                            )
                          )
                        ),

                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue.shade300
                        ),
                        
                        onPressed: () {
                          limparCampos();
                        }
                      );
                    }
                  ),
                ]
              ),
            ]
          )
        )
      )
    );
  } // fecha BUILD

  Container campoInput(String nomeCampo, TextEditingController controlador) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: TextField(
       
        controller: controlador,

        decoration: InputDecoration(
          labelText: nomeCampo, // Nome do campo
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 18
          ),

          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          )
        )
      )
    );
  }

  void cadastrar() {
    ContatoService service = new ContatoService();
    
    int ultimoID = service.listarContatos().length;

    Contato contato = new Contato(
      id: ultimoID,
      nome: nome.text,
      sobrenome: sobrenome.text,
      email: email.text,
      fone: fone.text,
      consulta: consulta.text,
      horario: horario.text       
      
    );

    String mensagem = service.cadastrarContato(contato);
    
    ScaffoldMessenger.of(context).showSnackBar(
      new SnackBar(
        content: Text(
          mensagem,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black
          ),
        ),
        duration: Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.white
      )
    );

    Future.delayed(
      Duration(milliseconds: 2500), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => new Busca()
          )
        );
      }
    );
  }

  void limparCampos() {
    this.nome.text = "";
    this.sobrenome.text = "";
    this.email.text = "";
    this.fone.text = "";
    this.consulta.text = "";
    this.horario.text = "";
    
  }
}