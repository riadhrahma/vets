import 'package:vets_project/features/authentication/domain/entities/client_entity.dart';

abstract class ClientSignupEvent {}

class Signup extends ClientSignupEvent {
  final ClientEntity clientEntity;
  final String password;

  Signup(this.clientEntity, this.password);
}

class UpdateClient extends ClientSignupEvent {
  final ClientEntity clientEntity;

  UpdateClient(
    this.clientEntity,
  );
}
