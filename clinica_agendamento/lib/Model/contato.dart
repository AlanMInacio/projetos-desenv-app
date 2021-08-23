import 'package:flutter/src/widgets/editable_text.dart';

class Contato {
  int id;
  String nome;
  String sobrenome;
  String email;
  String fone;
  String consulta;
  String horario;

  Contato({
    required this.id, // required == obrigatório
    required this.nome,
    required this.sobrenome,
    required this.email,
    required this.fone,
    required this.consulta,
    required this.horario
  });
}
