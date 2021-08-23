import 'package:clinica_agendamento/View/buscar.dart';
import 'package:clinica_agendamento/View/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuDrawer extends StatelessWidget {
  // Atributos vindos do Banco de Dado (simulação)
  final String usuario = "Alan Moura";
  final String email = "alan@gmail.com";
  final String fotoPerfil = "img/perfil.jpg";

  Text mostrarTitulo(String texto) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: 18
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          new UserAccountsDrawerHeader(
            accountName: Text(usuario),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              child: ClipRRect(
                child: Image.asset(fotoPerfil),
                borderRadius: BorderRadius.circular(50)
              )
            )
          ),

          new ListTile(
            title: mostrarTitulo("Home"),
            subtitle: Text("Página inicial"),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.home,
              color: Colors.orange.shade400,              
              size: 32
            ),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new Home())
              );
            }
          ),

          new ListTile(
            title: mostrarTitulo("Conta"),
            subtitle: Text("Meus Agendamentos"),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.userFriends,
              color: Colors.blue.shade400,
              size: 32
            ),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new Busca())
              );
            }
          ),

      
          
          
          new ListTile(
            title: mostrarTitulo("Logout"),
            subtitle: Text("Sair do Sistema"),
            trailing: FaIcon(FontAwesomeIcons.chevronRight),
            leading: FaIcon(
              FontAwesomeIcons.signOutAlt,
              color: Colors.grey,
              size: 32
            ),

            onTap: () {
              //
            }
          )
        ]
      )
    );
  }
}