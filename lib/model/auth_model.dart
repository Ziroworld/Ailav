class AuthModel {
  static const Map<String, String> users = {
    'admin': 'admin123', // Admin credentials
    'customer': 'customer123', // Customer credentials
  };

  static String? authenticate(String username, String password) {
    if (users.containsKey(username) && users[username] == password) {
      return username; // Return the role
    }
    return null; // Invalid credentials
  }
}
