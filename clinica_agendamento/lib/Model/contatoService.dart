import 'package:clinica_agendamento/Model/contato.dart';

class ContatoService {
  // Lista de Contatos (GLOBAL)
  static List<Contato> contatos = [];

  // Método para cadastrar um Contato
  String cadastrarContato(Contato contato) {
    contatos.add(contato);

    return "Novo Consulta: ${contato.nome} ${contato.sobrenome}, ${contato.consulta}";
  }

  List listarContatos() {


    return contatos;
  }
}