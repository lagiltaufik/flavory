class AuthRedirectStorage {
  static String? _redirectPath;

  static void save(String path) {
    _redirectPath = path;
  }

  static String? get() {
    return _redirectPath;
  }

  static void clear() {
    _redirectPath = null;
  }
}
