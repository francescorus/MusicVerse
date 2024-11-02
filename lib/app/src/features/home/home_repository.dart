class HomeRepository {
  // Qui puoi aggiungere chiamate API o database per ottenere dati
  Future<String> fetchData() async {
    // Simulazione di una chiamata a un'API
    await Future.delayed(Duration(seconds: 2));
    return 'Dati ottenuti dal server!';
  }
}
