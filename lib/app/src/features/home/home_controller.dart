import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  // Aggiungi qui variabili e metodi di logica
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
