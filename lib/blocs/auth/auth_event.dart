abstract class AuthEvent {}

class AuthSubmitted extends AuthEvent {
  final String email;
  final String password;
  AuthSubmitted(this.email, this.password);
}
