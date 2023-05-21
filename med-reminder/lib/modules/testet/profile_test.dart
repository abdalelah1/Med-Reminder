
class profile {
  bool checkLogIn({required String email, required String password}) {
    if (email == 'ataleb' && password == 'ataleb')
      return true;
    else
      return false;
  }
}
