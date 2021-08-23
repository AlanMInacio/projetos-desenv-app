import 'package:clinica_agendamento/View/home.dart';
import 'package:clinica_agendamento/View/recursos/estilo.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    title: "Clinica Sta Barbara",
    home: new Home(),
    debugShowCheckedModeBanner: false,
    theme: estilo(),
  )
);