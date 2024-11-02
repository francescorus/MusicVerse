class AuthService {
  Future<bool> login(String username, String password) async {
    // Esegui la logica di login qui (es. chiamata a un'API)
    return username == 'user' && password == 'pass';
  }
}
